using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;
using CleanApartments.BusinessLogic.ApartmentServices;
using CleanApartments.BusinessLogic.LocationServices;
using CleanApartments.Common.Dtos;
using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using Microsoft.AspNetCore.Mvc;

namespace CleanApartments.Controllers
{
    public class ApartmentController : Controller
    {
        private readonly IApplicationUnitOfWork unitOfWork;
        private readonly ILocationService locationService;
        private readonly IApartmentService apartmentService;

        public ApartmentController(IApplicationUnitOfWork unitOfWork, ILocationService locationService, IApartmentService apartmentService)
        {
            this.unitOfWork = unitOfWork;
            this.locationService = locationService;
            this.apartmentService = apartmentService;
        }

        public IActionResult Index()
        {
            List<Location> locations = unitOfWork.LocationRepository.GetLocations();
            List<Apartment> cleanedApartments = apartmentService.GetAllCleanedApartments();
            dynamic model = new ExpandoObject();
            model.Locations = locations;
            model.CleanedApartments = cleanedApartments;
            return View(model);
        }

        public PartialViewResult ApartmentList(int id)
        {
            List<Apartment> apartments = apartmentService.GetLocationApartments(id);
            return PartialView("_ApartmentsList", apartments);
        }

        public PartialViewResult ApartmentDetails(int apartmentId)
        {
            Apartment apartment = apartmentService.GetApartment(apartmentId);
            ApartmentCleaningDto dto = new ApartmentCleaningDto();
            dto.ApartmentId = apartmentId;
            dto.Name = apartment.Name;
            return PartialView("_ApartmentCleaningActivity", dto);
        }

        public IActionResult CreateCleaningActivity(ApartmentCleaningDto cleaningDto)
        {
            ApartmentCleaningActivity cleaningActivity = new ApartmentCleaningActivity();
            Apartment apartment = apartmentService.GetApartment(cleaningDto.ApartmentId);
            apartment.Status = Common.Enums.ApartmentStatus.Cleaned;
            unitOfWork.ApartmentRepository.Update(apartment);

            cleaningActivity.Apartment = apartment;
            cleaningActivity.HasIssuesToReport = cleaningDto.HasIssuesToReport;
            cleaningActivity.Notes = cleaningDto.Notes;

            unitOfWork.ApartmentCleaningRepository.Add(cleaningActivity);
            unitOfWork.SaveChanges();

            List<Location> locations = unitOfWork.LocationRepository.GetLocations();

            return RedirectToAction("Index");

        }

        public IActionResult CleanApartmentAgain(int apartmentId)
        {
            Apartment apartment = apartmentService.GetApartment(apartmentId);
            apartment.Status = Common.Enums.ApartmentStatus.AwaitingCleaning;
            unitOfWork.ApartmentRepository.Update(apartment);
            return Json(new { redirectToUrl = Url.Action("Index", "Apartment") });
        }


    }
}
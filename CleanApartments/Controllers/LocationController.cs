using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CleanApartments.BusinessLogic.ApartmentServices;
using CleanApartments.BusinessLogic.LocationServices;
using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using Microsoft.AspNetCore.Mvc;

namespace CleanApartments.Controllers
{
    public class LocationController : Controller
    {
        private readonly IApplicationUnitOfWork unitOfWork;
        private readonly ILocationService locationService;
        public LocationController(IApplicationUnitOfWork unitOfWork, ILocationService locationService)
        {
            this.unitOfWork = unitOfWork;
            this.locationService = locationService;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetLocations()
        {
            return new JsonResult(unitOfWork.LocationRepository.GetLocations());
        }

        
    }
}
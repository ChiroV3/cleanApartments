using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CleanApartments.BusinessLogic.ApartmentServices
{
    public class ApartmentService : IApartmentService
    {
        private readonly IApplicationUnitOfWork unitOfWork;

        public ApartmentService(IApplicationUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        public List<Apartment> GetLocationApartments(int locationId)
        {
            return unitOfWork.ApartmentRepository.GetLocationApartments(locationId).Where(x=>x.Status == Common.Enums.ApartmentStatus.AwaitingCleaning).ToList();
        }

        public List<Apartment> GetAllCleanedApartments()
        {
            return unitOfWork.ApartmentRepository.GetAll().Where(x => x.Status == Common.Enums.ApartmentStatus.Cleaned).ToList();

        }

        public Apartment GetApartment(int apartmentId)
        {
            return unitOfWork.ApartmentRepository.Get(apartmentId);
        }
    }
}

using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.BusinessLogic.LocationServices
{
    public class LocationService : ILocationService
    {
        private readonly IApplicationUnitOfWork unitOfWork;

        public LocationService(IApplicationUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        public List<Location> GetLocations()
        {
            return unitOfWork.LocationRepository.GetLocations();
        }

        public void AddLocation(Location location)
        {
            unitOfWork.LocationRepository.Add(location);
        }

        public void DeleteLocation(int locationId)
        {
            unitOfWork.LocationRepository.Delete(locationId);
        }

        public void UpdateLocation(Location location)
        {
            unitOfWork.LocationRepository.Add(location);
        }
    }
}

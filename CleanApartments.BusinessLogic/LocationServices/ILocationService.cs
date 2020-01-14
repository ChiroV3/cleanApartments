using CleanApartments.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.BusinessLogic.LocationServices
{
    public interface ILocationService
    {
        List<Location> GetLocations();
        void AddLocation(Location location);
        void UpdateLocation(Location location);
        void DeleteLocation(int locationId);
    }
}

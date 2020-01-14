using CleanApartments.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public interface ILocationRepository
    {
        List<Location> GetLocations();
        Location Add(Location location);

        void Update(Location location);

        void Delete(int id);
    }
}

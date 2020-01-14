using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public class LocationRepository : ILocationRepository
    {
        private CleanApartmentsDbContext _context;

        public LocationRepository(CleanApartmentsDbContext context)
        {
            _context = context;
        }

        public List<Location> GetLocations()
        {
            return _context.Locations.Include(x => x.Apartments).ToList();
        }

        public Location Add(Location location)
        {
            _context.Locations.Add(location);
            _context.SaveChanges();
            return location;
        }

        public void Update(Location location)
        {
            _context.Locations.Update(location);
            _context.SaveChanges();
        }

        public void Delete(int locationId)
        {
            var location = _context.Locations.FirstOrDefault(x => x.Id == locationId);
            if(location != null)
            {
                _context.Locations.Remove(location);
                _context.SaveChanges();
            }
        }

    }
}

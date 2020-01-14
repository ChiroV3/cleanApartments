using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public class ApartmentRepository : IApartmentRepository
    {
        private CleanApartmentsDbContext _context;

        public ApartmentRepository(CleanApartmentsDbContext context)
        {
            _context = context;
        }

        public List<Apartment> GetLocationApartments(int locationId)
        {
            return _context.Apartments.Include(x => x.Location).Where(x => x.Location.Id == locationId).ToList();
        }

        public List<Apartment> GetAll()
        {
            return _context.Apartments.ToList();
        }

        public Apartment Add(Apartment apartment)
        {
            _context.Apartments.Add(apartment);
            _context.SaveChanges();
            return apartment;
        }

        public Apartment Get(int Id)
        {
            return _context.Apartments.FirstOrDefault(x => x.ApartmentId == Id);
        }

        public void Update(Apartment apartment)
        {
            _context.Apartments.Update(apartment);
            _context.SaveChanges();
        }

        public void Delete(int apartmentId)
        {
            var apartment = _context.Apartments.FirstOrDefault(x => x.ApartmentId == apartmentId);

            //TODO: Remove also apartment from location ?

            if(apartment != null)
            {
                _context.Apartments.Remove(apartment);
                _context.SaveChanges();
            }
        }

        public void AssignApartmentToLocation(Apartment apartment, Location location)
        {
            apartment.Location = location;
            _context.Apartments.Update(apartment);
            _context.SaveChanges();
        }

        public void RemoveApartmentFromLocation(Apartment apartment, Location location)
        {
            location.Apartments.Remove(apartment);
            apartment.Location = null;
            _context.Apartments.Update(apartment);
            _context.Locations.Update(location);
            _context.SaveChanges();
        }

    }
}

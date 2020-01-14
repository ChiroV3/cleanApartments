using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public class ApartmentCleaningRepository : IApartmentCleaningRepository
    {
        private CleanApartmentsDbContext _context;

        public ApartmentCleaningRepository(CleanApartmentsDbContext context)
        {
            _context = context;
        }

        public ApartmentCleaningActivity Add(ApartmentCleaningActivity apartmentCleaningActivity)
        {
            _context.ApartmentCleaningActivities.Add(apartmentCleaningActivity);
            _context.SaveChanges();
            return apartmentCleaningActivity;
        }

        public void Update(ApartmentCleaningActivity apartmentCleaningActivity)
        {
            _context.ApartmentCleaningActivities.Update(apartmentCleaningActivity);
            _context.SaveChanges();
        }
    }
}

using CleanApartments.Datasource.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.DataAccess
{
    public class ApplicationUnitOfWork : IApplicationUnitOfWork
    {

        private CleanApartmentsDbContext _context;

        public ApplicationUnitOfWork(CleanApartmentsDbContext context)
        {
            _context = context;
        }


        private IUserRepository _userRepository;
        public IUserRepository UserRepository
        {
            get
            {
                if (_userRepository == null)
                    _userRepository = new UserRepository(_context);
                return _userRepository;
            }
        }

        private IApartmentRepository _apartmentRepository;
        public IApartmentRepository ApartmentRepository
        {
            get
            {
                if (_apartmentRepository == null)
                    _apartmentRepository = new ApartmentRepository(_context);
                return _apartmentRepository;
            }
        }

        private ILocationRepository _locationRepository;
        public ILocationRepository LocationRepository
        {
            get
            {
                if (_locationRepository == null)
                    _locationRepository = new LocationRepository(_context);
                return _locationRepository;
            }
        }

        private IApartmentCleaningRepository _apartmentCleaningRepository;
        public IApartmentCleaningRepository ApartmentCleaningRepository
        {
            get
            {
                if (_apartmentCleaningRepository == null)
                    _apartmentCleaningRepository = new ApartmentCleaningRepository(_context);
                return _apartmentCleaningRepository;
            }
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                    _context.Dispose();
            }
            disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}

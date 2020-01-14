using CleanApartments.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public interface IApartmentRepository
    {
        Apartment Add(Apartment apartment);

        List<Apartment> GetLocationApartments(int locationId);

        Apartment Get(int Id);

        List<Apartment> GetAll();

        void Update(Apartment apartment);

        void Delete(int apartmentId);

        void AssignApartmentToLocation(Apartment apartment, Location location);

        void RemoveApartmentFromLocation(Apartment apartment, Location location);
    }
}

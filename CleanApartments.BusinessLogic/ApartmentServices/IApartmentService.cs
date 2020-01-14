using CleanApartments.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.BusinessLogic.ApartmentServices
{
    public interface IApartmentService
    {
        List<Apartment> GetLocationApartments(int locationId);

        Apartment GetApartment(int apartmentId);

        List<Apartment> GetAllCleanedApartments();
    }
}

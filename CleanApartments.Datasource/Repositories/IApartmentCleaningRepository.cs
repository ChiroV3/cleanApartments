using CleanApartments.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public interface IApartmentCleaningRepository
    {
        ApartmentCleaningActivity Add(ApartmentCleaningActivity apartmentCleaningActivity);

        void Update(ApartmentCleaningActivity apartmentCleaningActivity);
    }
}

using CleanApartments.Datasource.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.DataAccess
{
    public interface IApplicationUnitOfWork :IUnitOfWork
    {
        ILocationRepository LocationRepository { get; }

        IUserRepository UserRepository { get; }

        IApartmentRepository ApartmentRepository { get; }

        IApartmentCleaningRepository ApartmentCleaningRepository { get; }
    }
}

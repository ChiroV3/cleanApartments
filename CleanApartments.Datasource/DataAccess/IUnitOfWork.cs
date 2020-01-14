using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.DataAccess
{
    public interface IUnitOfWork : IDisposable
    {
        void SaveChanges();
    }
}

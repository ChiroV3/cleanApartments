using CleanApartments.Common.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public interface IUserRepository
    {
        User GetUserByUsername(string username);

        User GetById(int id);

        IEnumerable<User> GetAllUsers();

        User Add(User user);

        void Update(User user);

        void Delete(int id);
    }
}

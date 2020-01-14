using CleanApartments.Common.Models;
using CleanApartments.Datasource.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CleanApartments.Datasource.Repositories
{
    public class UserRepository : IUserRepository
    {
        private CleanApartmentsDbContext _context;

        public UserRepository(CleanApartmentsDbContext context)
        {
            _context = context;
        }

        public User GetUserByUsername(string username)
        {
            return _context.Users.Include(x => x.UserGroupAssignments).SingleOrDefault(x => x.Username == username);
        }

        public User GetById(int id)
        {
            return _context.Users.Include(x => x.UserGroupAssignments).SingleOrDefault(x => x.Id == id);
        }

        public IEnumerable<User> GetAllUsers()
        {
            return _context.Users.Include(x => x.UserGroupAssignments);
        }

        public User Add(User user)
        {
            _context.Users.Add(user);
            _context.SaveChanges();
            return user;
        }

        public void Update(User user)
        {
            _context.Users.Update(user);
            _context.SaveChanges();
        }

        public void Delete(int id)
        {
            var user = _context.Users.Find(id);
            if (user != null)
            {
                _context.Users.Remove(user);
                _context.SaveChanges();
            }
        }

    }
}

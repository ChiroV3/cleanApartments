using CleanApartments.Common.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;

namespace CleanApartments.Datasource.DataAccess
{
    public class CleanApartmentsDbContext : DbContext
    {
        public CleanApartmentsDbContext(DbContextOptions<CleanApartmentsDbContext> options) : base(options)
        {
            Database.Migrate();
        }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var configuration = new ConfigurationBuilder()
                        .SetBasePath(Path.GetDirectoryName(Assembly.GetEntryAssembly().Location))
                        .AddJsonFile("appsettings.json")
                        .Build();
            var connectionString = configuration["DefaultConnection"];
            optionsBuilder.UseNpgsql(connectionString);
        }

        public DbSet<User> Users { get; set; }
        public DbSet<UserGroup> UserGroups { get; set; }
        public DbSet<UserGroupAssignment> UserGroupAssignments { get; set; }
        public DbSet<Apartment> Apartments { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<ApartmentCleaningActivity> ApartmentCleaningActivities { get; set; }

    }
}

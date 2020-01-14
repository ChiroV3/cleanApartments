using CleanApartments.BusinessLogic.ApartmentServices;
using CleanApartments.Common.Models;
using NUnit.Framework;

namespace Tests
{
    public class ApartmentServiceTest
    {
        private ApartmentService apartmentService;
        private Apartment apartment;

        [SetUp]
        public void Setup()
        {
            apartmentService = new ApartmentService(null);
            apartment = new Apartment();
            apartment.Name = "Test Name";
            apartment.Location = new Location();
            apartment.Location.Name = "Test Location Name";
        }

        [Test]
        public void NamingTest()
        {
            string result = apartmentService.GetApartmentNameWithLocation(apartment);

            Assert.AreNotSame(string.Empty,result);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Text;

namespace CleanApartments.Common.Dtos
{
    public class ApartmentCleaningDto
    {
        public int ApartmentId { get; set; }
        public string Name { get; set; }
        public string Notes { get; set; }
        public bool HasIssuesToReport { get; set; }
    }
}

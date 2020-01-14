using CleanApartments.Common.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CleanApartments.Common.Models
{
    public class Apartment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ApartmentId { get; set; }

        public string Name { get; set; }

        public Location Location { get; set; }

        public ApartmentStatus Status { get; set; }
    }
}

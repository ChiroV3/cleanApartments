using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CleanApartments.Common.Models
{
    public class ApartmentCleaningActivity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public Apartment Apartment { get; set; }

        public User Cleaner { get; set; }

        public bool HasIssuesToReport { get; set; }

        public string Notes { get; set; }
    }
}

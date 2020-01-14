using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CleanApartments.Common.Models
{
    public class UserGroupAssignment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserGroupAssigmentId { get; set; }
        public int UserId { get; set; }
        public Guid UserGroupId { get; set; }
    }
}

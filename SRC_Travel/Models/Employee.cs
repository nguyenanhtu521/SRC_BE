using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SRC_Travel.Models
{
    public class Employee : IdentityUser
    {

        public string EmployeeCode { get; set; }
        [ForeignKey(nameof(TicketCounterID))]
        public int TicketCounterID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Qualification { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }
        public virtual TicketCounter? TicketCounter { get; set; }

        public Employee()
        {
            GenerateEmployeeCode();
        }

        private void GenerateEmployeeCode()
        {
            Random random = new Random();
            int employeeNumber = random.Next(100000, 999999); // Sinh số ngẫu nhiên từ 100000 đến 999999
            EmployeeCode = employeeNumber.ToString();
        }
    }
}

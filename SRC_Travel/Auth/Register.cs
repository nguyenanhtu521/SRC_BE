using SRC_Travel.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace SRC_Travel.Auth
{
    public class Register
    {
        [Required(ErrorMessage = "User Name is required")]
        public string? Username { get; set; }

        [EmailAddress]
        [Required(ErrorMessage = "Email is required")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        public string? Password { get; set; }

        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Ticket Counter ID is required")]
        public int TicketCounterID { get; set; }
        [Required(ErrorMessage = "EmployeeCode is required")]
        public string EmployeeCode { get; set; }

        [Required(ErrorMessage = "First Name is reTicketquired")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last Name is required")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Age is required")]
        [Range(1, 150, ErrorMessage = "Please enter a valid age.")]
        public int Age { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        [Phone(ErrorMessage = "Please enter a valid phone number.")]
        public string Phone { get; set; }

        public string Description { get; set; }

        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Qualification is required")]
        public string Qualification { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public DateTime? ModifiedAt { get; set; }

        public virtual TicketCounter? TicketCounter { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace SRC_Travel.Models.EmployeeModels
{
    public class ForgotPasswordModel
    {
        [Required]
        public string Email { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace SRC_Travel.Models.EmployeeModels
{
    public class ChangePasswordModel
    {
        [Required]
        public string Email { get; set; } // chỗ này có thể được thay đổi là username hoặc email, số điện thoại, user ID
        [Required]
        public string CurrentPassword { get; set; }
        [Required]
        public string NewPassword { get; set; }
        [Required]
        [Compare("NewPassword", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }
}

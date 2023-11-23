using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SRC_Travel.Models
{
    public class BookingHistory
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BookingHistoryID { get; set; }
        [ForeignKey(nameof(BookingID))]
        public int BookingID { get; set; }
        public string Status { get; set; }
        public DateTime CancelDateTime { get; set; }
        public string CancellationReason { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }

        public virtual Booking? Booking { get; set; }
    }
}

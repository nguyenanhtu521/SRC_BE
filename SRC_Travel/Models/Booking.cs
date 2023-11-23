using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace SRC_Travel.Models
{
    public class Booking
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BookingID { get; set; }

        [ForeignKey(nameof(StartStopID))]
        [InverseProperty("StartStopBookings")]
        public int StartStopID { get; set; }
        [ForeignKey(nameof(EndStopID))]
        [InverseProperty("EndStopBookings")]
        public int EndStopID { get; set; }
        [ForeignKey(nameof(BusID))]
        public int BusID { get; set; }
        public string SeatNumber { get; set; }
        public DateTime BookingDateTime { get; set; }
        public DateTime ReservationTime { get; set; }
        [ForeignKey(nameof(CustomerID))]
        public int CustomerID { get; set; }
        public decimal TotalAmount { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }

        public virtual Customer? Customer { get; set; }
        public virtual BusStop? StartStop { get; set; }
        public virtual BusStop? EndStop { get; set; }
        public virtual Bus? Bus { get; set; }
    }
}

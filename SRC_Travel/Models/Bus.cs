using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SRC_Travel.Models
{
    public class Bus
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BusID { get; set; }
        public string BusNumber { get; set; }
        [ForeignKey(nameof(BusTypeID))]
        public int BusTypeID { get; set; }
        [ForeignKey(nameof(RouteID))]
        public int RouteID { get; set; }
        public string Timings { get; set; }
        public int SeatCount { get; set; } 
        public int AvailableSeats { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }
        public virtual BusType? BusType { get; set; }
        public virtual Route? Route { get; set; }
    }
}

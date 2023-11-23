using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SRC_Travel.Models
{
    public class BusStop
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BusStopID { get; set; }
        public string BusStopName { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }
    }
}

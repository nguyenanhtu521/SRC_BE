using System.ComponentModel.DataAnnotations;

namespace SRC_Travel.Models
{
    public class TicketCounter
    {
        public int TicketCounterID { get; set; }
        public string TicketCounterName { get; set; }
        public string Address { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }
    }
}

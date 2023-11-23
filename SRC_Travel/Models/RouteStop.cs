using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SRC_Travel.Models
{
    public class RouteStop
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int RouteStopID { get; set; }
        [ForeignKey(nameof(RouteID))]
        public int RouteID { get; set; }
        [ForeignKey(nameof(BusStopID))]
        public int BusStopID { get; set; }
        public int StopOrder { get; set; }
        public int Distance { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }

        public virtual Route? Route { get; set; }
        public virtual BusStop? BusStop { get; set; }
    }
}

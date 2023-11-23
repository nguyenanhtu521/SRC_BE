using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SRC_Travel.Models
{
    public class PriceList
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PriceID { get; set; }
        [ForeignKey(nameof(RouteID))]
        public int RouteID { get; set; }
        [ForeignKey(nameof(BusTypeID))]
        public int BusTypeID { get; set; }
        public int Distance { get; set; }
        [ForeignKey(nameof(AgeRangeID))]
        public int AgeRangeID { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }

        public virtual Route? Route { get; set; }
        public virtual BusType? BusType { get; set; }
        public virtual AgeRange? AgeRange { get; set; }
    }
}

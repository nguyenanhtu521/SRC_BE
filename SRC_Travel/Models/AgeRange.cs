using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SRC_Travel.Models
{
    public class AgeRange
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int AgeRangeID { get; set; }
        public int AgeRangeStart { get; set; }
        public int AgeRangeEnd { get; set; }
        public decimal ChargePercent { get; set; }
        public string? Description { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        [DataType(DataType.DateTime)]
        public DateTime? ModifiedAt { get; set; }

    }
}

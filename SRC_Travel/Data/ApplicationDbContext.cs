using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SRC_Travel.Models;
using System.Reflection.Emit;

namespace SRC_Travel.Data
{
    public class ApplicationDbContext : IdentityDbContext<IdentityUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        public DbSet<AgeRange> AgeRanges { get; set; }
        public DbSet<Booking> Bookings { get; set; }
        public DbSet<BookingHistory> BookingsHistories { get; set; }
        public DbSet<Bus> Buses { get; set; }
        public DbSet<BusStop> BusStops { get; set; }
        public DbSet<BusType> BusTypes { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<PriceList> PriceLists { get; set; }
        public DbSet<Models.Route> Routes { get; set; }
        public DbSet<RouteStop> RouteStops { get; set; }
        public DbSet<TicketCounter> TicketCounters { get; set; }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.Entity<AgeRange>()
                .Property(a => a.ChargePercent)
                .HasColumnType("decimal(18, 2)"); 

            builder.Entity<Booking>()
                .Property(b => b.TotalAmount)
                .HasColumnType("decimal(18, 2)");

            builder.Entity<BusType>()
                .Property(bt => bt.BasePrice)
                .HasColumnType("decimal(18, 2)");

            // Trong DbContext OnModelCreating
            builder.Entity<Booking>()
                .HasOne(b => b.StartStop)
                .WithMany()
                .HasForeignKey(b => b.StartStopID)
                .OnDelete(DeleteBehavior.NoAction);

            builder.Entity<Booking>()
                .HasOne(b => b.EndStop)
                .WithMany()
                .HasForeignKey(b => b.EndStopID)
                .OnDelete(DeleteBehavior.NoAction);
            builder.Entity<Booking>()
                .HasOne(b => b.Employee)
                .WithMany()
                .HasForeignKey(b => b.EmployeeID)
                .OnDelete(DeleteBehavior.NoAction);

            builder.Entity<RouteStop>()
                .HasOne(rs => rs.BusStop)
                .WithMany()
                .HasForeignKey(rs => rs.BusStopID)
                .OnDelete(DeleteBehavior.NoAction);

        }
    }
}

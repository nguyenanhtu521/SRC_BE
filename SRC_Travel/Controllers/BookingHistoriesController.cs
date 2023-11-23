using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SRC_Travel.Data;
using SRC_Travel.Models;

namespace SRC_Travel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingHistoriesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public BookingHistoriesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/BookingHistories
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BookingHistory>>> GetBookingsHistories()
        {
          if (_context.BookingsHistories == null)
          {
              return NotFound();
          }
            return await _context.BookingsHistories.ToListAsync();
        }

        // GET: api/BookingHistories/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BookingHistory>> GetBookingHistory(int id)
        {
          if (_context.BookingsHistories == null)
          {
              return NotFound();
          }
            var bookingHistory = await _context.BookingsHistories.FindAsync(id);

            if (bookingHistory == null)
            {
                return NotFound();
            }

            return bookingHistory;
        }

        // PUT: api/BookingHistories/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBookingHistory(int id, BookingHistory bookingHistory)
        {
            if (id != bookingHistory.BookingHistoryID)
            {
                return BadRequest();
            }

            _context.Entry(bookingHistory).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookingHistoryExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/BookingHistories
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<BookingHistory>> PostBookingHistory(BookingHistory bookingHistory)
        {
          if (_context.BookingsHistories == null)
          {
              return Problem("Entity set 'ApplicationDbContext.BookingsHistories'  is null.");
          }
            _context.BookingsHistories.Add(bookingHistory);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBookingHistory", new { id = bookingHistory.BookingHistoryID }, bookingHistory);
        }

        // DELETE: api/BookingHistories/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBookingHistory(int id)
        {
            if (_context.BookingsHistories == null)
            {
                return NotFound();
            }
            var bookingHistory = await _context.BookingsHistories.FindAsync(id);
            if (bookingHistory == null)
            {
                return NotFound();
            }

            _context.BookingsHistories.Remove(bookingHistory);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BookingHistoryExists(int id)
        {
            return (_context.BookingsHistories?.Any(e => e.BookingHistoryID == id)).GetValueOrDefault();
        }
    }
}

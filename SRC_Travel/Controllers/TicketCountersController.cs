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
    public class TicketCountersController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public TicketCountersController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/TicketCounters
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TicketCounter>>> GetTicketCounters()
        {
          if (_context.TicketCounters == null)
          {
              return NotFound();
          }
            return await _context.TicketCounters.ToListAsync();
        }

        // GET: api/TicketCounters/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TicketCounter>> GetTicketCounter(int id)
        {
          if (_context.TicketCounters == null)
          {
              return NotFound();
          }
            var ticketCounter = await _context.TicketCounters.FindAsync(id);

            if (ticketCounter == null)
            {
                return NotFound();
            }

            return ticketCounter;
        }

        // PUT: api/TicketCounters/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTicketCounter(int id, TicketCounter ticketCounter)
        {
            if (id != ticketCounter.TicketCounterID)
            {
                return BadRequest();
            }

            _context.Entry(ticketCounter).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TicketCounterExists(id))
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

        // POST: api/TicketCounters
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TicketCounter>> PostTicketCounter(TicketCounter ticketCounter)
        {
          if (_context.TicketCounters == null)
          {
              return Problem("Entity set 'ApplicationDbContext.TicketCounters'  is null.");
          }
            _context.TicketCounters.Add(ticketCounter);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTicketCounter", new { id = ticketCounter.TicketCounterID }, ticketCounter);
        }

        // DELETE: api/TicketCounters/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTicketCounter(int id)
        {
            if (_context.TicketCounters == null)
            {
                return NotFound();
            }
            var ticketCounter = await _context.TicketCounters.FindAsync(id);
            if (ticketCounter == null)
            {
                return NotFound();
            }

            _context.TicketCounters.Remove(ticketCounter);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TicketCounterExists(int id)
        {
            return (_context.TicketCounters?.Any(e => e.TicketCounterID == id)).GetValueOrDefault();
        }
    }
}

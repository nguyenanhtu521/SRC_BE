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
    public class AgeRangesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public AgeRangesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/AgeRanges
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AgeRange>>> GetAgeRanges()
        {
          if (_context.AgeRanges == null)
          {
              return NotFound();
          }
            return await _context.AgeRanges.ToListAsync();
        }

        // GET: api/AgeRanges/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AgeRange>> GetAgeRange(int id)
        {
          if (_context.AgeRanges == null)
          {
              return NotFound();
          }
            var ageRange = await _context.AgeRanges.FindAsync(id);

            if (ageRange == null)
            {
                return NotFound();
            }

            return ageRange;
        }

        // PUT: api/AgeRanges/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAgeRange(int id, AgeRange ageRange)
        {
            if (id != ageRange.AgeRangeID)
            {
                return BadRequest();
            }

            _context.Entry(ageRange).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AgeRangeExists(id))
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

        // POST: api/AgeRanges
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<AgeRange>> PostAgeRange(AgeRange ageRange)
        {
          if (_context.AgeRanges == null)
          {
              return Problem("Entity set 'ApplicationDbContext.AgeRanges'  is null.");
          }
            _context.AgeRanges.Add(ageRange);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAgeRange", new { id = ageRange.AgeRangeID }, ageRange);
        }

        // DELETE: api/AgeRanges/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAgeRange(int id)
        {
            if (_context.AgeRanges == null)
            {
                return NotFound();
            }
            var ageRange = await _context.AgeRanges.FindAsync(id);
            if (ageRange == null)
            {
                return NotFound();
            }

            _context.AgeRanges.Remove(ageRange);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AgeRangeExists(int id)
        {
            return (_context.AgeRanges?.Any(e => e.AgeRangeID == id)).GetValueOrDefault();
        }
    }
}

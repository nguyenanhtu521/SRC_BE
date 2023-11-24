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
    public class PriceListsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PriceListsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/PriceLists
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PriceList>>> GetPriceLists()
        {
          if (_context.PriceLists == null)
          {
              return NotFound();
          }
            return await _context.PriceLists.ToListAsync();
        }

        // GET: api/PriceLists/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PriceList>> GetPriceList(int id)
        {
          if (_context.PriceLists == null)
          {
              return NotFound();
          }
            var priceList = await _context.PriceLists.FindAsync(id);

            if (priceList == null)
            {
                return NotFound();
            }

            return priceList;
        }

        // PUT: api/PriceLists/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPriceList(int id, PriceList priceList)
        {
            if (id != priceList.PriceID)
            {
                return BadRequest();
            }
            priceList.ModifiedAt = DateTime.Now;
            _context.Entry(priceList).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PriceListExists(id))
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

        // POST: api/PriceLists
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PriceList>> PostPriceList(PriceList priceList)
        {
          if (_context.PriceLists == null)
          {
              return Problem("Entity set 'ApplicationDbContext.PriceLists'  is null.");
          }
            _context.PriceLists.Add(priceList);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPriceList", new { id = priceList.PriceID }, priceList);
        }

        // DELETE: api/PriceLists/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePriceList(int id)
        {
            if (_context.PriceLists == null)
            {
                return NotFound();
            }
            var priceList = await _context.PriceLists.FindAsync(id);
            if (priceList == null)
            {
                return NotFound();
            }

            _context.PriceLists.Remove(priceList);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PriceListExists(int id)
        {
            return (_context.PriceLists?.Any(e => e.PriceID == id)).GetValueOrDefault();
        }
    }
}

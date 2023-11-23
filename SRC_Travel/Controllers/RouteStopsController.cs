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
    public class RouteStopsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public RouteStopsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/RouteStops
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RouteStop>>> GetRouteStops()
        {
          if (_context.RouteStops == null)
          {
              return NotFound();
          }
            return await _context.RouteStops.ToListAsync();
        }

        // GET: api/RouteStops/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RouteStop>> GetRouteStop(int id)
        {
          if (_context.RouteStops == null)
          {
              return NotFound();
          }
            var routeStop = await _context.RouteStops.FindAsync(id);

            if (routeStop == null)
            {
                return NotFound();
            }

            return routeStop;
        }

        // PUT: api/RouteStops/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRouteStop(int id, RouteStop routeStop)
        {
            if (id != routeStop.RouteStopID)
            {
                return BadRequest();
            }

            _context.Entry(routeStop).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RouteStopExists(id))
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

        // POST: api/RouteStops
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<RouteStop>> PostRouteStop(RouteStop routeStop)
        {
          if (_context.RouteStops == null)
          {
              return Problem("Entity set 'ApplicationDbContext.RouteStops'  is null.");
          }
            _context.RouteStops.Add(routeStop);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetRouteStop", new { id = routeStop.RouteStopID }, routeStop);
        }

        // DELETE: api/RouteStops/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRouteStop(int id)
        {
            if (_context.RouteStops == null)
            {
                return NotFound();
            }
            var routeStop = await _context.RouteStops.FindAsync(id);
            if (routeStop == null)
            {
                return NotFound();
            }

            _context.RouteStops.Remove(routeStop);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool RouteStopExists(int id)
        {
            return (_context.RouteStops?.Any(e => e.RouteStopID == id)).GetValueOrDefault();
        }
    }
}

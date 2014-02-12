using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TelerikWpfApp
{
    public class Part
    {
        public Part(string partid = "", string description = "", int quantity = 0)
        {
            PartId = partid;
            Description = description;
            Quantity = quantity;
        }

        public string PartId { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
    }
}

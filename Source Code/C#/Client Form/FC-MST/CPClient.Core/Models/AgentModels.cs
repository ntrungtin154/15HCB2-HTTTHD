using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPClient.Core.Models;

namespace CPClient.Core.Models
{
    public class CreateAgentBindingModel
    {
        public string AgentName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Zip { get; set; }
        public string Email { get; set; }
        public int ProvinceId { get; set; }
        public int DistrictId { get; set; }
    }

    public class AgentListItemModel
    {
        public string AgentId { get; set; }
        public string AgentName { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Zip { get; set; }
        public string Email { get; set; }
        public ProvinceListItemModel Province { get; set; }
        public DistrictListItemModel District { get; set; }

        public bool IsActive { get; set; }
    }
}

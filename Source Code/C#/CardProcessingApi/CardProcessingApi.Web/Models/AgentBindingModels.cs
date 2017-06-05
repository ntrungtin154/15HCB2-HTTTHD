using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CardProcessingApi.Web.Models
{
    public class AgentBindingModels
    {
    }

    public class CreateAgentBindingModel
    {
        [Required]
        public string AgentName { get; set; }
        [Required]
        public string Address { get; set; }
        [Phone]
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Zip { get; set; }
        [EmailAddress]
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
        public CommonViewModels.ProvinceListItemModel Province { get; set; }
        public CommonViewModels.DistrictListItemModel District { get; set; }

        public bool IsActive { get; set; }
    }
}
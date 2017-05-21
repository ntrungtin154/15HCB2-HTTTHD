﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPClient.Core.Models
{
    public class DistrictModels
    {
        public class DistrictListItemModel
        {
            public int DistrictId { get; set; }
            public string DistrictName { get; set; }

            public override string ToString()
            {
                return DistrictName;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CPClient.Business;
using CPClient.Core;
using CPClient.Core.Models;

namespace FC_MST
{
    public partial class DistrictComboBox : UserControl
    {
        public DistrictComboBox()
        {
            InitializeComponent();
            
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            GetAllDistricts();
        }

        private async void GetAllDistricts()
        {
            DataSource = await LocationLogic.FetchAllDistrictsAsync();
            foreach (var district in DataSource)
            {
                cbxDistricts.Items.Add(district);
            }

            if (DataSource.Count > 0)
            {
                cbxDistricts.SelectedIndex = 0;
            }
        }

        public ComboBox ComboBox
        {
            get { return cbxDistricts; }
        }

        public List<DistrictListItemModel> DataSource { get; private set; } 

        public DistrictListItemModel GetSelectedItem()
        {
            return ComboBox.SelectedItem as DistrictListItemModel;
        }
    }
}

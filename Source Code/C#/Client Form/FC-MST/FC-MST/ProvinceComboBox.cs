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
using CPClient.Core.Models;

namespace FC_MST
{
    public partial class ProvinceComboBox : UserControl
    {
        public ProvinceComboBox()
        {
            InitializeComponent();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            LoadAllProvinces();
        }

        private async void LoadAllProvinces()
        {
            DataSource = await LocationLogic.FetchAllProvincesAsync();
            foreach (var province in DataSource)
            {
                cbxProvinces.Items.Add(province);
            }

            if (DataSource.Count > 0)
            {
                cbxProvinces.SelectedIndex = 0;
            }
        }

        public ComboBox ComboBox
        {
            get
            {
                return cbxProvinces;
            }
        }

        public List<ProvinceListItemModel> DataSource { get; private set; }

        public ProvinceListItemModel GetSelectedItem()
        {
            return ComboBox.SelectedItem as ProvinceListItemModel;
        }
    }
}

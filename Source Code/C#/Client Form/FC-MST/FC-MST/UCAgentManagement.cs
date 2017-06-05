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
    public partial class UCAgentManagement : UserControl
    {
        public UCAgentManagement()
        {
            InitializeComponent();
            
        }

        private List<AgentListItemModel> Agents { get; set; } 

        private void ConfigureForm()
        {
            gridAgent.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            btnActivateAgent.Visible = false;
            btnDeactivateAgent.Visible = false;
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            ConfigureForm();
            LoadAllAgents();

        }

        private async void LoadAllAgents()
        {
            Agents = await AgentLogic.FetchAllAgent();
            var datatable = Agents.ToDataTable();
            gridAgent.AutoGenerateColumns = false;
            gridAgent.DataSource = datatable;
        }

        private void gridAgent_SelectionChanged(object sender, EventArgs e)
        {
            var row = gridAgent.CurrentRow;
            if (row != null)
            {
                var agentId = row.Cells[0].Value.ToString();
                var agent = Agents.FirstOrDefault(c => c.AgentId == agentId);

                btnActivateAgent.Visible = false;
                btnDeactivateAgent.Visible = false;

                txtAgentId.Text = agent.AgentId;
                txtAgentName.Text = agent.AgentName;
                districtComboBox1.ComboBox.SelectedItem = districtComboBox1.DataSource.FirstOrDefault(c=> c.DistrictId == agent.District.DistrictId);
                provinceComboBox1.ComboBox.SelectedValue = provinceComboBox1.DataSource.FirstOrDefault(c=>c.ProvinceId == agent.Province.ProvinceId);

                if (agent.IsActive)
                {
                    btnDeactivateAgent.Visible = true;
                }
                else
                {
                    btnActivateAgent.Visible = true;
                }
            }
        }

        private void btnActivateAgent_Click(object sender, EventArgs e)
        {
            var agentId = txtAgentId.Text;
            AgentLogic.ActivateAgent(agentId, delegate(string s)
            {
                MessageBox.Show("Kích hoạt Agent thành công");
            }, delegate(string s)
            {
                MessageBox.Show(s);
            });
        }

        private void OnFailed(string s)
        {
            MessageBox.Show(s);
        }

        private void OnSuccess(string s)
        {
            MessageBox.Show(s);
        }

        private void btnDeactivateAgent_Click(object sender, EventArgs e)
        {
            var agentId = txtAgentId.Text;
            AgentLogic.DeactivateAgent(agentId, delegate (string s)
            {
                MessageBox.Show("Chuyển agent sang không kích hoạt thành công");
            }, delegate (string s)
            {
                MessageBox.Show(s);
            });
        }
    }
}

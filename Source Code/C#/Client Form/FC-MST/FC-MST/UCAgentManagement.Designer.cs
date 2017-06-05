namespace FC_MST
{
    partial class UCAgentManagement
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.gridAgent = new System.Windows.Forms.DataGridView();
            this.AgentId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.AgentName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Phone = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProvinceName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DistrictName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.AgentStatus = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtAgentId = new System.Windows.Forms.TextBox();
            this.txtAgentName = new System.Windows.Forms.TextBox();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.btnActivateAgent = new System.Windows.Forms.Button();
            this.btnDeactivateAgent = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.provinceComboBox1 = new FC_MST.ProvinceComboBox();
            this.districtComboBox1 = new FC_MST.DistrictComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.gridAgent)).BeginInit();
            this.SuspendLayout();
            // 
            // gridAgent
            // 
            this.gridAgent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridAgent.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.AgentId,
            this.AgentName,
            this.Phone,
            this.ProvinceName,
            this.DistrictName,
            this.AgentStatus});
            this.gridAgent.Dock = System.Windows.Forms.DockStyle.Top;
            this.gridAgent.Location = new System.Drawing.Point(0, 0);
            this.gridAgent.Name = "gridAgent";
            this.gridAgent.Size = new System.Drawing.Size(804, 150);
            this.gridAgent.TabIndex = 0;
            this.gridAgent.SelectionChanged += new System.EventHandler(this.gridAgent_SelectionChanged);
            // 
            // AgentId
            // 
            this.AgentId.DataPropertyName = "AgentId";
            this.AgentId.HeaderText = "Mã";
            this.AgentId.Name = "AgentId";
            // 
            // AgentName
            // 
            this.AgentName.DataPropertyName = "AgentName";
            this.AgentName.HeaderText = "Tên";
            this.AgentName.Name = "AgentName";
            // 
            // Phone
            // 
            this.Phone.DataPropertyName = "Phone";
            this.Phone.HeaderText = "SĐT";
            this.Phone.Name = "Phone";
            // 
            // ProvinceName
            // 
            this.ProvinceName.DataPropertyName = "Province";
            this.ProvinceName.HeaderText = "Tên Tỉnh";
            this.ProvinceName.Name = "ProvinceName";
            this.ProvinceName.ReadOnly = true;
            // 
            // DistrictName
            // 
            this.DistrictName.DataPropertyName = "District";
            this.DistrictName.HeaderText = "Tên Quận";
            this.DistrictName.Name = "DistrictName";
            // 
            // AgentStatus
            // 
            this.AgentStatus.DataPropertyName = "IsActive";
            this.AgentStatus.HeaderText = "Tình trạng hoạt động";
            this.AgentStatus.Name = "AgentStatus";
            this.AgentStatus.ReadOnly = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(5, 160);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Mã Agent";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(5, 194);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Tên Agent";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(5, 230);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Địa chỉ";
            // 
            // txtAgentId
            // 
            this.txtAgentId.Enabled = false;
            this.txtAgentId.Location = new System.Drawing.Point(89, 157);
            this.txtAgentId.Name = "txtAgentId";
            this.txtAgentId.Size = new System.Drawing.Size(173, 20);
            this.txtAgentId.TabIndex = 4;
            // 
            // txtAgentName
            // 
            this.txtAgentName.Location = new System.Drawing.Point(89, 191);
            this.txtAgentName.Name = "txtAgentName";
            this.txtAgentName.Size = new System.Drawing.Size(173, 20);
            this.txtAgentName.TabIndex = 5;
            // 
            // txtAddress
            // 
            this.txtAddress.Location = new System.Drawing.Point(89, 227);
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(173, 20);
            this.txtAddress.TabIndex = 6;
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // btnActivateAgent
            // 
            this.btnActivateAgent.Location = new System.Drawing.Point(89, 254);
            this.btnActivateAgent.Name = "btnActivateAgent";
            this.btnActivateAgent.Size = new System.Drawing.Size(75, 23);
            this.btnActivateAgent.TabIndex = 8;
            this.btnActivateAgent.Text = "Activate";
            this.btnActivateAgent.UseVisualStyleBackColor = true;
            this.btnActivateAgent.Click += new System.EventHandler(this.btnActivateAgent_Click);
            // 
            // btnDeactivateAgent
            // 
            this.btnDeactivateAgent.Location = new System.Drawing.Point(171, 254);
            this.btnDeactivateAgent.Name = "btnDeactivateAgent";
            this.btnDeactivateAgent.Size = new System.Drawing.Size(75, 23);
            this.btnDeactivateAgent.TabIndex = 9;
            this.btnDeactivateAgent.Text = "Deactivate";
            this.btnDeactivateAgent.UseVisualStyleBackColor = true;
            this.btnDeactivateAgent.Click += new System.EventHandler(this.btnDeactivateAgent_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(316, 160);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(28, 13);
            this.label4.TabIndex = 12;
            this.label4.Text = "Tỉnh";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(316, 194);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(33, 13);
            this.label5.TabIndex = 13;
            this.label5.Text = "Quận";
            // 
            // provinceComboBox1
            // 
            this.provinceComboBox1.AutoSize = true;
            this.provinceComboBox1.Location = new System.Drawing.Point(378, 191);
            this.provinceComboBox1.Name = "provinceComboBox1";
            this.provinceComboBox1.Size = new System.Drawing.Size(225, 21);
            this.provinceComboBox1.TabIndex = 11;
            // 
            // districtComboBox1
            // 
            this.districtComboBox1.AutoSize = true;
            this.districtComboBox1.Location = new System.Drawing.Point(378, 156);
            this.districtComboBox1.Name = "districtComboBox1";
            this.districtComboBox1.Size = new System.Drawing.Size(225, 21);
            this.districtComboBox1.TabIndex = 10;
            // 
            // UCAgentManagement
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.provinceComboBox1);
            this.Controls.Add(this.districtComboBox1);
            this.Controls.Add(this.btnDeactivateAgent);
            this.Controls.Add(this.btnActivateAgent);
            this.Controls.Add(this.txtAddress);
            this.Controls.Add(this.txtAgentName);
            this.Controls.Add(this.txtAgentId);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.gridAgent);
            this.Name = "UCAgentManagement";
            this.Size = new System.Drawing.Size(804, 506);
            ((System.ComponentModel.ISupportInitialize)(this.gridAgent)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView gridAgent;
        private System.Windows.Forms.DataGridViewTextBoxColumn AgentId;
        private System.Windows.Forms.DataGridViewTextBoxColumn AgentName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Phone;
        private System.Windows.Forms.DataGridViewTextBoxColumn ProvinceName;
        private System.Windows.Forms.DataGridViewTextBoxColumn DistrictName;
        private System.Windows.Forms.DataGridViewTextBoxColumn AgentStatus;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtAgentId;
        private System.Windows.Forms.TextBox txtAgentName;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Button btnActivateAgent;
        private System.Windows.Forms.Button btnDeactivateAgent;
        private DistrictComboBox districtComboBox1;
        private ProvinceComboBox provinceComboBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
    }
}

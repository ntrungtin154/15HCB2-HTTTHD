namespace FC_MST
{
    partial class MainAppForm
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.mainTabControl = new System.Windows.Forms.TabControl();
            this.tabAgentManagement = new System.Windows.Forms.TabPage();
            this.ucAgentManagement1 = new FC_MST.UCAgentManagement();
            this.btnOpenAddAgentModal = new System.Windows.Forms.Button();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.districtComboBox1 = new FC_MST.DistrictComboBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.mainTabControl.SuspendLayout();
            this.tabAgentManagement.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainTabControl
            // 
            this.mainTabControl.Controls.Add(this.tabAgentManagement);
            this.mainTabControl.Controls.Add(this.tabPage2);
            this.mainTabControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainTabControl.Location = new System.Drawing.Point(0, 24);
            this.mainTabControl.Name = "mainTabControl";
            this.mainTabControl.SelectedIndex = 0;
            this.mainTabControl.Size = new System.Drawing.Size(968, 538);
            this.mainTabControl.TabIndex = 0;
            // 
            // tabAgentManagement
            // 
            this.tabAgentManagement.Controls.Add(this.ucAgentManagement1);
            this.tabAgentManagement.Controls.Add(this.btnOpenAddAgentModal);
            this.tabAgentManagement.Location = new System.Drawing.Point(4, 22);
            this.tabAgentManagement.Name = "tabAgentManagement";
            this.tabAgentManagement.Padding = new System.Windows.Forms.Padding(3);
            this.tabAgentManagement.Size = new System.Drawing.Size(960, 512);
            this.tabAgentManagement.TabIndex = 0;
            this.tabAgentManagement.Text = "Agent";
            this.tabAgentManagement.UseVisualStyleBackColor = true;
            // 
            // ucAgentManagement1
            // 
            this.ucAgentManagement1.AutoSize = true;
            this.ucAgentManagement1.Dock = System.Windows.Forms.DockStyle.Top;
            this.ucAgentManagement1.Location = new System.Drawing.Point(3, 3);
            this.ucAgentManagement1.Name = "ucAgentManagement1";
            this.ucAgentManagement1.Size = new System.Drawing.Size(954, 156);
            this.ucAgentManagement1.TabIndex = 1;
            // 
            // btnOpenAddAgentModal
            // 
            this.btnOpenAddAgentModal.Location = new System.Drawing.Point(6, 442);
            this.btnOpenAddAgentModal.Name = "btnOpenAddAgentModal";
            this.btnOpenAddAgentModal.Size = new System.Drawing.Size(75, 23);
            this.btnOpenAddAgentModal.TabIndex = 0;
            this.btnOpenAddAgentModal.Text = "Thêm Agent";
            this.btnOpenAddAgentModal.UseVisualStyleBackColor = true;
            this.btnOpenAddAgentModal.Click += new System.EventHandler(this.btnOpenAddAgentModal_Click);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.districtComboBox1);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(936, 471);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "tabPage2";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // districtComboBox1
            // 
            this.districtComboBox1.AutoSize = true;
            this.districtComboBox1.Location = new System.Drawing.Point(110, 33);
            this.districtComboBox1.Name = "districtComboBox1";
            this.districtComboBox1.Size = new System.Drawing.Size(225, 21);
            this.districtComboBox1.TabIndex = 0;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(968, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.toolStripMenuItem2,
            this.toolStripMenuItem3});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(70, 20);
            this.fileToolStripMenuItem.Text = "Tài khoản";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(177, 22);
            this.toolStripMenuItem1.Text = "Thông tin cá nhân";
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(177, 22);
            this.toolStripMenuItem2.Text = "Đăng xuất";
            // 
            // toolStripMenuItem3
            // 
            this.toolStripMenuItem3.Name = "toolStripMenuItem3";
            this.toolStripMenuItem3.Size = new System.Drawing.Size(177, 22);
            this.toolStripMenuItem3.Text = "Thoát chương trình";
            // 
            // MainAppForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(968, 562);
            this.Controls.Add(this.mainTabControl);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainAppForm";
            this.Text = "Ứng dụng";
            this.mainTabControl.ResumeLayout(false);
            this.tabAgentManagement.ResumeLayout(false);
            this.tabAgentManagement.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TabControl mainTabControl;
        private System.Windows.Forms.TabPage tabAgentManagement;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button btnOpenAddAgentModal;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem3;
        private DistrictComboBox districtComboBox1;
        private UCAgentManagement ucAgentManagement1;
    }
}


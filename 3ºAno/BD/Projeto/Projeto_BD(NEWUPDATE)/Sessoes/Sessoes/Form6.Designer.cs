namespace Sessoes
{
    partial class Form6
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
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.listBox2 = new System.Windows.Forms.ListBox();
            this.btnSessao = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.btwSessoesTarde = new System.Windows.Forms.Button();
            this.btwSessoesNoite = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btnTodasSessoes = new System.Windows.Forms.Button();
            this.listBox3 = new System.Windows.Forms.ListBox();
            this.label5 = new System.Windows.Forms.Label();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(478, 235);
            this.listBox1.Name = "listBox1";
            this.listBox1.ScrollAlwaysVisible = true;
            this.listBox1.Size = new System.Drawing.Size(288, 134);
            this.listBox1.TabIndex = 1;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.SkyBlue;
            this.panel2.Controls.Add(this.label4);
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(799, 90);
            this.panel2.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Century Gothic", 30F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(287, 24);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(243, 47);
            this.label4.TabIndex = 1;
            this.label4.Text = "Bem-vindo ";
            // 
            // listBox2
            // 
            this.listBox2.FormattingEnabled = true;
            this.listBox2.HorizontalScrollbar = true;
            this.listBox2.Location = new System.Drawing.Point(12, 235);
            this.listBox2.Name = "listBox2";
            this.listBox2.ScrollAlwaysVisible = true;
            this.listBox2.Size = new System.Drawing.Size(413, 134);
            this.listBox2.TabIndex = 9;
            this.listBox2.SelectedIndexChanged += new System.EventHandler(this.listBox2_SelectedIndexChanged);
            // 
            // btnSessao
            // 
            this.btnSessao.Location = new System.Drawing.Point(335, 390);
            this.btnSessao.Name = "btnSessao";
            this.btnSessao.Size = new System.Drawing.Size(90, 40);
            this.btnSessao.TabIndex = 10;
            this.btnSessao.Text = "Press";
            this.btnSessao.UseVisualStyleBackColor = true;
            this.btnSessao.Click += new System.EventHandler(this.btnSessao_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label1.Font = new System.Drawing.Font("Dubai", 8.249999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.RoyalBlue;
            this.label1.Location = new System.Drawing.Point(241, 403);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(78, 20);
            this.label1.TabIndex = 11;
            this.label1.Text = "Obter Sessões:";
            // 
            // btwSessoesTarde
            // 
            this.btwSessoesTarde.Location = new System.Drawing.Point(478, 175);
            this.btwSessoesTarde.Name = "btwSessoesTarde";
            this.btwSessoesTarde.Size = new System.Drawing.Size(52, 23);
            this.btwSessoesTarde.TabIndex = 12;
            this.btwSessoesTarde.Text = "Tarde";
            this.btwSessoesTarde.UseVisualStyleBackColor = true;
            this.btwSessoesTarde.Click += new System.EventHandler(this.btwSessoesTarde_Click);
            // 
            // btwSessoesNoite
            // 
            this.btwSessoesNoite.Location = new System.Drawing.Point(559, 175);
            this.btwSessoesNoite.Name = "btwSessoesNoite";
            this.btwSessoesNoite.Size = new System.Drawing.Size(52, 23);
            this.btwSessoesNoite.TabIndex = 13;
            this.btwSessoesNoite.Text = "Noite";
            this.btwSessoesNoite.UseVisualStyleBackColor = true;
            this.btwSessoesNoite.Click += new System.EventHandler(this.btwSessoesNoite_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.label2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label2.Font = new System.Drawing.Font("Dubai", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.RoyalBlue;
            this.label2.Location = new System.Drawing.Point(478, 124);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(78, 29);
            this.label2.TabIndex = 14;
            this.label2.Text = "FILTROS:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Century Gothic", 12.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(12, 209);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 19);
            this.label3.TabIndex = 15;
            this.label3.Text = "Filmes:";
            // 
            // btnTodasSessoes
            // 
            this.btnTodasSessoes.Location = new System.Drawing.Point(643, 175);
            this.btnTodasSessoes.Name = "btnTodasSessoes";
            this.btnTodasSessoes.Size = new System.Drawing.Size(52, 23);
            this.btnTodasSessoes.TabIndex = 16;
            this.btnTodasSessoes.Text = "Todas";
            this.btnTodasSessoes.UseVisualStyleBackColor = true;
            this.btnTodasSessoes.Click += new System.EventHandler(this.btnTodasSessoes_Click);
            // 
            // listBox3
            // 
            this.listBox3.FormattingEnabled = true;
            this.listBox3.HorizontalScrollbar = true;
            this.listBox3.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.listBox3.Location = new System.Drawing.Point(135, 103);
            this.listBox3.Name = "listBox3";
            this.listBox3.ScrollAlwaysVisible = true;
            this.listBox3.Size = new System.Drawing.Size(290, 95);
            this.listBox3.TabIndex = 17;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Century Gothic", 12.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(29, 103);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(100, 19);
            this.label5.TabIndex = 18;
            this.label5.Text = "Estatísticas:";
            // 
            // Form6
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(799, 451);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.listBox3);
            this.Controls.Add(this.btnTodasSessoes);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btwSessoesNoite);
            this.Controls.Add(this.btwSessoesTarde);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnSessao);
            this.Controls.Add(this.listBox2);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.listBox1);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Form6";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Filmes";
            this.Load += new System.EventHandler(this.Form6_Load);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ListBox listBox2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnSessao;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btwSessoesTarde;
        private System.Windows.Forms.Button btwSessoesNoite;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnTodasSessoes;
        private System.Windows.Forms.ListBox listBox3;
        private System.Windows.Forms.Label label5;
    }
}
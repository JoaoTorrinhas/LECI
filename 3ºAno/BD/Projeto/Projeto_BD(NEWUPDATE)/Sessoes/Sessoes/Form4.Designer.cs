namespace Sessoes
{
    partial class Form4
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form4));
            this.textBoxUsername = new System.Windows.Forms.TextBox();
            this.textBoxPW = new System.Windows.Forms.TextBox();
            this.textBoxNumFunc = new System.Windows.Forms.TextBox();
            this.usernameLabel = new System.Windows.Forms.Label();
            this.numFuncLabel = new System.Windows.Forms.Label();
            this.passwordLabel = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.loginCliente = new System.Windows.Forms.Button();
            this.admin = new System.Windows.Forms.Button();
            this.loginGeral = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.btnLoginCliente = new System.Windows.Forms.Button();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // textBoxUsername
            // 
            this.textBoxUsername.Location = new System.Drawing.Point(431, 279);
            this.textBoxUsername.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBoxUsername.Name = "textBoxUsername";
            this.textBoxUsername.Size = new System.Drawing.Size(271, 22);
            this.textBoxUsername.TabIndex = 0;
            this.textBoxUsername.Visible = false;
            // 
            // textBoxPW
            // 
            this.textBoxPW.Location = new System.Drawing.Point(431, 343);
            this.textBoxPW.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBoxPW.Name = "textBoxPW";
            this.textBoxPW.PasswordChar = '*';
            this.textBoxPW.Size = new System.Drawing.Size(271, 22);
            this.textBoxPW.TabIndex = 1;
            this.textBoxPW.Visible = false;
            // 
            // textBoxNumFunc
            // 
            this.textBoxNumFunc.Location = new System.Drawing.Point(431, 311);
            this.textBoxNumFunc.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBoxNumFunc.Name = "textBoxNumFunc";
            this.textBoxNumFunc.Size = new System.Drawing.Size(271, 22);
            this.textBoxNumFunc.TabIndex = 2;
            this.textBoxNumFunc.Visible = false;
            // 
            // usernameLabel
            // 
            this.usernameLabel.AutoSize = true;
            this.usernameLabel.Location = new System.Drawing.Point(345, 283);
            this.usernameLabel.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.usernameLabel.Name = "usernameLabel";
            this.usernameLabel.Size = new System.Drawing.Size(73, 16);
            this.usernameLabel.TabIndex = 3;
            this.usernameLabel.Text = "Username:";
            this.usernameLabel.Visible = false;
            // 
            // numFuncLabel
            // 
            this.numFuncLabel.AutoSize = true;
            this.numFuncLabel.Location = new System.Drawing.Point(263, 315);
            this.numFuncLabel.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.numFuncLabel.Name = "numFuncLabel";
            this.numFuncLabel.Size = new System.Drawing.Size(150, 16);
            this.numFuncLabel.TabIndex = 4;
            this.numFuncLabel.Text = "Número de Funcionário:";
            this.numFuncLabel.Visible = false;
            // 
            // passwordLabel
            // 
            this.passwordLabel.AutoSize = true;
            this.passwordLabel.Location = new System.Drawing.Point(345, 347);
            this.passwordLabel.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.passwordLabel.Name = "passwordLabel";
            this.passwordLabel.Size = new System.Drawing.Size(70, 16);
            this.passwordLabel.TabIndex = 5;
            this.passwordLabel.Text = "Password:";
            this.passwordLabel.Visible = false;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.SkyBlue;
            this.panel2.Controls.Add(this.label4);
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1068, 146);
            this.panel2.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Century Gothic", 30F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(120, 42);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(636, 47);
            this.label4.TabIndex = 0;
            this.label4.Text = "Bem-vindo aos Cinemas Online";
            // 
            // loginCliente
            // 
            this.loginCliente.Location = new System.Drawing.Point(679, 154);
            this.loginCliente.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.loginCliente.Name = "loginCliente";
            this.loginCliente.Size = new System.Drawing.Size(165, 32);
            this.loginCliente.TabIndex = 8;
            this.loginCliente.Text = "Login Cliente";
            this.loginCliente.UseVisualStyleBackColor = true;
            this.loginCliente.Click += new System.EventHandler(this.loginCliente_Click);
            // 
            // admin
            // 
            this.admin.Location = new System.Drawing.Point(865, 154);
            this.admin.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.admin.Name = "admin";
            this.admin.Size = new System.Drawing.Size(165, 32);
            this.admin.TabIndex = 9;
            this.admin.Text = "Admin";
            this.admin.UseVisualStyleBackColor = true;
            this.admin.Click += new System.EventHandler(this.admin_Click);
            // 
            // loginGeral
            // 
            this.loginGeral.Location = new System.Drawing.Point(495, 428);
            this.loginGeral.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.loginGeral.Name = "loginGeral";
            this.loginGeral.Size = new System.Drawing.Size(137, 50);
            this.loginGeral.TabIndex = 10;
            this.loginGeral.Text = "Enter";
            this.loginGeral.UseVisualStyleBackColor = true;
            this.loginGeral.Visible = false;
            this.loginGeral.Click += new System.EventHandler(this.loginGeral_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(16, 207);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(167, 292);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(884, 207);
            this.pictureBox2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(167, 292);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 12;
            this.pictureBox2.TabStop = false;
            // 
            // btnLoginCliente
            // 
            this.btnLoginCliente.Location = new System.Drawing.Point(495, 428);
            this.btnLoginCliente.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnLoginCliente.Name = "btnLoginCliente";
            this.btnLoginCliente.Size = new System.Drawing.Size(137, 50);
            this.btnLoginCliente.TabIndex = 13;
            this.btnLoginCliente.Text = "&Login";
            this.btnLoginCliente.UseVisualStyleBackColor = true;
            this.btnLoginCliente.Visible = false;
            this.btnLoginCliente.Click += new System.EventHandler(this.btnLoginCliente_Click);
            // 
            // Form4
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1067, 554);
            this.Controls.Add(this.btnLoginCliente);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.loginGeral);
            this.Controls.Add(this.admin);
            this.Controls.Add(this.loginCliente);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.passwordLabel);
            this.Controls.Add(this.numFuncLabel);
            this.Controls.Add(this.usernameLabel);
            this.Controls.Add(this.textBoxNumFunc);
            this.Controls.Add(this.textBoxPW);
            this.Controls.Add(this.textBoxUsername);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "Form4";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cinemas";
            this.Load += new System.EventHandler(this.Form4_Load);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxUsername;
        private System.Windows.Forms.TextBox textBoxPW;
        private System.Windows.Forms.TextBox textBoxNumFunc;
        private System.Windows.Forms.Label usernameLabel;
        private System.Windows.Forms.Label numFuncLabel;
        private System.Windows.Forms.Label passwordLabel;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button loginCliente;
        private System.Windows.Forms.Button admin;
        private System.Windows.Forms.Button loginGeral;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Button btnLoginCliente;
    }
}
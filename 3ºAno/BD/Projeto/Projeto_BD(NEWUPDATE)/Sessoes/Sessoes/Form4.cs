using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Sessoes
{
    public partial class Form4 : Form
    {
        private SqlConnection cn;
        
        public Form4()
        {
            InitializeComponent();
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog=p1g9;User ID=p1g9;Password=Grupo9Aveiro2022");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
            {
                cn = getSGBDConnection();
            }
            if (cn.State != ConnectionState.Open)
            {
                cn.Open();
            }
            return cn.State == ConnectionState.Open;
        }

        public void ShowBtnLabelAdmin()
        {
            numFuncLabel.Visible = true;
            textBoxNumFunc.Visible = true;
            loginGeral.Visible = true;      //botao login para admin
            btnLoginCliente.Visible = false;
            usernameLabel.Visible = false;
            textBoxUsername.Visible = false;
            textBoxUsername.Text = "";
            passwordLabel.Visible = false;
            textBoxPW.Visible = false;
            textBoxPW.Text = "";
        }

        public void ShowBtnLabelCliente()
        {
            numFuncLabel.Visible = false;
            textBoxNumFunc.Visible = false;
            textBoxNumFunc.Text = "";
            btnLoginCliente.Visible = true; //botao login para cliente
            loginGeral.Visible = false;
            usernameLabel.Visible = true;
            textBoxUsername.Visible = true;
            passwordLabel.Visible = true;
            textBoxPW.Visible = true;
        }

        private bool LoginAdmin()
        {
            bool verify = false;
            if (verifySGBDConnection())
            {
                //SqlCommand checkAdmin = new SqlCommand("SELECT * FROM PROJ_CINEMAS.ADMINISTRADOR WHERE num_funcionario = @num_funcionario", cn);
                //checkAdmin.Parameters.AddWithValue("@num_funcionario", Int32.Parse(textBoxNumFunc.Text));
                SqlCommand checkAdmin = new SqlCommand("SELECT * FROM getAdminByNumFuncionario(" + Int32.Parse(textBoxNumFunc.Text) + ")", cn);
                SqlDataReader reader = checkAdmin.ExecuteReader();
                if (reader.HasRows)
                {
                    verify = true;
                }
            }
            cn.Close();

            return verify;
        }

        private bool LoginCliente()
        {
            bool verify = false;
            if (verifySGBDConnection())
            {
                //SqlCommand checkClient = new SqlCommand("SELECT * FROM PROJ_CINEMAS.UTILIZADOR WHERE username=@username AND pw=@pw", cn);
                //checkClient.Parameters.AddWithValue("@username", textBoxUsername.Text);
                //checkClient.Parameters.AddWithValue("@pw", textBoxPW.Text);
                String username = textBoxUsername.Text.ToString();
                String pw = textBoxPW.Text.ToString();
                SqlCommand checkClient = new SqlCommand("SELECT * FROM getUserByUsernamePw('" + username + "','" + pw + "')", cn);
                //SELECT* FROM getUserByUsernamePw('rogerio10', 'r12345');
                SqlDataReader reader = checkClient.ExecuteReader();
                if (reader.HasRows)
                {
                    verify= true;
                }
            }
            cn.Close();

            return verify;
        }


        private void admin_Click(object sender, EventArgs e)
        {
            ShowBtnLabelAdmin();
        }

        private void loginCliente_Click(object sender, EventArgs e)
        {
            ShowBtnLabelCliente();
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
        }

        private void loginGeral_Click(object sender, EventArgs e)
        {
            //login do admin
            bool permisson = LoginAdmin();
            if (permisson) //tem permissão para entrar
            {
                Form2 f2 = new Form2();
                f2.ShowDialog();
                textBoxNumFunc.Text = "";
            }
            else //não tem permissão para entrar
            {
                MessageBox.Show("Número de funcionário inválido!");
                textBoxNumFunc.Text = "";
            }
        }

        private void btnLoginCliente_Click(object sender, EventArgs e)
        {
            //login do cliente
            bool permisson = LoginCliente();
            if (permisson)
            {
                Form6 f6 = new Form6();
                f6.ShowDialog();
                textBoxUsername.Text = "";
                textBoxPW.Text = "";
                //Visible = false;
            }
            else
            {
                MessageBox.Show("Username ou Password erradas");
                textBoxUsername.Text = "";
                textBoxPW.Text = "";
            }
        }
    }
}

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
using Sessoes;


namespace Sessoes
{
    public partial class Form3 : Form
    {

        private SqlConnection cn;
        private int currentFilme;
        private bool adding;
        public Form3()
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

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex >= 0)
            {
                currentFilme = listBox1.SelectedIndex;
                ShowFilme();
            }
        }

        private void loadFilmes(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.FILME", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox1.Items.Clear();
            while (reader.Read())
            {
                Filme F = new Filme();
                F.IDfilme = Int32.Parse(reader["id"].ToString());
                F.Foto = reader["foto"].ToString();
                F.Titulo = reader["titulo"].ToString();
                F.Realizador = reader["realizador"].ToString();
                F.Sinopse = reader["sinopse"].ToString();
                F.Elenco = reader["elenco"].ToString();
                listBox1.Items.Add(F);
            }
            cn.Close();
            currentFilme = 0;
            ShowFilme();
        }

        private void SubmiteFilme(Filme F)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "create_filme";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", F.IDfilme);
            cmd.Parameters.AddWithValue("@foto", F.Foto);
            cmd.Parameters.AddWithValue("@titulo", F.Titulo);
            cmd.Parameters.AddWithValue("@realizador", F.Realizador);
            cmd.Parameters.AddWithValue("@sinopse", F.Sinopse);
            cmd.Parameters.AddWithValue("@elenco", F.Elenco);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao atualizar o Filme na database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }


        private void UpdateFilme(Filme F)
        {
            int rows = 0;

            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "alter_filme";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", F.IDfilme);
            cmd.Parameters.AddWithValue("@foto", F.Foto);
            cmd.Parameters.AddWithValue("@titulo", F.Titulo);
            cmd.Parameters.AddWithValue("@realizador", F.Realizador);
            cmd.Parameters.AddWithValue("@sinopse", F.Sinopse);
            cmd.Parameters.AddWithValue("@elenco", F.Elenco);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao atualizar o Filme na database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                if (rows == 1)
                {
                    MessageBox.Show("Update OK");
                }
                else
                {
                    MessageBox.Show("Update NOT OK");
                }
                cn.Close();
            }

        }

        private void RemoveFilme(int idFilme)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete_filme_byId";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", idFilme);
            cmd.Connection = cn;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao eliminar o Filme da database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

        }




        public void ShowFilme()
        {
            if (listBox1.Items.Count == 0 | currentFilme < 0)
                return;
            //Sessao sessao = new Sessao();
            Filme filmee = new Filme();
            filmee = (Filme)listBox1.Items[currentFilme];
            textBox1.Text = filmee.IDfilme.ToString();
            textBox2.Text = filmee.Foto;
            textBox3.Text = filmee.Titulo;
            textBox4.Text = filmee.Realizador;
            textBox5.Text = filmee.Sinopse;
            textBox6.Text = filmee.Elenco;

        }

        private void Form3_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            loadFilmes(sender, e);
            ShowButtons();


        }


        public void LockControls()
        {
            textBox1.ReadOnly = true;
            textBox2.ReadOnly = true;
            textBox3.ReadOnly = true;
            textBox4.ReadOnly = true;
            textBox5.ReadOnly = true;
            textBox6.ReadOnly = true;

        }

        public void UnlockControls()
        {
            textBox1.ReadOnly = false;
            textBox2.ReadOnly = false;
            textBox3.ReadOnly = false;
            textBox4.ReadOnly = false;
            textBox5.ReadOnly = false;
            textBox6.ReadOnly = false;
        }

        public void ShowButtons()
        {
            LockControls();
            button1.Visible = true;
            button5.Visible = true;
            button3.Visible = true;
            button4.Visible = false;
            button2.Visible = false;
        }

        public void ClearFields()
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";
        }

        public void HideButtons()
        {
            UnlockControls();
            button1.Visible = false;
            button5.Visible = false;
            button3.Visible = false;
            button4.Visible = true;
            button2.Visible = true;
        }

        private bool SaveFilme()
        {
            Filme filme = new Filme();
            try
            {
                filme.IDfilme = Int32.Parse(textBox1.Text);
                filme.Foto = textBox2.Text;
                filme.Titulo = textBox3.Text;
                filme.Realizador = textBox4.Text;
                filme.Sinopse = textBox5.Text;
                filme.Elenco = textBox6.Text;
                




            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            if (adding)
            {
                SubmiteFilme(filme);
                listBox1.Items.Add(filme);
            }
            else
            {
                UpdateFilme(filme);
                listBox1.Items[currentFilme] = filme;
            }
            return true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            adding = true;
            ClearFields();
            HideButtons();
            listBox1.Enabled = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            listBox1.Enabled = true;
            if (listBox1.Items.Count > 0)
            {
                currentFilme = listBox1.SelectedIndex;
                if (currentFilme < 0)
                {
                    currentFilme = 0;
                }
                ShowFilme();
            }
            else
            {
                ClearFields();
                LockControls();
            }
            ShowButtons();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            currentFilme = listBox1.SelectedIndex;
            if (currentFilme < 0)
            {
                MessageBox.Show("Por favor selecione um Filme");
                return;
            }
            adding = false;
            HideButtons();
            listBox1.Enabled = false;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                SaveFilme();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            listBox1.Enabled = true;
            int idx = listBox1.FindString(textBox1.Text);
            listBox1.SelectedIndex = idx;
            ShowButtons();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex > -1)
            {
                try
                {
                    RemoveFilme(((Filme)listBox1.SelectedItem).IDfilme);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }
                listBox1.Items.RemoveAt(listBox1.SelectedIndex);
                if (currentFilme == listBox1.Items.Count)
                {
                    currentFilme = listBox1.Items.Count - 1;
                }
                if (currentFilme == -1)
                {
                    ClearFields();
                    MessageBox.Show("Não há mais contactos");
                }
                else
                {
                    ShowFilme();
                }
            }
        }
    }
}

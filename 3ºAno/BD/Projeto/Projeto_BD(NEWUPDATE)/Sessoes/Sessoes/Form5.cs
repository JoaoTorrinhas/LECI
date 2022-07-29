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
    public partial class Form5 : Form
    {

        private SqlConnection cn;
        private int currentSala;
        private bool adding;

        public Form5()
        {
            InitializeComponent();
        }

        private void Form5_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            loadSala(sender, e);
            loadCinemas(sender, e);
            ShowButtons();

            button1.Visible = false;
            button2.Visible = false;
            button3.Visible = false;
            button4.Visible = false;
            button5.Visible = false;


            label1.Visible = false;
            textBox1.Visible = false;
            label2.Visible = false;
            textBox2.Visible = false;
            label3.Visible = false;
            textBox5.Visible = false;
            label4.Visible = false;
            textBox4.Visible = false;
            textBox3.Visible = false;
            label5.Visible = false;
            label7.Visible = true;



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

      
          

        private void loadSala(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.SALACINEMA", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox1.Items.Clear();
            while (reader.Read())
            {
                //Sessao S = new Sessao();
                salaCinema S = new salaCinema();
                S.IDsala = Int32.Parse(reader["id"].ToString());
                S.Lotacao = Int32.Parse(reader["lotacao"].ToString());
                S.NumSala = Int32.Parse(reader["num_sala"].ToString());
                S.NumSeats = Int32.Parse(reader["num_seats"].ToString());
                S.IDcinema = Int32.Parse(reader["id_cinemaSALACINEMA"].ToString());
                

                listBox1.Items.Add(S);
            }

            cn.Close();
            currentSala = 0;
            ShowSala();

        }

        private void SubmiteSala(salaCinema S)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "create_sala";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", S.IDsala);
            cmd.Parameters.AddWithValue("@lotacao", S.Lotacao);
            cmd.Parameters.AddWithValue("@num_sala", S.NumSala);
            cmd.Parameters.AddWithValue("@num_seats", S.NumSeats);
            cmd.Parameters.AddWithValue("@id_cinemaSALACINEMA", S.IDcinema);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao atualizar a Sala na database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        private void UpdateSala(salaCinema S)
        {
            int rows = 0;

            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "alter_sala";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", S.IDsala);
            cmd.Parameters.AddWithValue("@lotacao", S.Lotacao);
            cmd.Parameters.AddWithValue("@num_sala", S.NumSala);
            cmd.Parameters.AddWithValue("@num_seats", S.NumSeats);
            cmd.Parameters.AddWithValue("@id_cinemaSALACINEMA", S.IDcinema);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao atualizar a Sala na database. \n ERROR MESSAGE: \n" + ex.Message);
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

        private void RemoveSala(int idSala)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete_sala_byId";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", idSala);
            cmd.Connection = cn;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao eliminar a sala da database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

        }

        public void LockControls()
        {
            textBox1.ReadOnly = true;
            textBox2.ReadOnly = true;
            textBox3.ReadOnly = true;
            textBox4.ReadOnly = true;
            textBox5.ReadOnly = true;
           

        }

        public void UnlockControls()
        {
            textBox1.ReadOnly = false;
            textBox2.ReadOnly = false;
            textBox3.ReadOnly = false;
            textBox4.ReadOnly = false;
            textBox5.ReadOnly = false;
            
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

        private bool SaveSala()
        {
            salaCinema sala = new salaCinema();
            int cinema_ID = Int32.Parse(textBox6.Text);
            if (cinema_ID == Int32.Parse(textBox3.Text)) 
            { 
                try
                {
                    sala.IDsala = Int32.Parse(textBox1.Text);
                    sala.Lotacao = Int32.Parse(textBox2.Text);
                    sala.NumSala = Int32.Parse(textBox5.Text);
                    sala.NumSeats = Int32.Parse(textBox4.Text);
                    sala.IDcinema = Int32.Parse(textBox3.Text);
                

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return false;
                }
                if (adding)
                {
                    SubmiteSala(sala);
                    listBox1.Items.Add(sala);
                }
                else
                {
                    UpdateSala(sala);
                    listBox1.Items[currentSala] = sala;
                }
            }
            else
            {
                MessageBox.Show("Não é esse o seu ID do cinema");
            }
            return true;
        }

        public void ShowSala()
        {
            if (listBox1.Items.Count == 0 | currentSala < 0)
                return;
           
            salaCinema sala = new salaCinema();
            sala = (salaCinema)listBox1.Items[currentSala];
            textBox1.Text = sala.IDsala.ToString();
            textBox2.Text = sala.Lotacao.ToString();
            textBox5.Text = sala.NumSala.ToString();
            textBox4.Text = sala.NumSeats.ToString();
            textBox3.Text = sala.IDcinema.ToString();
           

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
                currentSala = listBox1.SelectedIndex;
                if (currentSala < 0)
                {
                    currentSala = 0;
                }
                ShowSala();
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
            currentSala = listBox1.SelectedIndex;
            if (currentSala < 0)
            {
                MessageBox.Show("Por favor selecione uma Sala");
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
                SaveSala();
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
                    RemoveSala(((salaCinema)listBox1.SelectedItem).IDsala);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }
                listBox1.Items.RemoveAt(listBox1.SelectedIndex);
                if (currentSala == listBox1.Items.Count)
                {
                    currentSala = listBox1.Items.Count - 1;
                }
                if (currentSala == -1)
                {
                    ClearFields();
                    MessageBox.Show("Não há mais Salas");
                }
                else
                {
                    ShowSala();
                }
            }

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex >= 0)
            {
                currentSala = listBox1.SelectedIndex;
                ShowSala();
            }
        

        }

        private void loadCinemas(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.CINEMA", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox2.Items.Clear();
            while (reader.Read())
            {
                Cinema C = new Cinema();
                C.IDCinema = Int32.Parse(reader["id"].ToString());
                C.Nome = reader["nome"].ToString();
                
                listBox2.Items.Add(C);
            }
            cn.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {

            if (!verifySGBDConnection())
            {
                return;
            }
            //SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.SALACINEMA WHERE id_cinemaSALACINEMA = @id_cinemaSALACINEMA", cn);
            //cmd.Parameters.AddWithValue("@id_cinemaSALACINEMA", Int32.Parse(textBox6.Text));
            SqlCommand cmd = new SqlCommand("SELECT* FROM getSalaByIdCinema(" + Int32.Parse(textBox6.Text) + ")", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)     //se houver cinemas que tenham o id armazenado na database
            {
                listBox1.Items.Clear();
                while (reader.Read())
                {
                    salaCinema S = new salaCinema();
                    S.IDsala = Int32.Parse(reader["id"].ToString());
                    S.Lotacao = Int32.Parse(reader["lotacao"].ToString());
                    S.NumSala = Int32.Parse(reader["num_sala"].ToString());
                    S.NumSeats = Int32.Parse(reader["num_seats"].ToString());
                    S.IDcinema = Int32.Parse(reader["id_cinemaSALACINEMA"].ToString());
                    listBox1.Items.Add(S);

                    if (listBox1.Items.Count == 0 | currentSala < 0)
                        return;


                }
                ShowButtons();
                //tornar labels e respetivas textboxes visiveis
                label1.Visible = true;
                textBox1.Visible = true;
                label2.Visible = true;
                textBox2.Visible = true;
                label3.Visible = true;
                textBox5.Visible = true;
                label4.Visible = true;
                textBox4.Visible = true;
                label5.Visible = true;
                textBox3.Visible = true;
                label7.Visible = true;
                cn.Close();
            }
            else
            {
                MessageBox.Show("O cinema com este ID não Possui salas, por favor introduza!");
                //tornar labels e respetivas textboxes visiveis
                label1.Visible = true;
                textBox1.Visible = true;
                label2.Visible = true;
                textBox2.Visible = true;
                textBox3.Visible = true;
                label3.Visible = true;
                textBox5.Visible = true;
                label4.Visible = true;
                textBox4.Visible = true;
                label5.Visible = true;
               

                textBox3.Visible = true;
                //tornar os botoes visiveis
                button1.Visible = true;
                button2.Visible = false;
                button3.Visible = true;
                button4.Visible = false;
                button5.Visible = true;
                cn.Close();
            }

        }
    }
}

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
    public partial class Form1 : Form
    {
        private SqlConnection cn;
        private int currentSessao;
        private bool adding;
        private int ID_sala;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            loadSessoes(sender, e);
            loadFilmes(sender, e);
            loadSalas(sender, e);
            //ShowButtons();
            //tornar botões invisiveis
            btnAdd.Visible = false;
            btnDelete.Visible = false;
            btnEdit.Visible = false;
            btnOk.Visible = false;
            btnCancel.Visible = false;
            //tornar labels e respetivas textboxes invisiveis
            label1.Visible = false;
            textBoxIDSESSAO.Visible = false;
            label2.Visible = false;
            textBoxDATA.Visible = false;
            label3.Visible = false;
            textBoxIDFILME.Visible = false;
            label4.Visible = false;
            textBoxIDSALA.Visible = false;
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
                currentSessao = listBox1.SelectedIndex;
                ShowSessao();
            }
        }

        private void loadSessoes(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.SESSAO", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox1.Items.Clear();
            while (reader.Read())
            {
                //Sessao S = new Sessao();
                SessaoNew S = new SessaoNew();
                S.SessaoID = Int32.Parse(reader["id"].ToString());
                S.Data = DateTime.Parse(reader["dataa"].ToString());
                S.FilmeID = Int32.Parse(reader["id_filmeSESSAO"].ToString());
                S.SalaID = Int32.Parse(reader["id_salaSESSAO"].ToString());
                //S.SessaoID = reader["id"].ToString();
                //S.Data = reader["dataa"].ToString();
                //S.FilmeID = reader["id_filmeSESSAO"].ToString();
                //S.SalaID = reader["id_salaSESSAO"].ToString();

                listBox1.Items.Add(S);
            }

            cn.Close();
            currentSessao = 0;
            ShowSessao();

        }

        private void loadFilmes(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.FILME", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox2.Items.Clear();
            while (reader.Read())
            {
                Filme F = new Filme();
                F.IDfilme = Int32.Parse(reader["id"].ToString());
                F.Foto = reader["foto"].ToString();
                F.Titulo = reader["titulo"].ToString();
                F.Realizador = reader["realizador"].ToString();
                F.Sinopse = reader["sinopse"].ToString();
                F.Elenco = reader["elenco"].ToString();
                listBox2.Items.Add(F);
            }
            cn.Close();
        }

        private void loadSalas(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.SALACINEMA", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox3.Items.Clear();
            while (reader.Read())
            {
                salaCinema S = new salaCinema();
                S.IDsala = Int32.Parse(reader["id"].ToString());
                S.Lotacao = Int32.Parse(reader["lotacao"].ToString());
                S.NumSala = Int32.Parse(reader["num_sala"].ToString());
                S.NumSeats = Int32.Parse(reader["num_seats"].ToString());
                S.IDcinema = Int32.Parse(reader["id_cinemaSALACINEMA"].ToString());
                listBox3.Items.Add(S);
            }
            cn.Close();
        }

        private void SubmiteSessao(SessaoNew S)
        {
            
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "create_sessao";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", S.SessaoID);
            cmd.Parameters.AddWithValue("@dataa", S.Data);
            cmd.Parameters.AddWithValue("@id_filmeSESSAO", S.FilmeID);
            cmd.Parameters.AddWithValue("@id_salaSESSAO", S.SalaID);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao atualizar a Sessão na database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        private void UpdateSessao(SessaoNew S)
        {
            int rows = 0;

            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "alter_sessao";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", S.SessaoID);
            cmd.Parameters.AddWithValue("@dataa", S.Data);
            cmd.Parameters.AddWithValue("@id_filmeSESSAO", S.FilmeID);
            cmd.Parameters.AddWithValue("@id_salaSESSAO", S.SalaID);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha ao atualizar a Sessão na database. \n ERROR MESSAGE: \n" + ex.Message);
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

        private void RemoveSessao(int idSessao)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete_sessao_byId";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", idSessao);
            cmd.Connection = cn;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                throw new Exception("Falha ao eliminar a sessão da database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

        }

        public void LockControls()
        {
            textBoxIDSESSAO.ReadOnly = true;
            textBoxDATA.ReadOnly = true;
            textBoxIDFILME.ReadOnly = true;
            textBoxIDSALA.ReadOnly = true;
        }

        public void UnlockControls()
        {
            textBoxIDSESSAO.ReadOnly = false;
            textBoxDATA.ReadOnly = false;
            textBoxIDFILME.ReadOnly = false;
            textBoxIDSALA.ReadOnly = false;
        }

        public void ShowButtons()
        {
            LockControls();
            btnAdd.Visible = true;
            btnDelete.Visible = true;
            btnEdit.Visible = true;
            btnOk.Visible = false;
            btnCancel.Visible = false;
        }

        public void ClearFields()
        {
            textBoxIDSESSAO.Text = "";
            textBoxDATA.Text = "";
            textBoxIDFILME.Text = "";
            textBoxIDSALA.Text = "";
        }


        public void ShowSessao()
        {
            if (listBox1.Items.Count == 0 | currentSessao < 0)
                return;
            //Sessao sessao = new Sessao();
            SessaoNew sessao = new SessaoNew();
            sessao = (SessaoNew)listBox1.Items[currentSessao];
            textBoxIDSESSAO.Text = sessao.SessaoID.ToString();
            textBoxDATA.Text = sessao.Data.ToString();
            textBoxIDFILME.Text = sessao.FilmeID.ToString();
            textBoxIDSALA.Text = sessao.SalaID.ToString();
            //sessao = (Sessao)listBox1.Items[currentSessao];
            //textBoxIDSESSAO.Text = sessao.SessaoID;
            //textBoxDATA.Text = sessao.Data;
            //textBoxIDFILME.Text = sessao.FilmeID;
            //textBoxIDSALA.Text = sessao.SalaID;
        }

        public void HideButtons()
        {
            UnlockControls();
            btnAdd.Visible = false;
            btnDelete.Visible = false;
            btnEdit.Visible = false;
            btnOk.Visible = true;
            btnCancel.Visible = true;
        }

        private bool SaveSessao()
        {
            SessaoNew sessao = new SessaoNew();
            List<int> list = new List<int>();
            salaCinema s = new salaCinema();
            int idSala;
            for (int i = 0; i < listBox3.Items.Count; i++)
            {
                s = (salaCinema)listBox3.Items[i];
                idSala = s.IDsala;
                list.Add(idSala);
            }
            if (list.Contains(Int32.Parse(textBoxIDSALA.Text))) 
            {
                try
                {
                    sessao.SessaoID = Int32.Parse(textBoxIDSESSAO.Text);
                    sessao.Data = DateTime.Parse(textBoxDATA.Text);
                    //Fazer um if que verifica se o ID da sala e do filme existe na tabela de cada um deles(ver documentação nos favoritos)

                    sessao.FilmeID = Int32.Parse(textBoxIDFILME.Text);
                    sessao.SalaID = Int32.Parse(textBoxIDSALA.Text);
                }catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return false;
                }
                if (adding)
                {
                    SubmiteSessao(sessao);
                    listBox1.Items.Add(sessao);
                }
                else
                {
                    UpdateSessao(sessao);
                    listBox1.Items[currentSessao] = sessao;
                }
            }
            else
            {
                MessageBox.Show("Id da Sala não pertence ao Cinema introduzido!!");
            }
            return true;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            adding = true;
            ClearFields();
            HideButtons();
            listBox1.Enabled = false;   
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            listBox1.Enabled = true;
            if (listBox1.Items.Count > 0)
            {
                currentSessao = listBox1.SelectedIndex;
                if (currentSessao < 0)
                {
                    currentSessao = 0;
                }
                ShowSessao();
            }else{
                ClearFields();
                LockControls();
            }
            ShowButtons();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            currentSessao = listBox1.SelectedIndex;
            if (currentSessao < 0)
            {
                MessageBox.Show("Por favor selecione uma sessão");
                return;
            }
            adding = false;
            HideButtons();
            listBox1.Enabled = false;   
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            try
            {
                SaveSessao();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            listBox1.Enabled=true;
            int idx = listBox1.FindString(textBoxIDSESSAO.Text);
            listBox1.SelectedIndex = idx;
            ShowButtons();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex > -1)
            {
                try
                {
                    RemoveSessao(((SessaoNew)listBox1.SelectedItem).SessaoID);
                }catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }
                listBox1.Items.RemoveAt(listBox1.SelectedIndex);
                if (currentSessao == listBox1.Items.Count)
                {
                    currentSessao = listBox1.Items.Count - 1;
                }
                if (currentSessao == -1)
                {
                    ClearFields();
                    MessageBox.Show("Não há mais contactos");
                }
                else
                {
                    ShowSessao();
                }
            }
        }

        private void btnCinemaID_Click(object sender, EventArgs e)
        {
            //bool rows = true;
            if (!verifySGBDConnection())
            {
                return;
            }
            //SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.SALACINEMA WHERE id_cinemaSALACINEMA = @id_cinemaSALACINEMA", cn);
            //cmd.Parameters.AddWithValue("@id_cinemaSALACINEMA", Int32.Parse(textBoxCinemaID.Text));
            SqlCommand cmd = new SqlCommand("SELECT * FROM getSalaByIdCinema(" + Int32.Parse(textBoxCinemaID.Text) + ")", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)     //se houver cinemas que tenham o id armazenado na database
            {
                listBox3.Items.Clear();
                while (reader.Read())
                {
                    salaCinema S = new salaCinema();
                    S.IDsala = Int32.Parse(reader["id"].ToString());
                    S.Lotacao = Int32.Parse(reader["lotacao"].ToString());
                    S.NumSala = Int32.Parse(reader["num_sala"].ToString());
                    S.NumSeats = Int32.Parse(reader["num_seats"].ToString());
                    S.IDcinema = Int32.Parse(reader["id_cinemaSALACINEMA"].ToString());
                    listBox3.Items.Add(S);
                }
                ShowButtons();
                //tornar labels e respetivas textboxes visiveis
                label1.Visible = true;
                textBoxIDSESSAO.Visible = true;
                label2.Visible = true;
                textBoxDATA.Visible = true;
                label3.Visible = true;
                textBoxIDFILME.Visible = true;
                label4.Visible = true;
                textBoxIDSALA.Visible = true;
                cn.Close();
            }
            else
            {
                MessageBox.Show("ID do cinema não tem salas disponíveis, ou não existe!");
                //tornar labels e respetivas textboxes visiveis
                label1.Visible = false;
                textBoxIDSESSAO.Visible = false;
                label2.Visible = false;
                textBoxDATA.Visible = false;
                label3.Visible = false;
                textBoxIDFILME.Visible = false;
                label4.Visible = false;
                textBoxIDSALA.Visible = false;
                //tornar os botoes invisiveis
                btnAdd.Visible = false;
                btnDelete.Visible = false;
                btnEdit.Visible = false;
                btnOk.Visible = false;
                btnCancel.Visible = false;
                cn.Close();
            }
            //cn.Close();

            //Alterar a listbox de acordo com os id's das salas
            //Por questão de segurança. O funcionário que introduza o id do cinema, apenas pode alterar as sessões das salas pertencentes a esse cinema (id).
            //Não pudendo alterar as sessões dos outros cinemas
            changeListBoxSessoesByIDsala();
        }

        private void changeListBoxSessoesByIDsala()
        {
            salaCinema sala = new salaCinema();
            listBox1.Items.Clear();
            for (int i = 0; i < listBox3.Items.Count; i++)
            {
                sala = (salaCinema)listBox3.Items[i];
                ID_sala = sala.IDsala;
                if (!verifySGBDConnection())
                {
                    return;
                }
                //SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.SESSAO WHERE id_salaSESSAO = @id_salaSESSAO", cn);
                //cmd.Parameters.AddWithValue("@id_salaSESSAO", ID_sala);
                SqlCommand cmd = new SqlCommand("SELECT * FROM getSessaoByIdSala(" + ID_sala + ")", cn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    SessaoNew S = new SessaoNew();
                    S.SessaoID = Int32.Parse(reader["id"].ToString());
                    S.Data = DateTime.Parse(reader["dataa"].ToString());
                    S.FilmeID = Int32.Parse(reader["id_filmeSESSAO"].ToString());
                    S.SalaID = Int32.Parse(reader["id_salaSESSAO"].ToString());

                    listBox1.Items.Add(S);
                }
                cn.Close();
            }
        }
    }
}

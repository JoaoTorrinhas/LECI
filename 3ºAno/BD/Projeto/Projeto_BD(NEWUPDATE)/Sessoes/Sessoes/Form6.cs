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
    public partial class Form6 : Form
    {
        private int currentFilme;
        private SqlConnection cn;
        private int currentFilmeID;

        public Form6()
        {
            InitializeComponent();
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox2.SelectedIndex >= 0)
            {
                currentFilme = listBox2.SelectedIndex;
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
                SessaoNew S = new SessaoNew();
                S.SessaoID = Int32.Parse(reader["id"].ToString());
                S.Data = DateTime.Parse(reader["dataa"].ToString());
                S.FilmeID = Int32.Parse(reader["id_filmeSESSAO"].ToString());
                S.SalaID = Int32.Parse(reader["id_salaSESSAO"].ToString());

                listBox1.Items.Add(S);
            }

            cn.Close();
        }

        private void loadEstatisticas(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.V_BILHETESESSAO", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBox3.Items.Clear();
            while (reader.Read())
            {
                Estatisticas stats = new Estatisticas();
                stats.ID = Int32.Parse(reader["id"].ToString());
                stats.Horario = DateTime.Parse(reader["dataa"].ToString());
                stats.Titulo = reader["titulo"].ToString();
                stats.NumBihetes = Int32.Parse(reader["numero_de_bilhetes"].ToString());
                listBox3.Items.Add(stats);
            }
            cn.Close();
        }

        private void loadSessoesByFilmeId()
        {
            if (listBox2.Items.Count == 0 | currentFilme < 0)
            {
                return;
            }
            Filme filme = new Filme();
            filme = (Filme)listBox2.Items[currentFilme];
            currentFilmeID = filme.IDfilme;

            if (listBox2.Items.Count >= 1)  //Se houver items na listbox2 dos filmes
            {
                //getFilmeID();
                //Adicionar as sessoes com esse ID do filme à outra listbox
                if (!verifySGBDConnection())
                {
                    return;
                }
                //SqlCommand cmd = new SqlCommand("SELECT * FROM PROJ_CINEMAS.SESSAO WHERE id_filmeSESSAO = @id_filmeSESSAO", cn);
                //cmd.Parameters.AddWithValue("@id_filmeSESSAO", currentFilmeID);
                SqlCommand cmd = new SqlCommand("SELECT * FROM getSessaoByIdFilme(" + currentFilmeID + ")", cn);
                SqlDataReader reader = cmd.ExecuteReader();
                listBox1.Items.Clear();
                while (reader.Read())
                {
                    SessaoNew S = new SessaoNew();
                    S.SessaoID = Int32.Parse(reader["id"].ToString());
                    S.Data = DateTime.Parse(reader["dataa"].ToString());
                    S.FilmeID = Int32.Parse(reader["id_filmeSESSAO"].ToString());
                    S.SalaID = Int32.Parse(reader["id_salaSESSAO"].ToString());
                    listBox1.Items.Add(S);
                }
            }
            cn.Close();
        }

        private void Form6_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            loadFilmesUser(sender, e);
            loadSessoes(sender, e);
            loadEstatisticas(sender, e);
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

        private void loadFilmesUser(object sender, EventArgs e)
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

        private void btnSessao_Click(object sender, EventArgs e)
        {
            loadSessoesByFilmeId();
        }

        private void btwSessoesTarde_Click(object sender, EventArgs e)
        {
            String aux = "15/05/2024 19:00:00"; //Uma data qualquer, o que interessa é a hora
            DateTime dt = DateTime.Parse(aux);
            SessaoNew sessao = new SessaoNew();
            for(int i = listBox1.Items.Count -1; i> -1; i--)
            {
                sessao = (SessaoNew)listBox1.Items[i];
                if (sessao.Data.TimeOfDay > dt.TimeOfDay)   //Se não for a sessão da tarde (data > 19:00:00), remove. Caso contrário mantém
                {
                    listBox1.Items.Remove(sessao);
                }
            }
        }

        private void btwSessoesNoite_Click(object sender, EventArgs e)
        {
            String aux = "15/05/2024 19:00:00"; //Uma data qualquer, o que interessa é a hora
            DateTime dt = DateTime.Parse(aux);
            SessaoNew sessao = new SessaoNew();
            for (int i = listBox1.Items.Count - 1; i > -1; i--)
            {
                sessao = (SessaoNew)listBox1.Items[i];
                if (sessao.Data.TimeOfDay < dt.TimeOfDay)   //Se não for a sessão da noite (data < 19:00:00), remove. Caso contrário mantém
                {
                    listBox1.Items.Remove(sessao);
                }
            }
        }

        private void btnTodasSessoes_Click(object sender, EventArgs e)
        {
            loadSessoes(sender, e);
        }
    }
}

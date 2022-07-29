using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sessoes
{
    public class Filme
    {
        private Int32 _idFilme;
        private String _foto;
        private String _titulo;
        private String _realizador;
        private String _sinopse;
        private String _elenco;

        public Int32 IDfilme
        {
            get { return _idFilme; }
            set { _idFilme = value; }
        }

        public String Titulo
        {
            get { return _titulo; }
            set
            {
                if (value == null | String.IsNullOrEmpty(value))
                {
                    throw new Exception("Titulo do filme não pode estar vazio");
                    return;
                }
                _titulo = value;
            }
        }

        public String Foto
        {
            get { return _foto; }
            set { _foto = value; }
        }

        public String Realizador
        {
            get { return _realizador; }
            set { _realizador = value; }
        }

        public String Sinopse
        {
            get { return _sinopse; }
            set { _sinopse = value; }
        }

        public String Elenco
        {
            get { return _elenco; }
            set { _elenco = value; }
        }

        public override String ToString()
        {
            //+ "  IdCinema:  " + _elenco
            return "FilmeID: " + _idFilme + "  Titulo:  " + _titulo + "  Realizador:  " + _realizador + "  Elenco:  " + _elenco;
        }

        public Filme() : base()
        {
        }

        public Filme(int IDfilme, String Titulo, String Foto, String Realizador, String Sinopse, String Elenco) : base()
        {
            this.IDfilme = IDfilme;
            this.Titulo = Titulo;
            this.Foto = Foto;
            this.Realizador = Realizador;
            this.Sinopse = Sinopse;
            this.Elenco = Elenco;
        }



    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sessoes
{
    [Serializable()]
    public class Estatisticas
    {
        private Int32 _id;
        private DateTime _horario;
        private String _titulo;
        private Int32 _numBilhetes;



        public Int32 ID
        {
            get { return _id; }
            set { _id = value; }
        }


        public DateTime Horario
        {
            get { return _horario; }
            set { _horario = value; }
        }

        public String Titulo
        {
            get { return _titulo; }
            set { _titulo = value; }
        }

        public Int32 NumBihetes
        {
            get { return _numBilhetes; }
            set { _numBilhetes = value; }
        }

        public override String ToString()
        {
            //+ "  IdCinema:  " + _elenco
            return "Horário-" + _horario + "   Filme-" + _titulo + "   Bilhetes Vendidos-" + _numBilhetes;
        }

        public Estatisticas() : base()
        {
        }
    }
}

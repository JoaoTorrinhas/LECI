using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sessoes
{
    [Serializable()]
    public class salaCinema
    {
        private Int32 _idSala;
        private Int32 _lotacao;
        private Int32 _numSala;
        private Int32 _numSeats;
        private Int32 _idCinema;

        public Int32 IDsala
        {
            get { return _idSala; }
            set { _idSala = value; }
        }

        public Int32 IDcinema
        {
            get { return _idCinema; }
            set
            {
                if (value == null )
                {
                    throw new Exception("ID do cinema não pode estar vazio");
                    return;
                }
                _idCinema = value;
            }
        }

        public Int32 Lotacao
        {
            get { return _lotacao; }
            set { _lotacao = value; }
        }

        public Int32 NumSala
        {
            get { return _numSala; }
            set { _numSala = value; }
        }

        public Int32 NumSeats
        {
            get { return _numSeats; }
            set { _numSeats = value; }
        }

        public override String ToString()
        {
            return "IDsala: " + _idSala + "  NºSala:  " + _numSala + "  NºLugares:  " + _numSeats + "  IdCinema:  " + _idCinema;
        }

        public salaCinema() : base()
        {
        }

        public salaCinema(int IDsala, int Lotacao, int NumSala, int NumSeats, int IDcinema) : base()
        {
            this.IDsala = IDsala;
            this.Lotacao = Lotacao;
            this.NumSala = NumSala;
            this.NumSeats = NumSeats;
            this.IDcinema = IDcinema;
            
        }

    }
}

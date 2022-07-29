using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sessoes
{
    public class Cinema
    {
        private Int32 _idCinema;
        private String _Nome;


        public Int32 IDCinema
        {
            get { return _idCinema; }
            set { _idCinema = value; }
        }




        public String Nome
        {
            get { return _Nome; }
            set { _Nome = value; }
        }



        public override String ToString()
        {
            //+ "  IdCinema:  " + _elenco
            return "CinemaID: " + _idCinema + "  Nome:  " + _Nome;
        }

        public Cinema() : base()
        {
        }

        public Cinema(int IDCinema, String Nome) : base()
        {
            this.IDCinema = IDCinema;
            this.Nome = Nome;




        }
    }
}

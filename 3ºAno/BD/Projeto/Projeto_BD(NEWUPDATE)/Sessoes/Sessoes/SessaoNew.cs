using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sessoes
{
    [Serializable()]
    public class SessaoNew
    {

		private Int32 _sessaoID;
		private DateTime _data;
		private Int32 _filmeID;
		private Int32 _salaID;

		public Int32 SessaoID
		{
			get { return _sessaoID; }
			set { _sessaoID = value; }
		}

		public DateTime Data
		{
			get { return _data; }
			set
			{
				if (value == null)
				{
					throw new Exception("Data da sessão não pode estar vazia");
					return;
				}
				_data = value;
			}
		}

		public Int32 FilmeID
		{
			get { return _filmeID; }
			set { _filmeID = value; }
		}

		public Int32 SalaID
		{
			get { return _salaID; }
			set { _salaID = value; }
		}

		public override String ToString()
		{
			return _sessaoID + "  Data:  " + _data + "  filmeID:  " + _filmeID + "  salaID:  " + _salaID;
		}

		public SessaoNew() : base()
		{
		}

		public SessaoNew(int SessaoId, DateTime Data, int FilmeID, int SalaID) : base()
		{
			this.SessaoID = SessaoId;
			this.Data = Data;
			this.FilmeID = FilmeID;
			this.SalaID = SalaID;
		}
	}
}

using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;

namespace Contacts
{
	[Serializable()]    //NÃO FUNCIONA NÃO SEI PORQUÊ???????
	public class Sessao
	{
		private String _sessaoID;
		private String _data;
		private String _filmeID;
		private String _salaID;

		public String SessaoID
		{
			get { return _sessaoID; }
			set { _sessaoID = value; }
		}

		public String Data
		{
			get { return _data; }
			set
			{
				if (value == null | String.IsNullOrEmpty(value))
				{
					throw new Exception("Data da sessão não pode estar vazia");
					return;
				}
				_data = value;
			}
		}

		public String FilmeID
		{
			get { return _filmeID; }
			set { _filmeID = value; }
		}

		public String SalaID
		{
			get { return _salaID; }
			set { _salaID = value; }
		}

		public override String ToString()
		{
			return _sessaoID + "  |Data:  " + _data + "  |IDfilme:  " + _filmeID + "  |IDsala:  " + _salaID;
		}

		public Sessao() : base()
		{
		}

		public Sessao(String SessaoId, String Data, String FilmeID, String SalaID) : base()
		{
			this.SessaoID = SessaoId;
			this.Data = Data;
			this.FilmeID = FilmeID;
			this.SalaID = SalaID;
		}
	}
}




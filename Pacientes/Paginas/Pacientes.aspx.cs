using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pacientes.DAL;
using Pacientes.Modelo;

namespace Pacientes.Paginas
{
    public partial class Pacientes : System.Web.UI.Page
    {
        protected List<ModeloPaciente> ListaPacientes = new List<ModeloPaciente>();
        protected void Page_Load(object sender, EventArgs e)
        {
            AtualizaLista();
        }

        public void AtualizaLista()
        {

            DALPaciente dal = new DALPaciente();
            ListaPacientes = new List<ModeloPaciente>();
            ListaPacientes = dal.Listar();
        }

        protected void Inserir_Paciente()
        {

        }

    }
}
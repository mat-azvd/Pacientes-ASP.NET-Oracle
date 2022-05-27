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
    public partial class Alergia : System.Web.UI.Page
    {

        protected List<ModeloAlergia> ListaAlergia = new List<ModeloAlergia>();
        protected void Page_Load(object sender, EventArgs e)
        {
            AtualizaLista();
        }

        public void AtualizaLista()
        {

            DALalergia dal = new DALalergia();
            ListaAlergia = new List<ModeloAlergia>();
            ListaAlergia = dal.ListaDeAlergias();
        }
    }
}
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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cpf"] == null)
            {
                Response.Redirect("~/Paginas/Login.aspx");
            }
            else
            {
                DALUsuario du = new DALUsuario();
                ModeloUsuario u = du.GetRegistroEmail(Session["cpf"].ToString());
            }
        }
    }
}
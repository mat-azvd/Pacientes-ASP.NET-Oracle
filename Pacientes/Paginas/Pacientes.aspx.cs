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

        /*protected void Button_Modal_inserir(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script language='javascript'>");
            sb.Append(@"$('#modal-fade').modal('show');");
            sb.Append(@"</script>");

            ClientScript.RegisterStartupScript(this.GetType(), "JSScript", sb.ToString());

        }
        */


        protected void botaoInserir_Click1(object sender, EventArgs e)
        {
            string nome = Convert.ToString(txtNome.Text);
            string cpf = Convert.ToString(txtNome.Text);
            string sexo = Convert.ToString(txtNome.Text);
            string telefone = Convert.ToString(txtNome.Text);
            string email = Convert.ToString(txtNome.Text);
            string data_nascimento = Convert.ToString(txtNome.Text);
            string nome_mae = Convert.ToString(txtNome.Text);
            string alergias = Convert.ToString(txtNome.Text);
            string estado_civil = Convert.ToString(txtNome.Text);
            string rua = Convert.ToString(txtNome.Text);
            string estado = Convert.ToString(txtNome.Text);
            string cidade = Convert.ToString(txtNome.Text);
            string numero = Convert.ToString(txtNome.Text);
            string complemento = Convert.ToString(txtNome.Text);
        }

        protected void botaoModalInserir_Abrir(object sender, EventArgs e)
        {
            modalInserir.Show();
        }
    }
}
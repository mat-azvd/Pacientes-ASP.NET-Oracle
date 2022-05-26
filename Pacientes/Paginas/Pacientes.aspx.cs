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
            string cpf = Convert.ToString(txtCpf.Text);
            string sexo = Convert.ToString(txtSexo.Text);
            string telefone = Convert.ToString(txtTelefone.Text);
            string email = Convert.ToString(txtEmail.Text);
            string data_nascimento = Convert.ToString(txtData_nascimento.Text);
            string nome_mae = Convert.ToString(txtNome_mae.Text);
            string alergias = Convert.ToString(txtAlergia.Text);
            string estado_civil = Convert.ToString(txtEstado_civil.Text);
            string rua = Convert.ToString(txtRua.Text);
            string estado = Convert.ToString(txtEstado.Text);
            string cidade = Convert.ToString(txtCidade.Text);
            string numero = Convert.ToString(txtNumero.Text);
            string complemento = Convert.ToString(txtComplemento.Text);

        }

        protected void botaoModalInserir_Abrir(object sender, EventArgs e)
        {
            DALPaciente dal = new DALPaciente();

            txtEstado.DataSource = dal.ListarEstados();
            txtEstado.DataBind();
            modalInserir.Show();
        }

        protected void txtEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DALPaciente dal = new DALPaciente();
    
            txtEstado.DataSource = dal.ListarEstados();
            txtEstado.DataBind();
        }

        protected void txtEstado_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        
    }
}
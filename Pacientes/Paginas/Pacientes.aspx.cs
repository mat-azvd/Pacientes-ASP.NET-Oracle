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
        /*protected List<ModeloPaciente> ListaPacientes = new List<ModeloPaciente>();*/
        protected void Page_Load(object sender, EventArgs e)
        {
            AtualizaLista();
        }

        public void AtualizaLista()
        {

            DALPaciente dal = new DALPaciente();
            /*ListaPacientes = new List<ModeloPaciente>();
            ListaPacientes = dal.Listar();*/
            GridViewPacientes.DataSource = dal.Listar();
            GridViewPacientes.DataBind();
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
            string nome_alergia = Convert.ToString(txtAlergia.Text);
            string cpf = Convert.ToString(txtCpf.Text);
            /*
            
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
            string nome = Convert.ToString(txtNome.Text);
            */

            DALPaciente dal = new DALPaciente();
            DALalergia dal2 = new DALalergia();
            ModeloAlergia obj2 = new ModeloAlergia();
            ModeloPaciente obj = new ModeloPaciente();
            ModeloPacienteXAlergia obj3 = new ModeloPacienteXAlergia();

            obj2.nome_alergia = nome_alergia.Trim();
            obj.nome = nome.Trim();
            obj.cpf = cpf.Trim();
            obj.sexo = Convert.ToString(txtSexo.Text);
            obj.telefone = Convert.ToString(txtTelefone.Text);
            obj.email = Convert.ToString(txtEmail.Text);
            obj.Data_Nascimento = Convert.ToString(txtData_nascimento.Text);
            obj.Nome_Mae = Convert.ToString(txtNome_mae.Text);
            
            obj.Estado_Civil = Convert.ToString(txtEstado_civil.Text);
            obj.Rua = Convert.ToString(txtRua.Text);
            obj.Estado = Convert.ToString(txtEstado.Text);
            obj.Cidade = Convert.ToString(txtCidade.Text);
            obj.Numero = Convert.ToString(txtNumero.Text);
            obj.Complemento = Convert.ToString(txtComplemento.Text);

            ModeloPaciente comparar = dal.GetRegistro(obj.cpf);

            if (comparar.cpf != null)
            {
                ErroModal.Show();
            }
            else
            {
                dal.inserir(obj);
                obj2 = dal2.GetAlergiaNome(obj2.nome_alergia);
                obj = dal.GetRegistro(obj.cpf);
                obj3.ID_PACIENTE = obj.ID;
                obj3.ID_ALERGIA = obj2.ID;
                dal2.inserirPacienteXAlergia(obj3);
               OkModal.Show();
            }

        }

        protected void botaoModalInserir_Abrir(object sender, EventArgs e)
        {
            DALPaciente dal = new DALPaciente();

            DALalergia dal2 = new DALalergia();

            txtAlergia.DataSource = dal2.ListarAlergias();
            txtAlergia.DataBind();
           
            txtEstado.DataSource = dal.ListarEstados();
            txtEstado.DataBind();
            modalInserir.Show();
        }

        protected void txtEstado_SelectedIndexChanged1(object sender, EventArgs e)
        {
           /*DALPaciente dal = new DALPaciente();
    
            txtEstado.DataSource = dal.ListarEstados();
            txtEstado.DataBind();
           */
        }

        protected void txtAlergia_SelectedIndexChanged1(object sender, EventArgs e)
        {
            /*
            DALalergia dal = new DALalergia();

            txtAlergia.DataSource = dal.ListarAlergias();
            txtAlergia.DataBind();
            */
        }

      
        protected void botaoOk_Fechar(object sender, EventArgs e)
        {

            AtualizaLista();
            Response.Redirect("~/Paginas/Pacientes.aspx");
        }

        protected void GridViewPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void GridViewPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int linha = Convert.ToInt32(e.RowIndex);
            string cod = Convert.ToString(GridViewPacientes.Rows[linha].Cells[1].Text);
            /*
            labelCOD.Text = cod;
            ModalCorfirma.Show();
            */
            
        }
        /*
        protected void botaoConfirma_Confirmar(object sender, EventArgs e)
        {

            DALPaciente dal = new DALPaciente();
            dal.DeletePaciente(labelCOD.Text);
            AtualizaLista();

        }
        protected void botaoConfirma_Cancelar(object sender, EventArgs e)
        {

            AtualizaLista();
            Response.Redirect("~/Paginas/Pacientes.aspx");
        }
       */

        protected void GridViewPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           DALPaciente dal = new DALPaciente();
            GridViewPacientes.PageIndex = e.NewPageIndex;
            GridViewPacientes.DataSource = dal.Listar();
            GridViewPacientes.DataBind();
        }

        protected void modalTesteABrir(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }
    }
}
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

        //protected List<ModeloAlergia> ListaAlergia = new List<ModeloAlergia>();
        protected void Page_Load(object sender, EventArgs e)
        {
            AtualizaLista();
        }

        public void AtualizaLista()
        {

            DALalergia dal = new DALalergia();
            // ListaAlergia = new List<ModeloAlergia>();
            //ListaAlergia = dal.ListaDeAlergias();
            GridViewAlergia.DataSource = dal.ListaDeAlergias();
            GridViewAlergia.DataBind();
        }


        protected void GridViewAlergia_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int linha = Convert.ToInt32(e.RowIndex);
            string cod = Convert.ToString(GridViewAlergia.Rows[linha].Cells[0].Text);
            string NomeAlergiaCOD = Convert.ToString(GridViewAlergia.Rows[linha].Cells[1].Text);

            labelCOD1.Text = cod;
            labelAlergiaCOD.Text = NomeAlergiaCOD;
            ConfirmaModalAlergia.Show();


        }

        protected void botaoConfirmaAlergia_Confirmar(object sender, EventArgs e)
        {
            DALPaciente dal = new DALPaciente();
            DALalergia dal2 = new DALalergia();
            ModeloAlergia obj2 = new ModeloAlergia();
            ModeloPaciente obj = new ModeloPaciente();
            ModeloPacienteXAlergia obj3 = new ModeloPacienteXAlergia();

            ModeloAlergia objA = dal2.GetAlergiaID(Convert.ToInt32(labelCOD1.Text));

            int codAP = objA.ID;

            ModeloPacienteXAlergia objAP = dal2.GetPacienteIDXAlergia(codAP);

            if(objAP.ID_ALERGIA != 0)
            {
                ModalErroDelete.Show();
            }

            else
            {

                dal2.DeletePacienteXAlergia(objAP.ID_PACIENTE);
                dal2.DeleteAlergia(Convert.ToInt32(labelCOD1.Text));
                AtualizaLista();
                Response.Redirect("~/Paginas/Alergia.aspx");
            }
                   

        }

       
        protected void botaoModalInserirAlergia_Abrir(object sender, EventArgs e)
        {

            ModalInserirAlergia.Show();
        }



        protected void botaoInserirAlergia_Click1(object sender, EventArgs e)
        {
            string nome_alergia = Convert.ToString(txtNomeAlergia.Text);
            string msg = "";

            DALalergia dal = new DALalergia();
            ModeloAlergia obj = new ModeloAlergia();

            obj.nome_alergia = nome_alergia.Trim();

            ModeloAlergia objComparar = dal.GetAlergiaNome(obj.nome_alergia);

            if (objComparar.nome_alergia != null)
            {
                ErroModalAlergia.Show();
            }
            else
            {
                dal.inserirAlergia(obj);
                OkModalAlergia.Show();
            }
            

            Page_Load(null, EventArgs.Empty);
        }


        protected void deleteAlergia_click()
        {
           
        }

        protected void botaoOk_Fechar1(object sender, EventArgs e)
        {

            AtualizaLista();
            Response.Redirect("~/Paginas/Alergia.aspx");
        }

    }

    


}
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
                msg = "<script> alert('ERRO: Produto ja Existe!'); </script>";
            }
            else
            {
                dal.inserirAlergia(obj);
                msg = "<script> alert('Produto Inserido!'); </script>";
            }
            

            Page_Load(null, EventArgs.Empty);
        }


        protected void deleteAlergia_click()
        {
           
        }

    }

   

}
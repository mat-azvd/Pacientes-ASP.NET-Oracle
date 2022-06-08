using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pacientes.DAL;
using Pacientes.Modelo;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace Pacientes.Paginas
{
    public partial class Pacientes : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            AtualizaLista();
        }

        public void AtualizaLista()
        {

            DALPaciente dal = new DALPaciente();
           
            GridViewPacientes.DataSource = dal.Listar();
            GridViewPacientes.DataBind();
        }
     

        protected void btnPesquisar()
        {

        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
            string pesquisa = Convert.ToString(txtPesquisa.Text.Trim());
            DALPaciente dal = new DALPaciente();
            ModeloPaciente obj = new ModeloPaciente();
            if (pesquisa != null)
            {
                GridViewPacientes.DataSource = dal.ListarPesquisa(pesquisa);
                GridViewPacientes.DataBind();
            }
            

        }


        protected void botaoInserir_Click1(object sender, EventArgs e)
        {
            string nome = Convert.ToString(txtNome.Text);
            string nome_alergia = Convert.ToString(txtAlergia.Text);
            string cpf = Convert.ToString(txtCpf.Text);         

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


        protected void botaoOk_Fechar(object sender, EventArgs e)
        {

            AtualizaLista();
            Response.Redirect("~/Paginas/Pacientes.aspx");
        }

        protected void GridViewPacientes_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int linha = GridViewPacientes.SelectedIndex;
            string cod = Convert.ToString(GridViewPacientes.Rows[linha].Cells[1].Text);

            DALPaciente dal = new DALPaciente();
            DALalergia dal2 = new DALalergia();
         

            ModeloPaciente objP = dal.GetRegistro(cod);

            int codAP = objP.ID;

            ModeloPacienteXAlergia objAP = dal2.GetAlergiaXPacienteID(codAP);

            int codA = objAP.ID_ALERGIA;

            ModeloAlergia objA = dal2.GetAlergiaID(codA);

            txtEditarAlergia.DataSource = dal2.ListarAlergias();
            txtEditarAlergia.DataBind();
            txtEditarEstado.DataSource = dal.ListarEstados();
            txtEditarEstado.DataBind();



            txtEditarNome.Text = Convert.ToString(objP.nome);
            txtEditarCpf.Text = Convert.ToString(objP.cpf);
            txtEditarSexo.Text = Convert.ToString(objP.sexo);
            txtEditarNasci.Text = Convert.ToString(objP.Data_Nascimento);
            txtEditarRua.Text = Convert.ToString(objP.Rua);
            txtEditarNumero.Text = Convert.ToString(objP.Numero);
            txtEditarCidade.Text = Convert.ToString(objP.Cidade);
            txtEditarEstado.Text = Convert.ToString(objP.Estado);
            txtEditarComplemento.Text = Convert.ToString(objP.Complemento);
            txtEditarTelefone.Text = Convert.ToString(objP.telefone);
            txtEditarEmail.Text = Convert.ToString(objP.email);
            txtEditarEstadoCivil.Text = Convert.ToString(objP.Estado_Civil);
            txtEditarMae.Text = Convert.ToString(objP.Nome_Mae);
            txtEditarAlergia.Text = Convert.ToString(objA.nome_alergia);
                     


            ModalEditarPaciente.Show();

        }

        protected void botaoEditarOK_Click(object sender, EventArgs e)
        {
            int linha = GridViewPacientes.SelectedIndex;
            string cod = Convert.ToString(GridViewPacientes.Rows[linha].Cells[1].Text);

            DALPaciente dal = new DALPaciente();
            DALalergia dal2 = new DALalergia();
       

            ModeloPaciente objP2 = dal.GetRegistro(cod);

            int codAP = objP2.ID;

            ModeloPacienteXAlergia objAP = dal2.GetAlergiaXPacienteID(codAP);


            string nome_alergia = txtEditarAlergia.Text;

            ModeloAlergia novaID_Alergia = dal2.GetNovaAlergia(nome_alergia);


            objAP.ID_ALERGIA = Convert.ToInt32(novaID_Alergia.ID);
            dal2.AlterarAlergiaXPaciente(objAP);

            ModeloPaciente objP = dal.GetRegistro(cod);

            objP.nome = Convert.ToString(txtEditarNome.Text);
            objP.cpf = Convert.ToString(txtEditarCpf.Text);
            objP.sexo = Convert.ToString(txtEditarSexo.Text);
            objP.telefone = Convert.ToString(txtEditarTelefone.Text);
            objP.email = Convert.ToString(txtEditarEmail.Text);
            objP.Data_Nascimento = Convert.ToString(txtEditarNasci.Text);
            objP.Nome_Mae = Convert.ToString(txtEditarMae.Text);
            objP.Estado_Civil = Convert.ToString(txtEditarEstadoCivil.Text);
            objP.Rua = Convert.ToString(txtEditarRua.Text);
            objP.Estado = Convert.ToString(txtEditarEstado.Text);
            objP.Cidade = Convert.ToString(txtEditarCidade.Text);
            objP.Numero = Convert.ToString(txtEditarNumero.Text);
            objP.Complemento = Convert.ToString(txtEditarComplemento.Text);

            dal.AlterarPaciente(objP);
            
            AtualizaLista();
            Response.Redirect("~/Paginas/Pacientes.aspx");
        }
          
        protected void GridViewPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int linha = Convert.ToInt32(e.RowIndex);
            string cod = Convert.ToString(GridViewPacientes.Rows[linha].Cells[1].Text);
            string NomeCOD = Convert.ToString(GridViewPacientes.Rows[linha].Cells[0].Text);

            labelCOD.Text = cod;
            labelNomeCOD.Text = NomeCOD;
            ConfirmaModal.Show();
            
            
        }
        
        protected void botaoConfirma_Confirmar(object sender, EventArgs e)
        {

            DALPaciente dal = new DALPaciente();
            DALalergia dal2 = new DALalergia();
            ModeloAlergia obj2 = new ModeloAlergia();
            ModeloPaciente obj = new ModeloPaciente();
            ModeloPacienteXAlergia obj3 = new ModeloPacienteXAlergia();

            ModeloPaciente objP = dal.GetRegistro(labelCOD.Text);

            int codAP = objP.ID;

            ModeloPacienteXAlergia objAP = dal2.GetAlergiaXPacienteID(codAP);

            dal2.DeletePacienteXAlergia(objAP.ID_PACIENTE);
            dal.DeletePaciente(labelCOD.Text);         
            AtualizaLista();
            Response.Redirect("~/Paginas/Pacientes.aspx");


        }


        protected void GridViewPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           DALPaciente dal = new DALPaciente();
            GridViewPacientes.PageIndex = e.NewPageIndex;
            GridViewPacientes.DataSource = dal.Listar();
            GridViewPacientes.DataBind();
        }


        protected void ButtonDownloadPDF_Click(object sender, EventArgs e)
        {
            DALPaciente dal = new DALPaciente();
            GridViewPacientes.AllowPaging = false;
            GridViewPacientes.DataSource = dal.Listar();
            GridViewPacientes.DataBind();

            int numColunas = GridViewPacientes.HeaderRow.Cells.Count - 2;

            PdfPTable pdfTable = new PdfPTable(numColunas);

            foreach (TableCell gridViewHeaderCell in GridViewPacientes.HeaderRow.Cells)
            {
                if (gridViewHeaderCell.Text == "Nome" || gridViewHeaderCell.Text == "CPF")
                {

                    // Criar objeto fonte para o PDF
                    Font font = new Font();

                    // Mudar a cor do header da Grindview
                    font.Color = new BaseColor(GridViewPacientes.HeaderStyle.ForeColor);

                    // Criar cada celula do pdf passando o texto e a fonte
                    PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewHeaderCell.Text, font));

                    // Cor do background da grindview
                    pdfCell.BackgroundColor = new BaseColor(GridViewPacientes.HeaderStyle.BackColor);

                    // Adicionar as celulas na tabela de PDF
                    pdfTable.AddCell(pdfCell);
                }
            }

            foreach (GridViewRow gridViewRow in GridViewPacientes.Rows)
            {
                if (gridViewRow.RowType == DataControlRowType.DataRow)
                {
                    // Loop por cada celula das linhas da Grindview
                    foreach (TableCell gridViewCell in gridViewRow.Cells)
                    {
                        Font font = new Font();

                        PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewCell.Text, font));

                        pdfCell.BackgroundColor = new BaseColor(GridViewPacientes.RowStyle.BackColor);

                        pdfTable.AddCell(pdfCell);
                    }
                }
            }

            Document pdfDocumento = new Document(PageSize.A4, 10f, 10f, 10f, 10f);

            PdfWriter.GetInstance(pdfDocumento, Response.OutputStream);

            pdfDocumento.Open();
            pdfDocumento.AddTitle("Nome");
            pdfDocumento.Add(pdfTable);
            pdfDocumento.Close();

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=Lista_de_Pacientes.pdf");
            Response.Write(pdfDocumento);
            Response.Flush();
            Response.End();
        }























        protected void txtEstado_SelectedIndexChanged1(object sender, EventArgs e)
        {
            /*DALPaciente dal = new DALPaciente();

             txtEstado.DataSource = dal.ListarEstados();
             txtEstado.DataBind();
            */
        }

        protected void txtEditarEstado_SelectedIndexChanged1(object sender, EventArgs e)
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

        protected void txtEditarAlergia_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            DALalergia dal = new DALalergia();

            txtAlergia.DataSource = dal.ListarAlergias();
            txtAlergia.DataBind();
            */
        }     


    }
}
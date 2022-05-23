using Pacientes.DAL;
using Pacientes.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Pacientes.Paginas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void btEntrar_Click(object sender, EventArgs e)
        {
            string cpf = TextCpf.Text;
            string senha = TextSenha.Text;

            DALUsuario du = new DALUsuario();
            ModeloUsuario u = du.GetRegistro(cpf, senha);


            if (u.cpf != null)
            {

                u.cpf = u.cpf.Trim();
                u.senha = u.senha.Trim();

                if (string.Equals(cpf, u.cpf) && string.Equals(senha, u.senha))
                {
                    Session["ID"] = u.ID;
                    Session["nome"] = u.nome;
                    Session["email"] = cpf;
                    Response.Redirect("~/Paginas/Pacientes.aspx");

                }

                else
                {

                    String msg = "<script> alert('Login ou senha invalidos!!!!'); </script>";
                    Response.Write(msg);
                    //Response.Write("<script> alert('E-mail ou senha incorretos!');</script>");

                }

            }

            else
            {
                String msg = "<script> alert('Login ou senha invalidos!!!!'); </script>";
                Response.Write(msg);

            }
        }

    }
}
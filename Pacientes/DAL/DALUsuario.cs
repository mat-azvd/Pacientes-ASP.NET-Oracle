using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pacientes.Modelo;
using System.Data;
using System.Data.SqlClient;
using Oracle.ManagedDataAccess.Client;

namespace Pacientes.DAL
{
    public class DALUsuario
    {
        private System.Configuration.ConnectionStringSettings connString;


        public DALUsuario()
        {

            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BancoPacientesOracle"];

        }

        public void inserir (ModeloUsuario obj)
        {
            //ModeloUsuario obj = new ModeloUsuario();
            OracleConnection con = new OracleConnection(connString.ToString());
            OracleCommand cmd = new OracleCommand();

            
                try
                {

                    cmd.CommandText = "Insert into Pacientes.Usuario (nome,email,senha) values (@nome,@email,@senha)";
                    cmd.Parameters.Add("nome", obj.nome);
                    cmd.Parameters.Add("email", obj.email);
                    cmd.Parameters.Add("senha", obj.senha);

                    cmd.Connection = con;
                    con.Open();
                    obj.ID = Convert.ToInt32(cmd.ExecuteScalar());

                }

                catch (Exception erro)
                {
                    new Exception(erro.Message);
                }

                finally
                {
                    con.Close();
                }
                
        }

    }
}
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

        public ModeloUsuario GetRegistro(String cpf, String senha)
        {
           

            ModeloUsuario obj = new ModeloUsuario();
            OracleConnection con = new OracleConnection(connString.ToString());
     

            OracleCommand cmd = new OracleCommand();
           
            cmd.CommandText = "select * from PACIENTES.USUARIO where cpf =:cpf and senha =:senha";

            cmd.BindByName = true;

            cmd.Parameters.Add(new OracleParameter("cpf", cpf));
            cmd.Parameters.Add(new OracleParameter("senha", senha));


            cmd.Connection = con;
            con.Open();

            OracleDataReader registro = cmd.ExecuteReader();

            try
            {

                if (registro.HasRows)
                {

                    registro.Read();
                    obj.ID = Convert.ToInt32(registro["ID"]);
                    obj.cpf = Convert.ToString(registro["cpf"]);
                    obj.nome = Convert.ToString(registro["nome"]);
                    obj.email = Convert.ToString(registro["email"]);
                    obj.senha = Convert.ToString(registro["senha"]);

                }
            }
            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

            finally
            {
                con.Close();
            }


            return obj;
        }

        public ModeloUsuario GetRegistroEmail(String cpf)
        {


            ModeloUsuario obj = new ModeloUsuario();
            OracleConnection con = new OracleConnection(connString.ToString());


            OracleCommand cmd = new OracleCommand();

            cmd.CommandText = "select * from PACIENTES.USUARIO where cpf =:cpf";

            cmd.BindByName = true;

            cmd.Parameters.Add(new OracleParameter("cpf", cpf));
         


            cmd.Connection = con;
            con.Open();

            OracleDataReader registro = cmd.ExecuteReader();

            try
            {

                if (registro.HasRows)
                {

                    registro.Read();
                    obj.ID = Convert.ToInt32(registro["ID"]);
                    obj.cpf = Convert.ToString(registro["cpf"]);
                    obj.nome = Convert.ToString(registro["nome"]);
                    obj.email = Convert.ToString(registro["email"]);
                    obj.senha = Convert.ToString(registro["senha"]);

                }
            }
            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

            finally
            {
                con.Close();
            }


            return obj;
        }

    }
}
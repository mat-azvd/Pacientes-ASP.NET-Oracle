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
    public class DALPaciente
    {

        private System.Configuration.ConnectionStringSettings connString;


        public DALPaciente()
        {

            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BancoPacientesOracle"];

        }

        public void inserir(ModeloPaciente obj)
        {

            OracleConnection con = new OracleConnection(connString.ToString());
            OracleCommand cmd = new OracleCommand();


            try
            {

                cmd.CommandText = "Insert into Pacientes.Pacientes (nome,cpf,sexo,telefone,email,Data_Nascimento,Nome_Mae,Estado_Civil,Rua,Estado,Cidade,Numero,Complemento) values (:nome,:cpf,:sexo,:telefone,:email,:Data_Nascimento,:Nome_Mae,:Estado_Civil,:Rua,:Estado,:Cidade,:Numero,:Complemento)";
                cmd.Parameters.Add("nome", obj.nome);
                cmd.Parameters.Add("cpf", obj.cpf);
                cmd.Parameters.Add("sexo", obj.sexo);
                cmd.Parameters.Add("telefone", obj.telefone);
                cmd.Parameters.Add("email", obj.email);
                cmd.Parameters.Add("Data_Nascimento", obj.Data_Nascimento);
                cmd.Parameters.Add("Nome_Mae", obj.Nome_Mae);
                cmd.Parameters.Add("Estado_Civil", obj.Estado_Civil);
                cmd.Parameters.Add("Rua", obj.Rua);
                cmd.Parameters.Add("Estado", obj.Estado);
                cmd.Parameters.Add("Cidade", obj.Cidade);
                cmd.Parameters.Add("Numero", obj.Numero);
                cmd.Parameters.Add("Complemento", obj.Complemento);


                cmd.Connection = con;
                con.Open();
                obj.ID = Convert.ToInt32(cmd.ExecuteScalar());

            }

            catch (Exception erro)
            {
                throw new Exception(erro.Message);
            }

            finally
            {
                con.Close();
            }

        }

        public DataTable ListarEstados()
        {
            DataTable tabela = new DataTable();

            OracleDataAdapter da = new OracleDataAdapter("Select * from PACIENTES.ESTADOS", connString.ConnectionString);

            try
            {

                //Pegar o retorno do comando e preencher a tabela
                da.Fill(tabela);
                return tabela;
            }

            catch (Exception erro)
            {
                throw new Exception(erro.Message);
            }

        }    

        
        public List<ModeloPaciente> Listar()
        {
            List<ModeloPaciente> ListaPacientes = new List<ModeloPaciente>();
          
            OracleConnection con = new OracleConnection(connString.ToString());

            OracleCommand cmd = new OracleCommand();

            cmd.CommandText = "select * from PACIENTES.PACIENTES";

            cmd.BindByName = true;

            cmd.Connection = con;
            con.Open();

            OracleDataReader registro = cmd.ExecuteReader();

            try
            {

                while (registro.Read())
                {
                    ModeloPaciente obj = new ModeloPaciente();
                    obj.ID = Convert.ToInt32(registro["ID"]);
                    obj.cpf = Convert.ToString(registro["cpf"]);
                    obj.nome = Convert.ToString(registro["nome"]);
                    obj.email = Convert.ToString(registro["email"]);

                    ListaPacientes.Add(obj);
                }
            }
            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

            return ListaPacientes;
        }

        public ModeloPaciente GetRegistro(String cpf)
        {


            ModeloPaciente obj = new ModeloPaciente();
            OracleConnection con = new OracleConnection(connString.ToString());


            OracleCommand cmd = new OracleCommand();

            cmd.CommandText = "select * from PACIENTES.PACIENTES where cpf =:cpf";

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
                    obj.nome = Convert.ToString(registro["nome"]);
                    obj.cpf = Convert.ToString(registro["cpf"]);
                    obj.sexo = Convert.ToString(registro["sexo"]);
                    obj.telefone = Convert.ToString(registro["telefone"]);
                    obj.email = Convert.ToString(registro["email"]);
                    obj.Data_Nascimento = Convert.ToString(registro["Data_Nascimento"]);
                    obj.Nome_Mae = Convert.ToString(registro["Nome_Mae"]);
                    obj.Estado_Civil = Convert.ToString(registro["Estado_Civil"]);
                    obj.Rua = Convert.ToString(registro["Rua"]);
                    obj.Estado = Convert.ToString(registro["Estado"]);
                    obj.Cidade = Convert.ToString(registro["Cidade"]);
                    obj.Numero = Convert.ToString(registro["Numero"]);
                    obj.Complemento = Convert.ToString(registro["Complemento"]);

                }
            }
            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }




            return obj;
        }


        public void DeletePaciente(String cpf)
        {

           
            OracleConnection con = new OracleConnection(connString.ToString());
            OracleCommand cmd = new OracleCommand();
            

            //Executar um comando no banco
            try
            {
                cmd.Connection = con;
                cmd.CommandText = "Delete from PACIENTES.PACIENTES where cpf =:cpf";

                cmd.Parameters.Add(new OracleParameter("cpf", cpf));

                con.Open();
                cmd.ExecuteNonQuery();


            }

            catch (Exception erro)
            {
                throw new Exception(erro.Message);
            }

            finally
            {
                con.Close();
            }

        }


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pacientes.Modelo;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Text.RegularExpressions;


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

        public DataTable ListarDataTable( )
        {
            //DataTable para criar uma tabela
            DataTable tabela = new DataTable();

            //SqlDataAdapter para executar comandos SQL passando o comando e a string de conexao
            OracleDataAdapter da = new OracleDataAdapter("Select * from PACIENTES.PACIENTES", connString.ConnectionString);           

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

        public List<ModeloPaciente> ListarPesquisa(String pesquisa)
        {
            List<ModeloPaciente> ListaPacientes = new List<ModeloPaciente>();

            OracleConnection con = new OracleConnection(connString.ToString());

            OracleCommand cmd = new OracleCommand();

            cmd.CommandText = "select * from PACIENTES.PACIENTES where cpf=:pesquisa or nome=:pesquisa";

            cmd.Parameters.Add(new OracleParameter("pesquisa", pesquisa));
           
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

        public void AlterarPaciente(ModeloPaciente objP)
        {


            OracleConnection con = new OracleConnection(connString.ToString());
            OracleCommand cmd = new OracleCommand();

            

            //Executar um comando no banco
            try
            {
                cmd.Connection = con;
                cmd.CommandText = "UPDATE PACIENTES.PACIENTES SET nome=:nome, cpf=:cpf, sexo=:sexo, telefone=:telefone, email=:email, Data_Nascimento=:Data_Nascimento, Nome_Mae=:Nome_Mae, Estado_Civil=:Estado_Civil, Rua=:Rua, Estado=:Estado, Cidade=:Cidade, Numero=:Numero, Complemento=:Complemento where ID=:ID";

                cmd.BindByName = true;

                cmd.Parameters.Add(new OracleParameter("ID", objP.ID));
                cmd.Parameters.Add(new OracleParameter("nome", objP.nome));
                cmd.Parameters.Add(new OracleParameter("cpf", objP.cpf));
                cmd.Parameters.Add(new OracleParameter("sexo", objP.sexo));
                cmd.Parameters.Add(new OracleParameter("telefone", objP.telefone));
                cmd.Parameters.Add(new OracleParameter("email", objP.email));
                cmd.Parameters.Add(new OracleParameter("Data_Nascimento", objP.Data_Nascimento));
                cmd.Parameters.Add(new OracleParameter("Nome_Mae", objP.Nome_Mae));
                cmd.Parameters.Add(new OracleParameter("Estado_Civil", objP.Estado_Civil));
                cmd.Parameters.Add(new OracleParameter("Rua", objP.Rua));
                cmd.Parameters.Add(new OracleParameter("Estado", objP.Estado));
                cmd.Parameters.Add(new OracleParameter("Cidade", objP.Cidade));
                cmd.Parameters.Add(new OracleParameter("Numero", objP.Numero));
                cmd.Parameters.Add(new OracleParameter("Complemento",objP.Complemento));


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


    /*
     * cmd.Parameters.Add("ID",Convert.ToInt32(objP.ID));
                cmd.Parameters.Add("nome", Convert.ToString(objP.nome));
                cmd.Parameters.Add("cpf", Convert.ToString(objP.cpf));
                cmd.Parameters.Add("sexo", Convert.ToString(objP.sexo));
                cmd.Parameters.Add("telefone", Convert.ToString(objP.telefone));
                cmd.Parameters.Add("email", Convert.ToString(objP.email));
                cmd.Parameters.Add("Data_Nascimento", Convert.ToString(objP.Data_Nascimento));
                cmd.Parameters.Add("Nome_Mae", Convert.ToString(objP.Nome_Mae));
                cmd.Parameters.Add("Estado_Civil", Convert.ToString(objP.Estado_Civil));
                cmd.Parameters.Add("Rua", Convert.ToString(objP.Rua));
                cmd.Parameters.Add("Estado", Convert.ToString(objP.Estado));
                cmd.Parameters.Add("Cidade", Convert.ToString(objP.Cidade));
                cmd.Parameters.Add("Numero", Convert.ToString(objP.Numero));
                cmd.Parameters.Add("Complemento", Convert.ToString(objP.Complemento));

      
    */
    //
}
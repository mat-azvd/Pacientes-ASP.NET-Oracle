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
    public class DALalergia
    {
        private System.Configuration.ConnectionStringSettings connString;


        public DALalergia()
        {

            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["BancoPacientesOracle"];

        }

        public void inserirAlergia(ModeloAlergia obj)
        {

            OracleConnection con = new OracleConnection(connString.ToString());
            OracleCommand cmd = new OracleCommand();


            try
            {

                cmd.CommandText = "Insert into Pacientes.Pacientes (nome_alergia) values (@nome_alergia)";
                cmd.Parameters.Add("nome_alergia", obj.nome_alergia);
                


                cmd.Connection = con;
                con.Open();
                obj.ID = Convert.ToInt32(cmd.ExecuteScalar());

            }

            catch (Exception erro)
            {
                new Exception("Nao Inserido: " + erro.Message);
            }

            finally
            {
                con.Close();
            }

        }

        public DataTable ListarAlergias()
        {
            DataTable tabela = new DataTable();

            OracleDataAdapter da = new OracleDataAdapter("Select * from PACIENTES.ALERGIAS", connString.ConnectionString);

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

        public List<ModeloAlergia> ListaDeAlergias()
        {
            List<ModeloAlergia> ListaAlergia = new List<ModeloAlergia>();

            OracleConnection con = new OracleConnection(connString.ToString());

            OracleCommand cmd = new OracleCommand();

            cmd.CommandText = "select * from PACIENTES.ALERGIAS";

            cmd.BindByName = true;

            cmd.Connection = con;
            con.Open();

            OracleDataReader registro = cmd.ExecuteReader();

            try
            {

                while (registro.Read())
                {
                    ModeloAlergia obj = new ModeloAlergia();
                    obj.ID = Convert.ToInt32(registro["ID"]);
                    obj.nome_alergia = Convert.ToString(registro["nome_alergia"]);

                    ListaAlergia.Add(obj);
                }
            }
            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

            return ListaAlergia;
        }

    }
}
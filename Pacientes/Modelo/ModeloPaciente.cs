using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pacientes.Modelo
{
    public class ModeloPaciente
    {

        public int ID { get; set; }
        public String nome { get; set; }
        public String cpf { get; set; }
        public String sexo { get; set; }
        public String telefone { get; set; }
        public String email { get; set; }    
        public String Data_Nascimento { get; set; }
        public String Nome_Mae { get; set; }
        public int Alergias { get; set; }
        public String Estado_Civil { get; set; }
        public String Endereco { get; set; }
        public String Estado { get; set; }
        public String Cidade { get; set; }
        public String Numero { get; set; }
        public String Complemento { get; set; }


    }
}
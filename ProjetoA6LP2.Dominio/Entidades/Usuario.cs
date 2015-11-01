using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Entidades
{
    [Table("Usuario")]
    public class Usuario
    { 
        [Key]
        public String Login { get; set; }
        public String NomeUsuario { get; set; }
        public String Senha { get; set; }
        public byte[] Imagem { get; set; }
        public String ImagemTipo { get; set; }
    }
}

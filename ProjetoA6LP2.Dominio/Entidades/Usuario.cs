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
    public partial class Usuario
    { 
        [Key]
        public string Login { get; set; }
        public string NomeUsuario { get; set; }
        public string Senha { get; set; }
        public byte[] Imagem { get; set; }
        public string ImagemTipo { get; set; }
    }
}

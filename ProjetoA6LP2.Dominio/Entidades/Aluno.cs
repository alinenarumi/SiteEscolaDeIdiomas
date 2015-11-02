using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Entidades
{
    public partial class Aluno
    {
        public Aluno()
        {
            this.AlunoCompraPacotes = new HashSet<AlunoCompraPacote>();
        }

        public int IdAluno { get; set; }
        public string Nome { get; set; }
        public string Endereco { get; set; }
        public string CPF { get; set; }
        public string RG { get; set; }
        public string Email { get; set; }
        public string FormaPagamento { get; set; }

        public virtual ICollection<AlunoCompraPacote> AlunoCompraPacotes { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Entidades
{
    public partial class AlunoCompraPacote
    {
        public int IdAluno { get; set; }
        public int IdPacote { get; set; }
        public bool PacoteQuitado { get; set; }
        public decimal Mensalidade { get; set; }
        public Nullable<int> QuantidadeTotalDeMensalidades { get; set; }
        public Nullable<int> QuantidadeDeMensalidadeRestantes { get; set; }
        public int IdAlunoComparaPacote { get; set; }

        public virtual Aluno Aluno { get; set; }
        public virtual Pacote Pacote { get; set; }
    }
}

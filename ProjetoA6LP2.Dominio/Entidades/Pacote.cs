using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Entidades
{
    public partial class Pacote
    {
        public Pacote()
        {
            this.AlunoCompraPacotes = new HashSet<AlunoCompraPacote>();
            this.PacoteTemCursoes = new HashSet<PacoteTemCurso>();
        }

        public int IdPacote { get; set; }
        public string NomePacote { get; set; }
        public string Descricao { get; set; }
        public Nullable<decimal> PrecoTotalPacote { get; set; }

        public virtual ICollection<AlunoCompraPacote> AlunoCompraPacotes { get; set; }
        public virtual ICollection<PacoteTemCurso> PacoteTemCursoes { get; set; }
    }
}

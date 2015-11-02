using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Entidades
{
    public partial class Curso
    {
        public Curso()
        {
            this.PacoteTemCursoes = new HashSet<PacoteTemCurso>();
        }

        public int IdCurso { get; set; }
        public string Nome { get; set; }
        public string Idioma { get; set; }
        public int Duracao { get; set; }
        public Nullable<System.DateTime> DataInicio { get; set; }
        public Nullable<System.DateTime> DataTermino { get; set; }
        public Nullable<decimal> PrecoCurso { get; set; }

        public virtual ICollection<PacoteTemCurso> PacoteTemCursoes { get; set; }
    }
}

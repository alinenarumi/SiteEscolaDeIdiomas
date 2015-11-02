using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Entidades
{
    public partial class PacoteTemCurso
    {
        public int IdPacote { get; set; }
        public int IdCurso { get; set; }
        public int IdPacoteTemCurso { get; set; }

        public virtual Curso Curso { get; set; }
    }
}
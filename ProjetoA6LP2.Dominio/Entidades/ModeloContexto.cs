using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Entidades
{
    public partial class ModeloContexto : DbContext
    {
        public ModeloContexto() :
            base("name=conexao_escola_idioma_db")
        { }

        protected override void OnModelCreating(
            DbModelBuilder modelBuilder)
        {
            Database.SetInitializer<ModeloContexto>(
                new CreateDatabaseIfNotExists<ModeloContexto>());
        }

        public DbSet<Aluno> Alunoes { get; set; }
        public DbSet<AlunoCompraPacote> AlunoCompraPacotes { get; set; }
        public DbSet<Curso> Cursoes { get; set; }
        public DbSet<Pacote> Pacotes { get; set; }
        public DbSet<PacoteTemCurso> PacoteTemCursoes { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
    }
}
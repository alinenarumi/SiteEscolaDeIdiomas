using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using ProjetoA6LP2.Dominio.Entidades;

namespace ProjetoA6LP2.Dominio.Repositorio
{
    public class UsuarioRepositorio : IRepositorio<Usuario>
    {
        private ModeloContexto contexto;

        public UsuarioRepositorio(ModeloContexto contexto)
        {
            this.contexto = contexto;
        }

        public void Alterar(Usuario model)
        {
            throw new NotImplementedException();
        }

        public void Excluir(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Usuario> GetTodos()
        {
            return this.contexto.Usuarios.ToList();
        }

        public void Incluir(Usuario model)
        {
            this.contexto.Usuarios.Add(model);
            this.contexto.SaveChanges();
        }
    }
}

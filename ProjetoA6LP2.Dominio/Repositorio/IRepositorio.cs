using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoA6LP2.Dominio.Repositorio
{
    public interface IRepositorio<T> where T : class
    {
        IEnumerable<T> GetTodos();
        void Incluir(T model);
        void Alterar(T model);
        void Excluir(int id);
    }
}

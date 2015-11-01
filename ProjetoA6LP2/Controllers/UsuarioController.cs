using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

// Namespaces necessários
using ProjetoA6LP2.Dominio.Repositorio;
using ProjetoA6LP2.Dominio.Entidades;
//
using PagedList;

namespace ProjetoA6LP2.Controllers
{
    public class UsuarioController : Controller
    {
        private IRepositorio<Usuario> usuarioRepositorio;

        public UsuarioController()
        {
            this.usuarioRepositorio = new UsuarioRepositorio(
                new ModeloContexto()
                );
        }

        public ActionResult Index(int? pagina)
        {
            int tamanhoPagina = 1;
            int numeroPagina = pagina ?? 1;

            return View(
                this.usuarioRepositorio.GetTodos().ToPagedList(
                    numeroPagina,
                    tamanhoPagina
                    ));
        }

        public ActionResult Incluir()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Incluir(Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                this.usuarioRepositorio.Incluir(usuario);
                return RedirectToAction("Index");
            }
            return View(usuario);
        }
    }
}
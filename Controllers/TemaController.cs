using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Data.SqlClient;
using System.Data;
using MVCLaboratorio.Utilerias;
using MVCLaboratorio.Models;

namespace MVCLaboratorio.Controllers
{
    public class TemaController : Controller
    {
        RepositorioTema repoTema = new RepositorioTema();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListaTemas()
        {
            return View(repoTema.obtenerTemas());
        }

        //CREAR
        public ActionResult TemaCreate()
        {
            return View();
        }
        [HttpPost]
        public ActionResult TemaCreate(Tema datos)
        {
            repoTema.insertarTema(datos);
            return RedirectToAction("ListaTemas");
        }

        //BORRAR
        public ActionResult TemaDelete(int id)
        {
            return View(repoTema.obtenerTema(id));
        }
        [HttpPost]
        public ActionResult TemaDelete(int id, FormCollection datos)
        {
            repoTema.eliminarTema(id);
            return RedirectToAction("ListaTemas");
        }

        //DETALLES
        public ActionResult TemaDetalles(int id)
        {
            return View(repoTema.obtenerTema(id));
        }

        //EDITAR
        public ActionResult TemaEditar(int id)
        {
            return View(repoTema.obtenerTema(id));
        }
        [HttpPost]
        public ActionResult TemaEditar(int id, Tema datosTema)
        {
            datosTema.IdTema = id;
            repoTema.actualizarTema(datosTema);
            return RedirectToAction("ListaTemas");
        }
    }
}

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
    public class Curso_Tema_VideoController : Controller
    {
        RepositorioCurso_Tema_Video repoCTV = new RepositorioCurso_Tema_Video();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListaCTVS()
        {
            return View(repoCTV.obtenerCTVS());
        }
        //CREAR
        public ActionResult CTVCreate()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CTVCreate(Curso_Tema_Video datos)
        {
            repoCTV.insertarCTV(datos);
            return RedirectToAction("ListaCTVS");
        }
        //BORRAR
        public ActionResult CTVDelete(int id)
        {
            return View(repoCTV.obtenerCTV(id));
        }
        [HttpPost]
        public ActionResult CTVDelete(int id, FormCollection datos)
        {
            repoCTV.eliminarCTV(id);
            return RedirectToAction("ListaCTVS");
        }
        //DETALLES
        public ActionResult CTVDetails(int id)
        {
            return View(repoCTV.obtenerCTV(id));
        }
        //EDITAR
        public ActionResult CTVEdit(int id)
        {
            return View(repoCTV.obtenerCTV(id));
        }
        [HttpPost]
        public ActionResult CTVEdit(int id, Curso_Tema_Video datosCTV)
        {
            datosCTV.IdCTV = id;
            repoCTV.actualizarCTV(datosCTV);
            return RedirectToAction("ListaCTVS");
        }
    }
}

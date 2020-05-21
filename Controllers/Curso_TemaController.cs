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
    public class Curso_TemaController : Controller
    {
        RepositorioCurso_Tema repoCT = new RepositorioCurso_Tema();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListaCTS()
        {
            return View(repoCT.obtenerCTS());
        }
        //CREAR
        public ActionResult CTCreate()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CTCreate(Curso_Tema datos)
        {
            repoCT.insertarCT(datos);
            return RedirectToAction("ListaCTS");
        }
        //BORRAR
        public ActionResult CTDelete(int id)
        {
            return View(repoCT.obtenerCT(id));
        }
        [HttpPost]
        public ActionResult CTDelete(int id, FormCollection datos)
        {
            repoCT.eliminarCT(id);
            return RedirectToAction("ListaCTS");
        }
        //DETALLES
        public ActionResult CTDetails(int id)
        {
            return View(repoCT.obtenerCT(id));
        }
        //EDITAR
        public ActionResult CTEdit(int id)
        {
            return View(repoCT.obtenerCT(id));
        }
        [HttpPost]
        public ActionResult CTEdit(int id, Curso_Tema datosCT)
        {
            datosCT.IdCT = id;
            repoCT.actualizarCT(datosCT);
            return RedirectToAction("ListaCTS");
        }

    }
}

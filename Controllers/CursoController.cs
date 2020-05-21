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
    public class CursoController : Controller
    {
        RepositorioCurso repoCurso = new RepositorioCurso();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListaCursos()
        {
            return View(repoCurso.obtenerCursos());
        }
        //CREAR
        public ActionResult CursoCreate()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CursoCreate(Curso datos)
        {
            repoCurso.insertarCurso(datos);
            return RedirectToAction("ListaCursos");
        }
        //BORRAR
        public ActionResult CursoDelete(int id)
        {
            return View(repoCurso.obtenerCurso(id));
        }
        [HttpPost]
        public ActionResult CursoDelete(int id, FormCollection datos)
        {
            repoCurso.eliminarCurso(id);
            return RedirectToAction("ListaCursos");
        }
        //DETALLES
        public ActionResult CursoDetails(int id)
        {
            return View(repoCurso.obtenerCurso(id));
        }
        //EDITAR
        public ActionResult CursoEdit(int id)
        {
            return View(repoCurso.obtenerCurso(id));
        }
        [HttpPost]
        public ActionResult CursoEdit(int id, Curso datosCurso)
        {
            datosCurso.IdCurso = id;
            repoCurso.actualizarCurso(datosCurso);
            return RedirectToAction("ListaCursos");
        }
    }
}

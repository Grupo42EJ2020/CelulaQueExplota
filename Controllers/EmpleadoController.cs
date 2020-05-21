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
    public class EmpleadoController : Controller
    {
        RepositorioEmpleado repoEmpleado = new RepositorioEmpleado();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListaCursos()
        {
            return View(repoEmpleado.obtenerEmpleados());
        }
        //CREAR
        public ActionResult EmpleadoCreate()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EmpleadoCreate(Empleado datos)
        {
            repoEmpleado.insertarEmpleado(datos);
            return RedirectToAction("ListaEmpleados");
        }
        //BORRAR
        public ActionResult EmpleadoDelete(int id)
        {
            return View(repoEmpleado.obtenerEmpleado(id));
        }
        [HttpPost]
        public ActionResult EmpleadoDelete(int id, FormCollection datos)
        {
            repoEmpleado.eliminarEmpleado(id);
            return RedirectToAction("ListaEmpleados");
        }
        //DETALLES
        public ActionResult EmpleadoDetails(int id)
        {
            return View(repoEmpleado.obtenerEmpleado(id));
        }
        //EDITAR
        public ActionResult EmpleadoEdit(int id)
        {
            return View(repoEmpleado.obtenerEmpleado(id));
        }
        [HttpPost]
        public ActionResult EmpleadoEdit(int id, Empleado datosEmpleado)
        {
            datosEmpleado.IdEmpleado = id;
            repoEmpleado.actualizarEmpleado(datosEmpleado);
            return RedirectToAction("ListaEmpleados");
        }
    }
}

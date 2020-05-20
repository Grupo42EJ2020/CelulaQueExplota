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
    public class VideoController : Controller
    {
        RepositorioVideo repoVideo = new RepositorioVideo();

        public ActionResult Index()
        {
            return View();
        }
        //MOSTRAR TODOS LOS VIDEOS
        public ActionResult ListaVideos()
        {
            return View(repoVideo.obtenerVideos() );
        }

        //CREAR
        public ActionResult VideoCreate()
        {
            return View();
        }
        [HttpPost]
        public ActionResult VideoCreate(Video datos)
        {
            repoVideo.insertarVideo(datos);
            return RedirectToAction("ListaVideos");
        }

        //BORRAR
        public ActionResult VideoDelete(int id)
        {
            return View(repoVideo.obtenerVideo(id));
        }
        [HttpPost]
        public ActionResult VideoDelete(int id, FormCollection datos)
        {
            repoVideo.eliminarVideo(id);
            return RedirectToAction("ListaVideos");
        }

    }
}

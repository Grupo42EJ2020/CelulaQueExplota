using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCLaboratorio.Models
{
    public interface ICurso_Tema_Video
    {
        List<Curso_Tema_Video> obtenerCTVS();
        Curso_Tema_Video obtenerCTV(int idCTV);
        void insertarCTV(Curso_Tema_Video datosCTV);
        void eliminarCTV(int idCTV);
        void actualizarCTV(Curso_Tema_Video datosCTV);
    }
}

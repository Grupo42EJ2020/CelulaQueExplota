using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCLaboratorio.Models
{
    public interface ICurso_Tema
    {
        List<Curso_Tema> obtenerCTS();
        Curso_Tema obtenerCT(int IdCT);
        void insertarCT(Curso_Tema datosCT);
        void eliminarCT(int IdCT);
        void actualizarCT(Curso_Tema datosCT);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCLaboratorio.Models
{
    public interface ITema
    {
        List<Tema> obtenerTemas();
        Tema obtenerTema(int IdTema);
        void insertarTema(Tema datosTema);
        void eliminarTema(int IdTema);
        void actualizarTema(Tema datosTema);
    }
}

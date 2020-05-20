using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MVCLaboratorio.Models
{
    public interface ITema
    {
        List<Tema> obtenerTemas();
        Video obtenerTema(int IdTema);
        void insertarTema(Tema datosTema);
        void eliminarTema(int IdTema);
        void actualizarTema(Tema datosTema);
    }
}

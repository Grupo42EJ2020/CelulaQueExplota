using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using MVCLaboratorio.Utilerias;
using System.Data.SqlClient;

namespace MVCLaboratorio.Models
{
    public class RepositorioCurso_Tema : ICurso_Tema
    {
        public List<Curso_Tema> obtenerCTS()
        {
            DataTable dtCTS;
            dtCTS = BaseHelper.ejecutarConsulta("sp_CT_ConsultarTodo", CommandType.StoredProcedure);
            List<Curso_Tema> lstCTS = new List<Curso_Tema>();
            foreach (DataRow item in dtCTS.Rows)
            {
                Curso_Tema CTAux = new Curso_Tema();
                CTAux.IdCT = int.Parse(item["IdCT"].ToString());
                CTAux.IdCurso = int.Parse(item["IdCurso"].ToString());
                CTAux.IdTema = int.Parse(item["IdTema"].ToString());
                lstCTS.Add(CTAux);
            }
            return lstCTS;
        }

        public Curso_Tema obtenerCT(int IdCT)
        {
            DataTable dtCT;
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCT", IdCT));
            dtCT = BaseHelper.ejecutarConsulta("sp_CT_ConsultarPorID", CommandType.StoredProcedure, parametros);
            Curso_Tema datosCT = new Curso_Tema();
            if (dtCT.Rows.Count > 0) //si lo encontro
            {
                datosCT.IdCT = int.Parse(dtCT.Rows[0]["IdCT"].ToString());
                datosCT.IdCurso = int.Parse(dtCT.Rows[0]["IdCurso"].ToString());
                datosCT.IdTema = int.Parse(dtCT.Rows[0]["IdTema"].ToString());
                return datosCT;
            }
            else
            {
                return null;
            }
        }

        public void insertarCT(Curso_Tema datosCT)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCurso", datosCT.IdCurso));
            parametros.Add(new SqlParameter("@IdTema", datosCT.IdTema));
            BaseHelper.ejecutarConsulta("sp_CT_Insertar", CommandType.StoredProcedure, parametros);
        }

        public void eliminarCT(int IdCT)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCT", IdCT));
            BaseHelper.ejecutarSentencia("sp_CT_Eliminar", CommandType.StoredProcedure, parametros);
        }

        public void actualizarCT(Curso_Tema datosCT)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCT", datosCT.IdCT));
            parametros.Add(new SqlParameter("@IdCurso", datosCT.IdCurso));
            parametros.Add(new SqlParameter("@IdTema", datosCT.IdTema));
            BaseHelper.ejecutarConsulta("sp_CT_Actualizar", CommandType.StoredProcedure, parametros);
        }
    }
}
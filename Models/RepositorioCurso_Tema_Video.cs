using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using MVCLaboratorio.Utilerias;
using System.Data.SqlClient;

namespace MVCLaboratorio.Models
{
    public class RepositorioCurso_Tema_Video :ICurso_Tema_Video
    {
        public List<Curso_Tema_Video> obtenerCTVS()
        {
            DataTable dtCTVS;
            dtCTVS = BaseHelper.ejecutarConsulta("sp_CTV_ConsultarTodo", CommandType.StoredProcedure);
            List<Curso_Tema_Video> lstCTVS = new List<Curso_Tema_Video>();
            foreach (DataRow item in dtCTVS.Rows)
            {
                Curso_Tema_Video CTVAux = new Curso_Tema_Video();
                CTVAux.IdCTV = int.Parse(item["IdCTV"].ToString());
                CTVAux.IdCT = int.Parse(item["IdCT"].ToString());
                CTVAux.IdVideo = int.Parse(item["IdVideo"].ToString());
                lstCTVS.Add(CTVAux);
            }
            return lstCTVS;
        }

        public Curso_Tema_Video obtenerCTV(int idCTV)
        {
            DataTable dtCTV;
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCTV", idCTV));
            dtCTV = BaseHelper.ejecutarConsulta("sp_CTV_ConsultarPorID", CommandType.StoredProcedure, parametros);
            Curso_Tema_Video datosCTV = new Curso_Tema_Video();
            if (dtCTV.Rows.Count > 0) //si lo encontro
            {
                datosCTV.IdCTV = int.Parse(dtCTV.Rows[0]["IdCTV"].ToString());
                datosCTV.IdCT = int.Parse(dtCTV.Rows[0]["IdCT"].ToString());
                datosCTV.IdVideo = int.Parse(dtCTV.Rows[0]["IdVideo"].ToString());
                return datosCTV;
            }
            else
            {
                return null;
            }
        }

        public void insertarCTV(Curso_Tema_Video datosCTV)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCT", datosCTV.IdCT));
            parametros.Add(new SqlParameter("@IdVideo", datosCTV.IdVideo));
            BaseHelper.ejecutarConsulta("sp_CTV_Insertar", CommandType.StoredProcedure, parametros);
        }

        public void eliminarCTV(int idCTV)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCTV", idCTV));
            BaseHelper.ejecutarSentencia("sp_CTV_Eliminar", CommandType.StoredProcedure, parametros);
        }

        public void actualizarCTV(Curso_Tema_Video datosCTV)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdCTV", datosCTV.IdCTV));
            parametros.Add(new SqlParameter("@IdCT", datosCTV.IdCT));
            parametros.Add(new SqlParameter("@IdVideo", datosCTV.IdVideo));
            BaseHelper.ejecutarConsulta("sp_CTV_Actualizar", CommandType.StoredProcedure, parametros);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using MVCLaboratorio.Utilerias;
using System.Data.SqlClient;

namespace MVCLaboratorio.Models
{
    public class RepositorioEmpleado : IEmpleado
    {
        public List<Empleado> obtenerEmpleados()
        {
            DataTable dtEmpleados;
            dtEmpleados = BaseHelper.ejecutarConsulta("sp_Empleado_ConsultarTodo", CommandType.StoredProcedure);
            List<Empleado> lstEmpleados = new List<Empleado>();
            foreach (DataRow item in dtEmpleados.Rows)
            {
                Empleado EmpleadoAux = new Empleado();
                EmpleadoAux.IdEmpleado = int.Parse(item["IdEmpleado"].ToString());
                EmpleadoAux.Nombre = item["Nombre"].ToString();
                EmpleadoAux.Direccion = item["Direccion"].ToString();
                lstEmpleados.Add(EmpleadoAux);
            }
            return lstEmpleados;
        }

        public Empleado obtenerEmpleado(int IdEmpleado)
        {
            DataTable dtEmpleado;
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdEmpleado", IdEmpleado));
            dtEmpleado = BaseHelper.ejecutarConsulta("sp_Empleado_ConsultarPorID", CommandType.StoredProcedure, parametros);
            Empleado datosEmpleado = new Empleado();
            if (dtEmpleado.Rows.Count > 0) //si lo encontro
            {
                datosEmpleado.IdEmpleado = int.Parse(dtEmpleado.Rows[0]["IdEmpleado"].ToString());
                datosEmpleado.Nombre = dtEmpleado.Rows[0]["Nombre"].ToString();
                datosEmpleado.Direccion = dtEmpleado.Rows[0]["Direccion"].ToString();
                return datosEmpleado;
            }
            else
            {
                return null;
            }
        }

        public void insertarEmpleado(Empleado datosEmpleado)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@Nombre", datosEmpleado.Nombre));
            parametros.Add(new SqlParameter("@Direccion", datosEmpleado.Direccion));
            BaseHelper.ejecutarConsulta("sp_Empleado_Insertar", CommandType.StoredProcedure, parametros);
        }

        public void eliminarEmpleado(int IdEmpleado)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdEmpleado", IdEmpleado));
            BaseHelper.ejecutarSentencia("sp_Empleado_Eliminar", CommandType.StoredProcedure, parametros);
        }

        public void actualizarEmpleado(Empleado datosEmpleado)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IdEmpleado", datosEmpleado.IdEmpleado));
            parametros.Add(new SqlParameter("@Nombre", datosEmpleado.Nombre));
            parametros.Add(new SqlParameter("@Direccion", datosEmpleado.Direccion));
            BaseHelper.ejecutarConsulta("sp_Empleado_Actualizar", CommandType.StoredProcedure, parametros);
        }
    }
}
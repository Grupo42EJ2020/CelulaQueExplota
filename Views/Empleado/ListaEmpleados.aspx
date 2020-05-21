<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCLaboratorio.Models.Empleado>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Lista de Empleados</title>
    <link  rel="icon"   href="../../Content/imagenes/handle.png" type="image/png" />
    <style type="text/css">
    html, body
    {
    width: 100%;
    height: 110%; 
    background: #FFFFFF;
    font-family: Helvetica; 
    }
    </style>
</head>
<body>
    <center>
    <h1>Lista de Empleados
    </h1></center>
    <table>
        <tr>
            <th></th>
            <th>
                Empleados
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "EmpleadoEdit", new { id=item.IdEmpleado }) %> |
                <%: Html.ActionLink("Detalles", "EmpleadoDetails", new { id = item.IdEmpleado })%> |
                <%: Html.ActionLink("Borrar", "EmpleadoDelete", new { id = item.IdEmpleado })%>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <b><%: Html.ActionLink("(+) Agregar Empleado", "EmpleadoCreate") %></b>
    </p>
    <br />
    <br />
    <br />
    <a href="/Home/Index">Home</a>
</body>
</html>


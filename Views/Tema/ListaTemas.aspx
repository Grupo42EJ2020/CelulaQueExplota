﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCLaboratorio.Models.Tema>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Lista de Temas</title>
    <link  rel="icon"   href="../../Content/imagenes/handle.png" type="image/png" />
</head>
<body>
    <table>
        <tr>
            <th></th>
            <th>
                Nombre
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "TemaEditar", new { /* id=item.PrimaryKey */ })%> |
                <%: Html.ActionLink("Detalles", "TemaDetalles", new { /* id=item.PrimaryKey */ })%> |
                <%: Html.ActionLink("Borrar", "TemaBorrar", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear Tema", "TemaCreate")%>
    </p>

</body>
</html>


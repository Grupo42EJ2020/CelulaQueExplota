<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCLaboratorio.Models.Tema>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Lista de Temas</title>
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
    <h1>Lista de temas disponibles</h1></center>
    <table>
        <tr>
            <th></th>
            <th>
                Tema
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "TemaEditar", new { id = item.IdTema })%> |
                <%: Html.ActionLink("Detalles", "TemaDetalles", new { id = item.IdTema })%> |
                <%: Html.ActionLink("Borrar", "TemaDelete", new { id = item.IdTema })%>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <b><%: Html.ActionLink("(+) Agregar Tema", "TemaCreate")%></b> 
    </p>

</body>
</html>


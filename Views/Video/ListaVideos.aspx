<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCLaboratorio.Models.Video>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Lista de Videos</title>
    <link  rel="icon"   href="../../Content/imagenes/handle.png" type="image/png" />
</head>
<body>
    <table>
        <tr>
            <th></th>
            <th>
                Nombre
            </th>
            <th>
                Url
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "VideoEditar", new { id = item.IdVideo })%> |
                <%: Html.ActionLink("Detalles", "VideoDetalles", new { id = item.IdVideo })%> |
                <%: Html.ActionLink("Borrar", "VideoDelete", new { id = item.IdVideo })%>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <%: item.Url %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Agregar video", "VideoCreate") %>
    </p>

</body>
</html>


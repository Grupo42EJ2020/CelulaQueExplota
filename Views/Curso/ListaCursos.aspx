<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCLaboratorio.Models.Curso>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Lista de Cursos</title>
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
        <h1>Lista de Cursos</h1>
    </center>
    <table>
        <tr>
            <th></th>
            <th>
                Curso
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "CursoEdit", new { id = item.IdCurso })%> |
                <%: Html.ActionLink("Detalles", "CursoDetails", new { id = item.IdCurso })%> |
                <%: Html.ActionLink("Borrar", "CursoDelete", new { id=item.IdCurso })%>
            </td>
            <td>
                <%: item.Descripcion %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("(+) Agregar Curso", "CursoCreate") %>
    </p>

</body>
</html>


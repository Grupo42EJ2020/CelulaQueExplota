<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCLaboratorio.Models.Curso_Tema>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Lista de Cursos con Temas</title>
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
    <h1>
    Lista de Cursos con Temas</h1></center>
    <table>
        <tr>
            <th></th>
            <th>
                IdCurso
            </th>
            <th>
                IdTema
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "CTEdit", new { id = item.IdCT })%> |
                <%: Html.ActionLink("Detalles", "CTDetails", new { id = item.IdCT })%> |
                <%: Html.ActionLink("Borrar", "CTDelete", new { id=item.IdCT })%>
            </td>
            <td>
                <%: item.IdCurso %>
            </td>
            <td>
                <%: item.IdTema %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("(+) Asignar Curso a Tema", "CTCreate")%>
    </p>

</body>
</html>


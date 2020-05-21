<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MVCLaboratorio.Models.Video>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Editar video</title>
    <link  rel="icon"   href="../../Content/imagenes/handle.png" type="image/png" />
    <style type="text/css">
    html, body
    {
    width: 100%;
    height: 110%; 
    background: #FFFFFF;
    font-family: Helvetica; 
    }
    a:link, a:visited{
    text-decoration: none;
    padding: 5px;
    font-family: Helvetica;
    text-transform: uppercase;
    padding-left: 10px;
    padding-right: 10px;
    font-weight: 200;
    font-size: 17px;
    color: black;
    width:150px;
    height:25px;
    text-align:center;
    display: inline-block;
    margin: 10px 10px 0 10px;
    background-color: #d3dde0;
    }
    a:hover{
    color: #4c5557;
    background-color: #dff2f7;
    text-decoration: none;
    }
    </style>
</head>
<body>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Datos de video</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Url) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Url) %>
                <%: Html.ValidationMessageFor(model => model.Url) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.FechaPublicacion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.FechaPublicacion, String.Format("{0:g}", Model.FechaPublicacion)) %>
                <%: Html.ValidationMessageFor(model => model.FechaPublicacion) %>
            </div>
            
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Regresar", "ListaVideos")%>
    </div>

</body>
</html>


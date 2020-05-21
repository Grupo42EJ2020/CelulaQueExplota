<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link  rel="icon"   href="../../Content/imagenes/handle.png" type="image/png" />
<link href="https://fonts.googleapis.com/css2?family=Oxygen:wght@700&display=swap" rel="stylesheet">
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
    padding: 20px;
    font-family: Helvetica;
    text-transform: uppercase;
    padding-left: 10px;
    padding-right: 10px;
    font-weight: 200;
    font-size: 20px;
    color: black;
    width:200px;
    height:25px;
    text-align:center;
    display: inline-block;
    margin: 20px 20px 0 20px;
    background-color: #d3dde0;
    }
    a:hover{
    color: #4c5557;
    background-color: #dff2f7;
    text-decoration: none;
    }
    </style>
    <title>Aprende Ya!</title>
</head>
<body>
    <img src="../../Content/imagenes/handle.png" width="100" height="100" align="left" /> 
    <FONT face="Oxygen" size="50" dir="ltr"> &nbsp;Aprende Ya! </FONT>
    <br />
    <br />
    <br />
    <br />
    <center>
        <a href="/Video/ListaVideos">Videos</a>
        <br />
        <a href="/Tema/ListaTemas">Temas</a>
        <br />
        <a href="/Empleado/ListaEmpleados">Empleados</a>
        <br />
        <a href="/Curso/ListaCursos">Cursos</a>
        <br />
        <a href="/Curso_Tema/ListaCTS">Cursos con Temas</a>
    </center>
</body>
</html>

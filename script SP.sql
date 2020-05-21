/*DATOS DE EMPLEADOS*/
insert into Empleado values ('Jose Martinez','Agustin Melgar 2328, Reforma, Monterrey, NL');
insert into Empleado values ('Juan Sanchez','Pico De La Malinche 600, Jardin De Las Puentes, Monterrey, NL');
insert into Empleado values ('Marisol Gamez','Morenita Mia 331, San Bartolo, Monterrey, NL');
insert into Empleado values ('Gabriela Villegas','Santo Domingo 917, Las Puentes 4to Sector, Monterrey, NL');
insert into Empleado values ('Antonio Vazquez','Av. Bernardo Reyes 3403, Hidalgo, Monterrey, NL');

/*DATOS DE VIDEOS*/
insert into Video(Nombre,url,FechaPublicacion)
values('Build a Brain Computer App with React Native (Part 7) - Live Coding with Jesse','https://www.youtube.com/embed/W6BzxdHBBHM',CONVERT(datetime, '19/04/2020 19:36:40', 103) )
insert into Video(Nombre,url,FechaPublicacion)
values('Data Analysis with Python - Full Course for Beginners (Numpy, Pandas, Matplotlib, Seaborn)','https://www.youtube.com/embed/r-uOLxNrNk8',CONVERT(datetime, '19/04/2020 19:36:40', 103) )

/*DATOS DE CURSO*/
insert into Curso values ('ASP.NET',1);
insert into Curso values ('MySQL',2);
insert into Curso values ('Microsoft SQL Server Managment Studio',5);

/*DATOS DE TEMAS*/
insert into Tema values ('Introduccion a ASP.NET');

/*DATOS DE CT*/
insert into Curso_Tema values (1,14);
insert into Curso_Tema values (1,15);
insert into Curso_Tema values (1,17);
insert into Curso_Tema values (1,19);

/*DATOS DE CTV*/
insert into Curso_Tema_Video values (1,1002)
insert into Curso_Tema_Video values (7,2)

/*STORED PROCEDURES*/
/*VIDEO*/
GO  
CREATE PROCEDURE sp_Video_Insertar
	@Nombre nvarchar(200),
	@Url nvarchar(100),
	@FechaPublicacion datetime
AS
BEGIN
	INSERT INTO Video(Nombre,Url,FechaPublicacion)
	VALUES(@Nombre,@Url,@FechaPublicacion)
END;
GO
CREATE PROCEDURE sp_Video_ConsultarTodo
AS
BEGIN
	SELECT * FROM VIDEO
END;
go

CREATE PROCEDURE sp_Video_ConsultarPorID
@IdVideo int
AS
BEGIN
	SELECT * FROM VIDEO
	WHERE IdVideo = @idVideo
END;
go
GO
CREATE PROCEDURE sp_Video_Eliminar
	@IdVideo int
AS
BEGIN
	DELETE FROM VIDEO
	WHERE IdVideo = @idVideo
END;
go
GO
CREATE PROCEDURE sp_Video_Actualizar
	@IdVideo int,
	@Nombre nvarchar(200),
	@Url nvarchar(100),
	@FechaPublicacion datetime
AS
BEGIN
	UPDATE Video SET Nombre=@Nombre,Url=@Url,FechaPublicacion=@FechaPublicacion
	WHERE IdVideo = @IdVideo
END;

/*TEMAS*/
GO
CREATE PROCEDURE sp_Tema_ConsultarTodo
AS
BEGIN
	SELECT * FROM Tema;
END;
GO  
CREATE PROCEDURE sp_Tema_Insertar
	@Nombre nvarchar(200)
AS
BEGIN
	INSERT INTO Tema(Nombre)
	VALUES(@Nombre)
END;
GO
CREATE PROCEDURE sp_Tema_Eliminar
	@IdTema int
AS
BEGIN
	DELETE FROM Tema WHERE IdTema = @IdTema
END;
GO
CREATE PROCEDURE sp_Tema_ConsultarPorID
@IdTema int
AS
BEGIN
	SELECT * FROM Tema
	WHERE IdTema = @IdTema
END;
GO
CREATE PROCEDURE sp_Tema_Actualizar
	@IdTema int,
	@Nombre nvarchar(100)
AS
BEGIN
	UPDATE Tema SET Nombre=@Nombre
	WHERE IdTema = @IdTema
END;
/*EMPLEADOS*/
GO
CREATE PROCEDURE sp_Empleado_ConsultarTodo
AS
BEGIN
	SELECT * FROM Empleado;
END;
GO
CREATE PROCEDURE sp_Empleado_ConsultarPorID
@IdEmpleado int
AS
BEGIN
	SELECT * FROM Empleado
	WHERE IdEmpleado = @IdEmpleado
END;
GO  
CREATE PROCEDURE sp_Empleado_Insertar
	@Nombre nvarchar(100),
	@Direccion nvarchar(100)
AS
BEGIN
	INSERT INTO Empleado(Nombre, Direccion)
	VALUES(@Nombre, @Direccion)
END;
GO
CREATE PROCEDURE sp_Empleado_Eliminar
	@IdEmpleado int
AS
BEGIN
	DELETE FROM Empleado WHERE IdEmpleado = @IdEmpleado
END;
GO
CREATE PROCEDURE sp_Empleado_Actualizar
	@IdEmpleado int,
	@Nombre nvarchar(100),
	@Direccion nvarchar(100)
AS
BEGIN
	UPDATE Empleado SET Nombre=@Nombre, Direccion=@Direccion
	WHERE IdEmpleado = @IdEmpleado
END;
/*CURSO*/
GO
CREATE PROCEDURE sp_Curso_ConsultarTodo
AS
BEGIN
	SELECT * FROM Curso;
END;
GO
CREATE PROCEDURE sp_Curso_ConsultarPorID
@IdCurso int
AS
BEGIN
	SELECT * FROM Curso
	WHERE IdCurso = @IdCurso
END;
GO  
CREATE PROCEDURE sp_Curso_Insertar
	@Descripcion nvarchar(200),
	@IdEmpleado int
AS
BEGIN
	INSERT INTO Curso(Descripcion, IdEmpleado)
	VALUES(@Descripcion, @IdEmpleado)
END;
GO
CREATE PROCEDURE sp_Curso_Eliminar
	@IdCurso int
AS
BEGIN
	DELETE FROM Curso WHERE IdCurso = @IdCurso
END;
GO
CREATE PROCEDURE sp_Curso_Actualizar
	@Descripcion nvarchar(200),
	@IdEmpleado int,
	@IdCurso int
AS
BEGIN
	UPDATE Curso SET Descripcion=@Descripcion, IdEmpleado=@IdEmpleado
	WHERE IdCurso = @IdCurso
END;
/*CURSO_TEMA*/
GO
CREATE PROCEDURE sp_CT_ConsultarTodo
AS
BEGIN
	SELECT * FROM Curso_Tema;
END;
GO
CREATE PROCEDURE sp_CT_ConsultarPorID
@IdCT int
AS
BEGIN
	SELECT * FROM Curso_Tema
	WHERE IdCT = @IdCT;
END;
GO  
CREATE PROCEDURE sp_CT_Insertar
	@IdCurso int,
	@IdTema int
AS
BEGIN
	INSERT INTO Curso_Tema(IdCurso, IdTema)
	VALUES(@IdCurso, @IdTema)
END;
GO
CREATE PROCEDURE sp_CT_Eliminar
	@IdCT int
AS
BEGIN
	DELETE FROM Curso_Tema WHERE IdCT = @IdCT
END;
GO
CREATE PROCEDURE sp_CT_Actualizar
	@IdCurso nvarchar(200),
	@IdTema int,
	@IdCT int
AS
BEGIN
	UPDATE Curso_Tema SET IdCurso=@IdCurso, IdTema=@IdTema
	WHERE IdCT = @IdCT
END;
/*CURSO_TEMA_VIDEO*/
GO
CREATE PROCEDURE sp_CTV_ConsultarTodo
AS
BEGIN
	SELECT * FROM Curso_Tema_Video;
END;
GO
CREATE PROCEDURE sp_CTV_ConsultarPorID
@IdCTV int
AS
BEGIN
	SELECT * FROM Curso_Tema_Video
	WHERE IdCTV = @IdCTV;
END;
GO  
CREATE PROCEDURE sp_CTV_Insertar
	@IdCT int,
	@IdVideo int
AS
BEGIN
	INSERT INTO Curso_Tema_Video (IdCT, IdVideo)
	VALUES(@IdCT, @IdVideo)
END;
GO
CREATE PROCEDURE sp_CTV_Eliminar
	@IdCTV int
AS
BEGIN
	DELETE FROM Curso_Tema_Video WHERE IdCTV = @IdCTV
END;
GO
CREATE PROCEDURE sp_CTV_Actualizar
	@IdCT int,
	@IdVideo int,
	@IdCTV int
AS
BEGIN
	UPDATE Curso_Tema_Video SET IdCT=@IdCT, IdVideo=@IdVideo
	WHERE IdCTV = @IdCTV
END;
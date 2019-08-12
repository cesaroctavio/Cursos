-- Seccion almacenaremos lo siguiente (Finanzas, Desarrollo web, FrontEnd, BackEnd, etc.) solo es para tener una idea.
--TABLA Seccion
IF OBJECT_ID('Seccion') IS NOT NULL
DROP TABLE Seccion
GO

CREATE TABLE Seccion
(
    IdSeccion tinyint NOT NULL PRIMARY KEY, -- primary key column
    NombreSeccion nvarchar (30) NOT NULL
);
GO

-- esto es pensando a futuro almacenaremos el pais de los integrantes que crearan contenido
--TABLA Pais
IF OBJECT_ID('Pais') IS NOT NULL
DROP TABLE Pais
GO

CREATE TABLE Pais
(
    IdPais tinyint NOT NULL PRIMARY KEY, -- primary key column
    NombrePais nvarchar (30) NOT NULL
);
GO

-- seran los integrantes que crearan contenido 
--TABLA Autor
IF OBJECT_ID('Autor') IS NOT NULL
DROP TABLE Autor
GO

CREATE TABLE Autor
(
    IdAutor tinyint NOT NULL PRIMARY KEY, -- primary key column
    NombreAutor nvarchar (30) NOT NULL,
    IdPais tinyint not NULL
    constraint fk_Autor_Pais FOREIGN KEY (IdPais) REFERENCES Pais (IdPais) on delete set null
);
GO
-- que nivel de conosimiento se requiere para entrar al curso
--TABLA Nivel
IF OBJECT_ID('Nivel') IS NOT NULL
DROP TABLE Nivel
GO

CREATE TABLE Nivel
(
    IdNivel tinyint NOT NULL PRIMARY KEY, -- primary key column
    NombreNivel nvarchar (30) NOT NULL
);
GO
-- almacenaremos todo esto de los cursos 
--TABLA Curso
IF OBJECT_ID('Curso') IS NOT NULL
DROP TABLE Curso
GO

CREATE TABLE Curso
(
    IdCurso tinyint NOT NULL PRIMARY KEY, -- primary key column
    NombreCurso nvarchar (50) NOT NULL,
    IdAutor tinyint NOT NULL,
    IdSeccion tinyint NOT NULL,
    Descripcion NVARCHAR (Max),
    IdNivel TINYINT NOT NULL,
    FechaSubida date NOT NULL,
    Precio tinyint,
    Descuento tinyint,
    constraint fk_Curso_Autor FOREIGN KEY (IdAutor) REFERENCES Autor (IdAutor),
    constraint fk_Cursos_Seccion FOREIGN KEY (IdSeccion) REFERENCES Seccion (IdSeccion),
    constraint fk_Cursos_Pais FOREIGN KEY (IdNivel) REFERENCES Nivel (IdNivel)
);
GO
-- que necesita saber para entrar al curso
--TABLA Conosimientos
IF OBJECT_ID('Conocimientos') IS NOT NULL
DROP TABLE Conocimientos
GO

CREATE TABLE Conocimientos
(
    IdConocimientos tinyint NOT NULL PRIMARY KEY, -- primary key column
    IdCurso tinyint NOT NULL,
    NombreConocimientos nvarchar (30) NOT NULL,
    constraint fk_Conocimientos_Cursos FOREIGN KEY (IdCurso) REFERENCES Curso (IdCurso)
);
GO
-- que es lo que va a aprender al terminar el curso 
--TABLA Aprendizaje
IF OBJECT_ID('Aprendizaje') IS NOT NULL
DROP TABLE Aprendizaje
GO

CREATE TABLE Aprendizaje
(
    IdAprendizaje tinyint NOT NULL PRIMARY KEY, -- primary key column
    IdCurso tinyint NOT NULL,
    NombreAprendizaje nvarchar (30) NOT NULL
    constraint fk_Aprendizaje_Cursos FOREIGN KEY (IdCurso) REFERENCES Curso (IdCurso)
);
GO
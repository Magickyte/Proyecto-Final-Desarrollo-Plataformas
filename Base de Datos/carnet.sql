-- ========================================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS: SISTEMA CARNET CULTURAL
-- RDBMS: Oracle Database
-- ========================================================

DROP TABLE RegistroAsistencia CASCADE CONSTRAINTS;
DROP TABLE Eventos CASCADE CONSTRAINTS;
DROP TABLE Estudiante CASCADE CONSTRAINTS;
DROP TABLE Empleado CASCADE CONSTRAINTS;
DROP TABLE Categoria CASCADE CONSTRAINTS;
DROP TABLE Facultad CASCADE CONSTRAINTS;
DROP TABLE Usuario CASCADE CONSTRAINTS;

-- ========================================================
-- TABLA: USUARIO
-- ========================================================

CREATE TABLE Usuario (
    id_usuario NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    apellido VARCHAR2(100) NOT NULL,
    correo VARCHAR2(150) NOT NULL UNIQUE,
    contrasena VARCHAR2(255) NOT NULL,
    CONSTRAINT chk_contrasena
    CHECK (
        LENGTH(contrasena) >= 8
    ),
    CONSTRAINT chk_id_usuario
    CHECK (
        id_usuario BETWEEN 100000 AND 999999
    )
);

-- ========================================================
-- TABLA: FACULTAD
-- ========================================================

CREATE TABLE Facultad (
    id_facultad VARCHAR2(10) PRIMARY KEY,
    nombre_facultad VARCHAR2(150) NOT NULL
);

-- ========================================================
-- TABLA: CATEGORIA
-- ========================================================
CREATE TABLE Categoria (
    id_categoria VARCHAR2(10) PRIMARY KEY,
    nombre_categoria VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255)
);

-- ========================================================
-- TABLA: ESTUDIANTE
-- ========================================================
CREATE TABLE Estudiante (
    matricula NUMBER PRIMARY KEY,
    id_facultad VARCHAR2(10) NOT NULL,
    carrera VARCHAR2(150) NOT NULL,
    semestre NUMBER NOT NULL,

    CONSTRAINT fk_estudiante_usuario
    FOREIGN KEY (matricula)
    REFERENCES Usuario(id_usuario)
    ON DELETE CASCADE,

    CONSTRAINT fk_estudiante_facultad
    FOREIGN KEY (id_facultad)
    REFERENCES Facultad(id_facultad),

    CONSTRAINT chk_semestre
    CHECK (
        semestre BETWEEN 1 AND 12
    )
);
-- ========================================================
-- TABLA: EMPLEADO
-- ========================================================
CREATE TABLE Empleado (

    id_empleado NUMBER PRIMARY KEY,

    puesto VARCHAR2(100) NOT NULL,

    CONSTRAINT fk_empleado_usuario
    FOREIGN KEY (id_empleado)
    REFERENCES Usuario(id_usuario)
    ON DELETE CASCADE
);

-- ========================================================
-- TABLA: EVENTOS
-- ========================================================
CREATE TABLE Eventos (
    id_evento NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_categoria VARCHAR2(10) NOT NULL,
    id_empleado NUMBER NOT NULL,
    nombre_evento VARCHAR2(200) NOT NULL,
    descripcion VARCHAR2(1000),
    fecha_inicio DATE NOT NULL,
    fecha_fin TIMESTAMP,
    ubicacion VARCHAR2(255) NOT NULL,
    puntos NUMBER DEFAULT 0 NOT NULL,

    CONSTRAINT fk_evento_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES Categoria(id_categoria),

    CONSTRAINT fk_evento_empleado
    FOREIGN KEY (id_empleado)
    REFERENCES Empleado(id_empleado),

    CONSTRAINT chk_puntos
    CHECK (
        puntos BETWEEN 1 AND 3
    )

);

-- ========================================================
-- TABLA: REGISTRO ASISTENCIA
-- ========================================================
CREATE TABLE RegistroAsistencia (
    id_evento NUMBER NOT NULL,
    matricula NUMBER NOT NULL,
    fecha_registro TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    asistencia_confirmada NUMBER(1)
    DEFAULT 0 NOT NULL,
    evidencia VARCHAR2(500) NOT NULL,
    descripcion VARCHAR2(1000),
    PRIMARY KEY (id_evento, matricula),

    CONSTRAINT fk_registro_evento
    FOREIGN KEY (id_evento)
    REFERENCES Eventos(id_evento)
    ON DELETE CASCADE,

    CONSTRAINT fk_registro_estudiante
    FOREIGN KEY (matricula)
    REFERENCES Estudiante(matricula)
    ON DELETE CASCADE,

    CONSTRAINT chk_confirmada
    CHECK (
        asistencia_confirmada IN (0,1)
    )
);



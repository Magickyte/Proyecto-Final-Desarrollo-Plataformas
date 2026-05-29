
DELETE FROM RegistroAsistencia;
DELETE FROM Eventos;
DELETE FROM Estudiante;
DELETE FROM Empleado;
DELETE FROM Categoria;
DELETE FROM Facultad;
DELETE FROM Usuario;

-- ========================================================
-- FACULTADES
-- ========================================================

INSERT INTO Facultad VALUES (
    'FING',
    'Facultad de Ingeniería'
);

INSERT INTO Facultad VALUES (
    'FMED',
    'Facultad de Medicina'
);

INSERT INTO Facultad VALUES (
    'FDER',
    'Facultad de Derecho'
);

INSERT INTO Facultad VALUES (
    'FCONT',
    'Facultad de Contaduría'
);

-- ========================================================
-- CATEGORÍAS
-- ========================================================

INSERT INTO Categoria VALUES (
    'CULT',
    'Artístico',
    'Eventos artísticos'
);

INSERT INTO Categoria VALUES (
    'DEP',
    'Deportivo',
    'Eventos deportivos y recreativos'
);

INSERT INTO Categoria VALUES (
    'CIEN',
    'Científico-Filosofico',
    'Conferencias y actividades académicas'
);

INSERT INTO Categoria VALUES (
    'COM',
    'Comunitario',
    'Actividades de apoyo social'
);

INSERT INTO Categoria VALUES (
    'HERR',
    'Herramientas para mi futuro',
    'Conferencias sobre marca personal'
);

INSERT INTO Categoria VALUES (
    'SAL',
    'Salud',
    'Conferencias y actividades sobre salud física y mental'
);

-- ========================================================
-- USUARIOS
-- ========================================================

INSERT INTO Usuario (
    id_usuario,
    nombre,
    apellido,
    correo,
    contrasena
) VALUES (100001, 'Juan', 'Pérez', 'juan.perez@uach.mx', '12345678');
INSERT INTO Usuario (
    id_usuario,
    nombre,
    apellido,
    correo,
    contrasena
) VALUES (100002, 'María', 'López', 'maria.lopez@uach.mx', '12345678');
INSERT INTO Usuario (
    id_usuario,
    nombre,
    apellido,
    correo,
    contrasena
) VALUES (200001, 'Carlos', 'Ramírez', 'carlos.ramirez@uach.mx', '12345678');
INSERT INTO Usuario (
    id_usuario,
    nombre,
    apellido,
    correo,
    contrasena
) VALUES (200002, 'Ana', 'Torres', 'ana.torres@uach.mx', '12345678');
INSERT INTO Usuario (
    id_usuario,
    nombre,
    apellido,
    correo,
    contrasena
) VALUES (200003, 'Luis', 'Gómez', 'luis.gomez@uach.mx', '12345678');
INSERT INTO Usuario (
    id_usuario,
    nombre,
    apellido,
    correo,
    contrasena
) VALUES (200004, 'Fernanda', 'Castillo', 'fernanda.castillo@uach.mx', '12345678');

-- ========================================================
-- EMPLEADOS
-- ========================================================

INSERT INTO Empleado (
    id_empleado,
    puesto
)
VALUES (
    100001,
    'Coordinador Cultural'
);

INSERT INTO Empleado (
    id_empleado,
    puesto
)
VALUES (
    100002,
    'Administrador de Eventos'
);

-- ========================================================
-- ESTUDIANTES
-- ========================================================

INSERT INTO Estudiante (
    matricula,
    id_facultad,
    carrera,
    semestre
)
VALUES (
    200001,
    'FING',
    'Ingeniería en Sistemas',
    6
);

INSERT INTO Estudiante (
    matricula,
    id_facultad,
    carrera,
    semestre
)
VALUES (
    200002,
    'FMED',
    'Medicina General',
    4
);

INSERT INTO Estudiante (
    matricula,
    id_facultad,
    carrera,
    semestre
)
VALUES (
    200003,
    'FDER',
    'Derecho',
    8
);

INSERT INTO Estudiante (
    matricula,
    id_facultad,
    carrera,
    semestre
)
VALUES (
    200004,
    'FING',
    'Ingeniería Civil',
    2
);

-- ========================================================
-- EVENTOS
-- ========================================================

INSERT INTO Eventos (
    id_categoria,
    id_empleado,
    nombre_evento,
    descripcion,
    fecha_inicio,
    fecha_fin,
    ubicacion,
    puntos
)
VALUES (
    'CULT',
    100001,
    'Festival de Música Universitaria',
    'Evento cultural con presentaciones musicales',
    TO_DATE('2026-06-15', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2026-06-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'Auditorio Universitario',
    1
);

INSERT INTO Eventos (
    id_categoria,
    id_empleado,
    nombre_evento,
    descripcion,
    fecha_inicio,
    fecha_fin,
    ubicacion,
    puntos
)
VALUES (
    'DEP',
    100002,
    'Torneo Interfacultades',
    'Competencia deportiva entre facultades',
    TO_DATE('2026-06-20', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2026-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'Gimnasio Universitario',
    2
);

INSERT INTO Eventos (
    id_categoria,
    id_empleado,
    nombre_evento,
    descripcion,
    fecha_inicio,
    fecha_fin,
    ubicacion,
    puntos
)
VALUES (
    'CIEN',
    100001,
    'Conferencia de Inteligencia Artificial',
    'Ponencia sobre tendencias actuales en IA',
    TO_DATE('2026-07-01', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2026-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'Sala de Conferencias',
    3
);

INSERT INTO Eventos (
    id_categoria,
    id_empleado,
    nombre_evento,
    descripcion,
    fecha_inicio,
    fecha_fin,
    ubicacion,
    puntos
)
VALUES (
    'COM',
    100002,
    'Campaña de Reforestación',
    'Actividad comunitaria ecológica',
    TO_DATE('2026-07-10', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2026-07-10 16:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'Parque Metropolitano',
    1
);

-- ========================================================
-- REGISTRO DE ASISTENCIAS
-- ========================================================

INSERT INTO RegistroAsistencia (
    id_evento,
    matricula,
    asistencia_confirmada,
    evidencia,
    descripcion
)
VALUES (
    1,
    200001,
    1,
    'evidencia_juan_festival.jpg',
    'Asistencia verificada en la entrada'
);

INSERT INTO RegistroAsistencia (
    id_evento,
    matricula,
    asistencia_confirmada,
    evidencia,
    descripcion
)
VALUES (
    1,
    200002,
    1,
    'evidencia_maria_festival.png',
    'Llegó tarde pero asistió'
);

INSERT INTO RegistroAsistencia (
    id_evento,
    matricula,
    asistencia_confirmada,
    evidencia,
    descripcion
)
VALUES (
    2,
    200003,
    0,
    'evidencia_carlos_torneo.jpg',
    'Pendiente de verificación'
);

INSERT INTO RegistroAsistencia (
    id_evento,
    matricula,
    asistencia_confirmada,
    evidencia,
    descripcion
)
VALUES (
    3,
    200004,
    1,
    'evidencia_ana_ia.pdf',
    'Excelente participación'
);

INSERT INTO RegistroAsistencia (
    id_evento,
    matricula,
    asistencia_confirmada,
    evidencia,
    descripcion
)
VALUES (
    4,
    200001,
    0,
    'evidencia_juan_reforestacion.png',
    'Falta evidencia fotográfica'
);

COMMIT;
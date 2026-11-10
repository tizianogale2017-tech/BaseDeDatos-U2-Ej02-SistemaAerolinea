-- Base de Datos I - Unidad 4 - Ej02: SistemaAerolinea
-- Script portable (SQLite / MySQL). En SQLite activar antes: PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS RESERVA;
DROP TABLE IF EXISTS TRIPULACION;
DROP TABLE IF EXISTS PASAJERO;
DROP TABLE IF EXISTS PERSONAL;
DROP TABLE IF EXISTS VUELO;
DROP TABLE IF EXISTS AVION;

CREATE TABLE AVION (
    id_avion INT PRIMARY KEY,
    matricula VARCHAR(50) UNIQUE,
    modelo VARCHAR(50),
    capacidad_pasajeros INT,
    autonomia_vuelo INT
);

CREATE TABLE VUELO (
    id_vuelo INT PRIMARY KEY,
    id_avion INT,
    codigo_vuelo VARCHAR(50) UNIQUE,
    origen VARCHAR(50),
    destino VARCHAR(50),
    hora_salida TIME,
    hora_llegada TIME,
    FOREIGN KEY (id_avion) REFERENCES AVION(id_avion)
);

CREATE TABLE PERSONAL (
    id_personal INT PRIMARY KEY,
    numero_empleado VARCHAR(50),
    dni INT UNIQUE,
    nombre VARCHAR(50),
    categoria_profesional VARCHAR(50),
    fecha_ingreso DATE
);

CREATE TABLE PASAJERO (
    id_pasajero INT PRIMARY KEY,
    dni INT UNIQUE,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    genero VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE TRIPULACION (
    id_tripulacion INT PRIMARY KEY,
    id_personal INT,
    id_vuelo INT,
    rol VARCHAR(50),
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal),
    FOREIGN KEY (id_vuelo) REFERENCES VUELO(id_vuelo),
    UNIQUE (id_personal, id_vuelo)
);

CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY,
    id_pasajero INT,
    id_vuelo INT,
    numero_asiento VARCHAR(50),
    fecha_reserva DATE,
    FOREIGN KEY (id_pasajero) REFERENCES PASAJERO(id_pasajero),
    FOREIGN KEY (id_vuelo) REFERENCES VUELO(id_vuelo),
    UNIQUE (id_pasajero, id_vuelo)
);

-- Datos de AVION
INSERT INTO AVION (id_avion, matricula, modelo, capacidad_pasajeros, autonomia_vuelo) VALUES (1, 'LV-ABC', 'ATR 72', 70, 1500);
INSERT INTO AVION (id_avion, matricula, modelo, capacidad_pasajeros, autonomia_vuelo) VALUES (2, 'LV-BCD', 'Embraer E190', 100, 4500);
INSERT INTO AVION (id_avion, matricula, modelo, capacidad_pasajeros, autonomia_vuelo) VALUES (3, 'LV-DEF', 'Embraer E190', 100, 4500);
INSERT INTO AVION (id_avion, matricula, modelo, capacidad_pasajeros, autonomia_vuelo) VALUES (4, 'LV-EFG', 'ATR 72', 70, 1500);

-- Datos de VUELO
INSERT INTO VUELO (id_vuelo, id_avion, codigo_vuelo, origen, destino) VALUES (1, 1, 'AR1001', 'Mendoza', 'Buenos Aires');
INSERT INTO VUELO (id_vuelo, id_avion, codigo_vuelo, origen, destino) VALUES (2, 2, 'AR1002', 'Buenos Aires', 'Córdoba');
INSERT INTO VUELO (id_vuelo, id_avion, codigo_vuelo, origen, destino) VALUES (3, 2, 'AR1004', 'Mendoza', 'Salta');
INSERT INTO VUELO (id_vuelo, id_avion, codigo_vuelo, origen, destino) VALUES (4, 3, 'AR1005', 'Salta', 'Buenos Aires');

-- Datos de PERSONAL
INSERT INTO PERSONAL (id_personal, numero_empleado, dni, nombre, categoria_profesional) VALUES (1, 'EMP-001', 28111222, 'Marcos Ibáñez', 'Piloto');
INSERT INTO PERSONAL (id_personal, numero_empleado, dni, nombre, categoria_profesional) VALUES (2, 'EMP-002', 30222333, 'Lorena Vidal', 'Piloto');
INSERT INTO PERSONAL (id_personal, numero_empleado, dni, nombre, categoria_profesional) VALUES (3, 'EMP-003', 31333444, 'Pablo Rey', 'Auxiliar');
INSERT INTO PERSONAL (id_personal, numero_empleado, dni, nombre, categoria_profesional) VALUES (4, 'EMP-004', 27444555, 'Sandra Cruz', 'Auxiliar');

-- Datos de PASAJERO
INSERT INTO PASAJERO (id_pasajero, dni, nombre, apellido, genero) VALUES (1, 40111222, 'Valeria', 'Gómez', 'F');
INSERT INTO PASAJERO (id_pasajero, dni, nombre, apellido, genero) VALUES (2, 41222333, 'Esteban', 'Ríos', 'M');
INSERT INTO PASAJERO (id_pasajero, dni, nombre, apellido, genero) VALUES (3, 42333444, 'Mariana', 'Lugo', 'F');
INSERT INTO PASAJERO (id_pasajero, dni, nombre, apellido, genero) VALUES (4, 44555666, 'Carolina', 'Paz', 'F');

-- Datos de TRIPULACION
INSERT INTO TRIPULACION (id_tripulacion, id_personal, id_vuelo, rol) VALUES (1, 1, 1, 'Comandante');
INSERT INTO TRIPULACION (id_tripulacion, id_personal, id_vuelo, rol) VALUES (2, 2, 1, 'Copiloto');
INSERT INTO TRIPULACION (id_tripulacion, id_personal, id_vuelo, rol) VALUES (3, 3, 1, 'Auxiliar Jefe');
INSERT INTO TRIPULACION (id_tripulacion, id_personal, id_vuelo, rol) VALUES (4, 4, 2, 'Auxiliar Jefe');

-- Datos de RESERVA
INSERT INTO RESERVA (id_reserva, id_pasajero, id_vuelo, numero_asiento, fecha_reserva) VALUES (1, 1, 1, '12A', '2026-10-01');
INSERT INTO RESERVA (id_reserva, id_pasajero, id_vuelo, numero_asiento, fecha_reserva) VALUES (2, 2, 1, '12B', '2026-10-03');
INSERT INTO RESERVA (id_reserva, id_pasajero, id_vuelo, numero_asiento, fecha_reserva) VALUES (3, 3, 2, '3C', '2026-10-05');
INSERT INTO RESERVA (id_reserva, id_pasajero, id_vuelo, numero_asiento, fecha_reserva) VALUES (4, 4, 3, '9F', '2026-10-10');

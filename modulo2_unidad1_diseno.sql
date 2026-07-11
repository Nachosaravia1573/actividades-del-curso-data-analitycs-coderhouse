CREATE DATABASE  Practica_M3_2
USE Practica_M3_2

CREATE TABLE Clientes (
id_cliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
perfil_bio TEXT,
fecha_registro DATE NOT NULL
);

SELECT * FROM Clientes;

CREATE TABLE productos (
id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
descripcion varchar(255),
precio  DEC(10, 2),
esta_activo  INT
);

SELECT * FROM productos;




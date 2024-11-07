-- Eliminamos las tablas si existen para evitar errores en la creación
DROP DATABASE IF EXISTS ventas_camisetas;
CREATE DATABASE ventas_camisetas;
USE ventas_camisetas;

-- Tabla Producto
CREATE TABLE producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    equipo VARCHAR(50) NOT NULL,
    talle VARCHAR(5) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla Cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL
);

-- Tabla Venta
CREATE TABLE venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha DATE NOT NULL
);

-- Tabla Detalle_Venta
CREATE TABLE detalle_venta (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL
);

-- Agregamos las claves foraneas usando ALTER TABLE
ALTER TABLE venta 
ADD CONSTRAINT fk_cliente_venta
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE detalle_venta 
ADD CONSTRAINT fk_venta_detalle
FOREIGN KEY (id_venta) REFERENCES venta(id_venta);

ALTER TABLE detalle_venta 
ADD CONSTRAINT fk_producto_detalle
FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

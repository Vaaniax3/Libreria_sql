-- CREACIÓN DE BASE DE DATOS Y TABLAS
CREATE DATABASE libreria_db;
USE libreria_db;

-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo_cliente VARCHAR(100) NOT NULL UNIQUE,
    telefono_cliente VARCHAR(15) NOT NULL,
    direccion_cliente VARCHAR(255) NOT NULL,
    CONSTRAINT chk_telefono_cliente CHECK (telefono_cliente REGEXP '^[0-9]{10}$')
);

-- Tabla Libros
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo_libro VARCHAR(255) NOT NULL,
    autor_libro VARCHAR(100) NOT NULL,
    precio_libro DECIMAL(10,2) NOT NULL,
    cantidad_disponible INT NOT NULL,
    categoria_libro VARCHAR(50) NOT NULL,
    CONSTRAINT chk_cantidad_disponible CHECK (cantidad_disponible >= 0)
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    total_pedido DECIMAL(10,2) NOT NULL,
    estado_pedido VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla Detalles_Pedido
CREATE TABLE Detalles_Pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_libro INT NOT NULL,
    cantidad_libro INT NOT NULL,
    precio_libro DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

-- Tabla Pagos
CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto_pago DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

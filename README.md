📚 Proyecto: Base de Datos para Librería en Línea
Contexto

La librería “Librería en Línea” ha experimentado un rápido crecimiento y requiere una base de datos para administrar de manera eficiente:

El inventario de libros.

Los datos de clientes.

Los pedidos realizados.

Los pagos asociados.

La base de datos debe ser capaz de registrar las operaciones de compra, controlar la disponibilidad de los libros y garantizar la integridad y eficiencia en todas las transacciones.

🎯 Objetivo de la actividad

El objetivo principal es crear y gestionar una base de datos relacional utilizando DDL (Data Definition Language) para organizar la información de la librería.

El equipo debe:

Diseñar las tablas con sus respectivos campos.

Definir llaves primarias y foráneas.

Implementar restricciones de integridad.

Realizar modificaciones y eliminaciones en la estructura de la base de datos según las necesidades planteadas.

🛠️ Instrucciones y desarrollo
1. Creación de la base de datos

Nombre: libreria_db.

2. Definición de tablas

Clientes

id_cliente (INT, PK, autoincremental)

nombre_cliente (VARCHAR(100), NOT NULL)

correo_cliente (VARCHAR(100), UNIQUE, NOT NULL)

telefono_cliente (VARCHAR(15), NOT NULL)

direccion_cliente (VARCHAR(255), NOT NULL)

Libros

id_libro (INT, PK, autoincremental)

titulo_libro (VARCHAR(255), NOT NULL)

autor_libro (VARCHAR(100), NOT NULL)

precio_libro (DECIMAL(10,2), NOT NULL)

cantidad_disponible (INT, NOT NULL, >= 0)

categoria_libro (VARCHAR(50), NOT NULL)

Pedidos

id_pedido (INT, PK, autoincremental)

id_cliente (INT, FK → Clientes)

fecha_pedido (DATE, NOT NULL)

total_pedido (DECIMAL(10,2), NOT NULL)

estado_pedido (VARCHAR(50), NOT NULL)

Detalles_Pedido

id_detalle (INT, PK, autoincremental)

id_pedido (INT, FK → Pedidos)

id_libro (INT, FK → Libros)

cantidad_libro (INT, NOT NULL)

precio_libro (DECIMAL(10,2), NOT NULL)

Pagos

id_pago (INT, PK, autoincremental)

id_pedido (INT, FK → Pedidos)

fecha_pago (DATE, NOT NULL)

monto_pago (DECIMAL(10,2), NOT NULL)

metodo_pago (VARCHAR(50), NOT NULL)

📌 Restricciones aplicadas

telefono_cliente → solo números de 10 dígitos.

correo_cliente → único y no nulo.

cantidad_disponible → no puede ser negativo.

id_pedido, id_cliente e id_libro → obligatorios.

Cada pedido pertenece a un único cliente.

Cada detalle de pedido hace referencia a un único libro.

🔧 Modificaciones solicitadas

Cambiar telefono_cliente a VARCHAR(20) (para números internacionales).

Modificar precio_libro a DECIMAL(10,3) (admite 3 decimales).

Agregar fecha_confirmacion en la tabla Pagos.

Eliminar la tabla Detalles_Pedido tras confirmarse la entrega.

Eliminar la tabla Pagos.

Truncar la tabla Pedidos sin afectar integridad referencial.

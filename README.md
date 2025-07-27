# NegocioDB - Base de Datos para Gestión Comercial

Este proyecto presenta el diseño y la implementación de una base de datos transaccional en SQL Server, creada para gestionar las operaciones de un negocio minorista (ej. carnicería/fiambrería).

El objetivo principal es demostrar la capacidad de traducir requerimientos de negocio en una estructura de datos funcional, segura y eficiente, implementando desde el esquema inicial hasta lógica de negocio avanzada para automatizar procesos y garantizar la integridad de la información.

## Características Principales
Este repositorio no solo contiene el código, sino que demuestra la aplicación de conceptos clave en la gestión de bases de datos:

* Diseño de Esquema (DDL): Creación de un esquema relacional normalizado con tablas, claves primarias/foráneas, identidades y constraints (CHECK) para asegurar la calidad de los datos.

* Manipulación de Datos (DML): Scripts para la carga de datos maestros y transaccionales, utilizando TRANSACTIONS para garantizar que las operaciones se realicen de forma atómica.

* Consultas de Negocio: Un conjunto de 8 consultas que responden a preguntas de negocio reales, como cálculo de ingresos por método de pago, ranking de productos más vendidos y análisis de stock.

* Lógica de Negocio Avanzada:

  * Vistas: Para simplificar el acceso a datos complejos y ofrecer una capa de abstracción segura.

  * Funciones (UDF): Para encapsular lógica reutilizable, como el formateo de precios para tickets.

  * Triggers: Para automatizar procesos críticos como la creación de un historial de auditoría ante cambios de precios en los productos.

  * Stored Procedures (SP): Para encapsular operaciones complejas como el registro de una venta completa, validando el stock en tiempo real y actualizando todas las tablas involucradas dentro de una única transacción segura.

## Tecnologías Utilizadas
* SQL Server: Como sistema gestor de base de datos.

* Transact-SQL (T-SQL): Como lenguaje para la definición, manipulación y programación de la base de datos.

## Estructura del Repositorio
El proyecto está organizado en carpetas numeradas que indican el orden de ejecución y la función de cada conjunto de scripts.
```
/
├── 01_Schema/          # Scripts para crear y poblar la base de datos
│   ├── 01_crear_tablas.sql
│   ├── 02_crear_relaciones.sql
│   └── 03_cargar_datos.sql
|
├── 02_Consultas/       # Scripts con consultas para análisis de negocio
│   ├── 01.sql
│   ├── ... (y los demás)
|
└── 03_Logica/          # Scripts que añaden lógica programable a la BD
    ├── 01_Vistas.sql
    ├── 02_Funcion_(precio_formato).sql
    ├── 03_Trigger_AuditoriaPrecio.sql
    └── 04_StoredProdedure.sql
```
## Instalación y Uso
Para poner en funcionamiento esta base de datos en tu propio entorno de SQL Server, sigue estos pasos:

1. Asegúrate de tener una instancia de SQL Server instalada y accesible.

2. Ejecuta los scripts de la carpeta 01_Schema en el siguiente orden numérico para crear la estructura de la base de datos y cargar los datos de muestra:

  * 01_crear_tablas.sql

  * 02_crear_relaciones.sql

  * 03_cargar_datos.sql

3. Una vez creada la base de datos, puedes ejecutar cualquiera de los scripts de la carpeta 02_Consultas para probar las consultas de análisis.

4. Finalmente, ejecuta los scripts de la carpeta 03_Logica para añadir las vistas, funciones, triggers y procedimientos almacenados a la base de datos.

Autor: 
Juan Cruz Godoy

LinkedIn: www.linkedin.com/in/juancrgodoy

GitHub: [@juancruzgodoy](https://github.com/juancruzgodoy)


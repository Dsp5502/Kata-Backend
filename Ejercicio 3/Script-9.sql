-- Crear la tabla de proveedores
CREATE TABLE proveedores (
    codigo_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    ciudad VARCHAR(100),
    provincia VARCHAR(100)
);

-- Crear la tabla de categorías de piezas
CREATE TABLE categorias_piezas (
    codigo_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);

-- Crear la tabla de piezas
CREATE TABLE piezas (
    codigo_pieza SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    color VARCHAR(100),
    precio DECIMAL(10, 2),
    codigo_categoria INT,
    FOREIGN KEY (codigo_categoria) REFERENCES categorias_piezas(codigo_categoria)
);

-- Crear la tabla de proveedores y piezas
CREATE TABLE proveedores_piezas (
    codigo_proveedor INT,
    codigo_pieza INT,
    fecha DATE,
    cantidad INT,
    PRIMARY KEY (codigo_proveedor, codigo_pieza, fecha),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedores(codigo_proveedor),
    FOREIGN KEY (codigo_pieza) REFERENCES piezas(codigo_pieza)
);

-- Crear la tabla de concesionarios de automóviles
CREATE TABLE concesionarios (
    id_concesionario SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    ciudad VARCHAR(100),
    provincia VARCHAR(100)
);

-- Crear la tabla de marcas de automóviles
CREATE TABLE marcas (
    id_marca SERIAL PRIMARY KEY,
    nombre_marca VARCHAR(100)
);

-- Crear la tabla de modelos de automóviles
CREATE TABLE modelos (
    id_modelo SERIAL PRIMARY KEY,
    nombre_modelo VARCHAR(100),
    id_marca INT,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

-- Crear la tabla de características del equipamiento de serie
CREATE TABLE caracteristicas (
    id_caracteristica SERIAL PRIMARY KEY,
    nombre_caracteristica VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- Crear la tabla de extras
CREATE TABLE extras (
    id_extra SERIAL PRIMARY KEY,
    nombre_extra VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- Crear la tabla de automóviles en stock
CREATE TABLE autos_stock (
    numero_bastidor SERIAL PRIMARY KEY,
    id_modelo INT,
    FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo)
);

-- Crear la tabla de servicios oficiales
CREATE TABLE servicios_oficiales (
    INE VARCHAR(100),
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    id_concesionario INT,
    FOREIGN KEY (id_concesionario) REFERENCES concesionarios(id_concesionario)
);

-- Crear la tabla de ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    precio_final DECIMAL(10, 2),
    modo_pago VARCHAR(100),
    fecha_venta DATE,
    matricula VARCHAR(100),
    stock_o_fabrica VARCHAR(100),
    INE_vendedor VARCHAR(100),
    numero_bastidor INT,
    FOREIGN KEY (numero_bastidor) REFERENCES autos_stock(numero_bastidor)
);

-- Crear la tabla de vendedores
CREATE TABLE vendedores (
    INE VARCHAR(100) PRIMARY KEY,
    nombre VARCHAR(100),
    domicilio VARCHAR(100)
);

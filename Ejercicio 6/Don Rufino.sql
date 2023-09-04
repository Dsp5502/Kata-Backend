-- Crear la tabla de productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE
);

-- Crear la tabla de clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion_calle VARCHAR(100),
    codigo_postal VARCHAR(10),
    colonia VARCHAR(100)
);

-- Crear la tabla de ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Crear la tabla de detalles de ventas
CREATE TABLE detalles_venta (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT REFERENCES ventas(id_venta),
    id_producto INT REFERENCES productos(id_producto),
    cantidad INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);




-- Insertar algunos productos
INSERT INTO productos (nombre, descripcion, precio, sku)
VALUES
    ('Arroz', 'Arroz de grano largo', 12.99, 'AR001'),
    ('Aceite de cocina', 'Aceite vegetal comestible', 8.50, 'AO002'),
    ('Lentejas', 'Lentejas secas', 10.25, 'LE003');

-- Insertar algunos clientes
INSERT INTO clientes (nombre, apellidos, email, telefono, direccion_calle, codigo_postal, colonia)
VALUES
    ('Juan', 'Pérez', 'juan2@example.com', '555-123-4567', 'Calle 1, Colonia A', '12345', 'Monterrey'),
    ('Maria', 'González', 'mari2a@example.com', '555-987-6543', 'Calle 2, Colonia B', '67890', 'Monterrey'),
    ('Pedro', 'Sánchez', 'pedro2@example.com', '555-321-6789', 'Calle 3, Colonia C', '54321', 'Monterrey');

-- Insertar algunas ventas con detalles
-- Venta 1: Juan compró 2 unidades de Arroz y 1 unidad de Lentejas
INSERT INTO ventas (id_cliente, fecha_venta)
VALUES (1, '2023-09-01');

INSERT INTO detalles_venta (id_venta, id_producto, cantidad)
VALUES
    (1, 1, 2),
    (1, 3, 1);

-- Venta 2: Maria compró 3 unidades de Aceite de cocina
INSERT INTO ventas (id_cliente, fecha_venta)
VALUES (2, '2023-09-02');

INSERT INTO detalles_venta (id_venta, id_producto, cantidad)
VALUES (2, 2, 3);


--ID de los clientes de la Ciudad de Monterrey
select
	id_cliente
from
	clientes
where
	colonia = 'Monterrey';

--ID y descripción de los productos que cuesten menos de 15 pesos
select
	id_producto,
	nombre
from
	productos
where
	precio < 15.00;

--ID y nombre de los clientes, cantidad vendida, y descripción del producto, en las ventas en las cuales se vendieron más de 10 unidades.
select
	c.id_cliente,
	c.nombre,
	p.nombre,
	dv.cantidad
from
	clientes c
join ventas v on
	c.id_cliente = v.id_cliente
join detalles_venta dv on
	v.id_venta = dv.id_venta
join productos p on
	dv.id_producto = p.id_producto
where
	dv.cantidad > 10;

--ID y nombre de los clientes que no aparecen en la tabla de ventas (Clientes que no han comprado productos)
select
	c.id_cliente,
	c.nombre
from
	clientes c
left join ventas v on
	c.id_cliente = v.id_cliente
where
	v.id_venta is null;

--ID y nombre de los clientes que han comprado todos los productos de la empresa.
select
	c.id_cliente,
	c.nombre
from
	clientes c
where
	not exists (
	select
		p.id_producto
	from
		productos p
	where
		not exists (
		select
			dv.id_detalle
		from
			detalles_venta dv
		where
			dv.id_producto = p.id_producto
			and dv.id_venta in (
			select
				v.id_venta
			from
				ventas v
			where
				v.id_cliente = c.id_cliente)
    )
);

--ID y nombre de cada cliente y la suma total (suma de cantidad) de los productos que ha comprado. Pista: (https://www.postgresqltutorial.com/postgresql-sum-function/).
SELECT c.id_cliente, c.nombre, SUM(dv.cantidad) AS cantidad_total
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
LEFT JOIN detalles_venta dv ON v.id_venta = dv.id_venta
GROUP BY c.id_cliente, c.nombre;

--ID de los productos que no han sido comprados por clientes de Guadalajara.
SELECT p.id_producto
FROM productos p
WHERE NOT EXISTS (
    SELECT dv.id_detalle
    FROM detalles_venta dv
    JOIN ventas v ON dv.id_venta = v.id_venta
    JOIN clientes c ON v.id_cliente = c.id_cliente
    WHERE c.colonia = 'Guadalajara'
    AND dv.id_producto = p.id_producto
);

--ID de los productos que se han vendido a clientes de Monterrey y que también se han vendido a clientes de Cancún.
SELECT dv.id_producto
FROM detalles_venta dv
JOIN ventas v ON dv.id_venta = v.id_venta
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE c.colonia = 'Monterrey' or c.colonia = 'Cancún';

--Nombre de las ciudades en las que se han vendido todos los productos.
SELECT c.colonia
FROM clientes c
WHERE NOT EXISTS (
    SELECT p.id_producto
    FROM productos p
    WHERE NOT EXISTS (
        SELECT dv.id_detalle
        FROM detalles_venta dv
        WHERE dv.id_producto = p.id_producto
        AND dv.id_venta IN (SELECT v.id_venta FROM ventas v WHERE v.id_cliente = c.id_cliente)
    )
)
GROUP BY c.colonia;

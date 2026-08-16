USE Ventas_Tech_DB;
SELECT * FROM ventas
SELECT * FROM productos
SELECT * FROM clientes
SELECT * FROM categorias
SELECT * FROM territorios

--Consulta 1 
SELECT
v.fecha_venta AS fecha,
c.nombre AS nombre_cliente,
t.segmento,
t.region,
p.nombre_producto,
cat.nombre_categoria AS categoria,
v.cantidad,
v.precio_unitario,
v.precio_unitario * cantidad AS Total_De_Venta,
v.canal
FROM ventas v
INNER JOIN clientes AS c
ON v.id_cliente = c.id_cliente
INNER JOIN territorios AS t
    ON c.id_territorio = t.id_territorio
INNER JOIN productos AS p
ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria;

-- Consulta 2
SELECT 
c.nombre,
c.email,
c.fecha_registro
FROM clientes c
LEFT JOIN ventas AS v
ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

-- Consulta 3
SELECT
p.nombre_producto,
p.id_categoria,
p.precio
FROM productos p
LEFT JOIN ventas AS v
ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;

-- Consulta 4 
SELECT
    id_venta,
    fecha_venta,
    id_cliente,
    id_producto,
    cantidad,
    precio_unitario,
    cantidad * precio_unitario AS total_venta,
    canal
FROM ventas
WHERE canal = 'Online'

UNION ALL

SELECT
    id_venta,
    fecha_venta,
    id_cliente,
    id_producto,
    cantidad,
    precio_unitario,
    cantidad * precio_unitario AS total_venta,
    canal
FROM ventas
WHERE canal = 'Presencial';


SELECT
SUM(total_venta) AS total_facturado,
canal
FROM ( SELECT
    cantidad * precio_unitario AS total_venta,
    'Online' AS canal
FROM ventas
WHERE canal = 'Online'

UNION ALL

SELECT
    cantidad * precio_unitario AS total_venta,
    'Presencial' AS canal
FROM ventas
WHERE canal = 'Presencial'
) As total
GROUP BY canal;



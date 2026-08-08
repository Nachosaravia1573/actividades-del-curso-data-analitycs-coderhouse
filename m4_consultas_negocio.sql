USE Ventas_Tech_DB;
SELECT * FROM ventas;

--Consulta 1 Resumen ejecutivo mensual
SELECT 
MONTH(fecha_venta) AS mes,
SUM(precio_unitario * cantidad) AS Total_facturado,
SUM(cantidad) AS cantidad_pedidos,
AVG(precio_unitario * cantidad) AS Ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- Consulta 2 Ranking de productos
SELECT TOP 5
id_producto,
SUM(cantidad * precio_unitario) AS Total_facturado,
SUM(cantidad) AS unidades_vendidas
FROM ventas
GROUP BY id_producto
ORDER BY Total_facturado DESC;

--Consulta 3 Clientes recurrentes
SELECT
id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

--Consulta 4 — Meses por encima/por debajo del promedio 
SELECT
MONTH(fecha_venta) AS Mes,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes;



 -- Observaciones
 -- El producto mas vendido corresponde al que tiene id numero 2, al cual le corresponden 13 ventas para el mes de marzo
 -- El ticket promedio es de 644$
 -- El cliente que mas dinero gasto en el mes de marzo fue el cliente con el id 1 con un total gastado para el mes de marzo de 2640$
 -- Solamente tengo un mes en mi base de datos ppor lo cual no puedo realizar un promediocpor mesi ni evaluar cual se encuentra por debajo o por arriba
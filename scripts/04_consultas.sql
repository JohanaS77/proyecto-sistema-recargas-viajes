-- Cantidad de cambios de estado por mes durante el último año
SELECT DATE_TRUNC('month', fecha_cambio) AS mes, COUNT(*) AS total_cambios
FROM auditoria_tarjetas
WHERE fecha_cambio >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY mes
ORDER BY mes;

-- Top 5 tarjetas con más cambios de estado
SELECT tarjeta_id, COUNT(*) AS cantidad_cambios
FROM auditoria_tarjetas
GROUP BY tarjeta_id
ORDER BY cantidad_cambios DESC
LIMIT 5;

-- Recargas con descripción de la promoción aplicada
SELECT r.recarga_id, r.monto, r.fecha, p.nombre AS promocion, p.descripcion
FROM recargas r
JOIN promociones p ON r.promocion_id = p.promocion_id;

-- Monto total recargado por cada tipo de promoción en los últimos 3 meses
SELECT p.nombre, SUM(r.monto) AS total_recargado
FROM recargas r
JOIN promociones p ON r.promocion_id = p.promocion_id
WHERE r.fecha >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY p.nombre;

-- Promociones cuyo nombre contenga la palabra "bonus"
SELECT *
FROM promociones
WHERE LOWER(nombre) LIKE '%bonus%';

-- Viajes sin registro de validación
SELECT *
FROM viajes
WHERE dispositivo_id IS NULL;

-- Validaciones realizadas por dispositivos de tipo móvil en abril de 2025
SELECT v.*
FROM viajes v
JOIN dispositivos d ON v.dispositivo_id = d.dispositivo_id
WHERE d.tipo = 'móvil'
  AND v.fecha BETWEEN '2025-04-01' AND '2025-04-30';

-- Total recargado por tarjeta en el último mes
SELECT tarjeta_id, SUM(monto) AS total_recargado
FROM historial_recargas
WHERE fecha >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY tarjeta_id;

-- Historial de recargas con nombre del usuario (JOIN con tarjetas)
SELECT h.historial_id, h.fecha, h.monto, h.medio_pago, t.nombre_usuario
FROM historial_recargas h
JOIN tarjetas t ON h.tarjeta_id = t.tarjeta_id;

-- Medios de pago más utilizados y su promedio de monto
SELECT medio_pago, COUNT(*) AS cantidad_recargas, AVG(monto) AS promedio_monto
FROM historial_recargas
GROUP BY medio_pago;

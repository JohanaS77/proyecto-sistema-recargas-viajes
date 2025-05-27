-- Agregar campo promocion_id a la tabla recargas
ALTER TABLE recargas
ADD COLUMN promocion_id INTEGER REFERENCES promociones(promocion_id);

-- Agregar campo dispositivo_id a la tabla viajes
ALTER TABLE viajes
ADD COLUMN dispositivo_id INTEGER REFERENCES dispositivos(dispositivo_id);

-- Agregar campo usuario_id a la tabla tarjetas
ALTER TABLE tarjetas
ADD COLUMN usuario_id INTEGER REFERENCES usuarios(usuario_id);

-- Tabla historial de recargas
CREATE TABLE historial_recargas (
  historial_id SERIAL PRIMARY KEY,
  tarjeta_id INTEGER REFERENCES tarjetas(tarjeta_id),
  monto NUMERIC,
  fecha DATE DEFAULT CURRENT_DATE,
  medio_pago VARCHAR(50)
);

-- Tabla usuarios
CREATE TABLE usuarios (
  usuario_id SERIAL PRIMARY KEY,
  nombre_completo VARCHAR(100),
  correo VARCHAR(100)
);


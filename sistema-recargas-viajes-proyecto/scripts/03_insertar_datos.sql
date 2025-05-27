-- Inserción de 40 recargas asociadas a promociones
DO $$
BEGIN
  FOR i IN 1..40 LOOP
    INSERT INTO recargas (tarjeta_id, monto, fecha, promocion_id)
    VALUES (
      i, 
      (5000 + i * 100), 
      CURRENT_DATE - (i % 15), 
      (1 + (i % 10))
    );
  END LOOP;
END;
$$;

-- Inserción de 30 viajes con dispositivo (tipo móvil y torniquete)
DO $$
BEGIN
  FOR i IN 1..30 LOOP
    INSERT INTO viajes (estacion_abordaje_id, fecha, tarifa_id, tarjeta_id, dispositivo_id)
    VALUES (
      (1 + (i % 5)), 
      DATE '2025-04-01' + (i % 30),
      1, 
      i, 
      (1 + (i % 10))
    );
  END LOOP;
END;
$$;

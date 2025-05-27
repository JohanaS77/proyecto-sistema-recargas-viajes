DO $$
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO historial_recargas (tarjeta_id, monto, fecha, medio_pago)
    VALUES (
      (1 + (i % 30)), -- Suponiendo que existen al menos 30 tarjetas
      (5000 + (i * 50)),
      CURRENT_DATE - (i % 20),
      CASE (i % 4)
        WHEN 0 THEN 'Efectivo'
        WHEN 1 THEN 'Tarjeta débito'
        WHEN 2 THEN 'Tarjeta crédito'
        ELSE 'App móvil'
      END
    );
  END LOOP;
END;
$$;

DO $$
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO usuarios (nombre_completo, correo)
    VALUES (
      CONCAT('Usuario ', i),
      CONCAT('usuario', i, '@ejemplo.com')
    );
  END LOOP;
END;
$$;

DO $$
BEGIN
  FOR i IN 1..100 LOOP
    UPDATE tarjetas
    SET usuario_id = i
    WHERE tarjeta_id = i;
  END LOOP;
END;
$$;

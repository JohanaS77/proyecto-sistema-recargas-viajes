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

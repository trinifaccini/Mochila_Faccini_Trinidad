INSERT INTO usuario VALUES (default, 'masculino', 'juanito@gmail.com', '1993-02-04', '16360', 'Argentina');
INSERT INTO usuario VALUES (default, 'femenino', 'ana@hotmail.com', '1986-04-08', '1865', 'Colombia');
INSERT INTO usuario VALUES (default, 'masculino', 'francisco12@gmail.com', '1974-09-05', '1361', 'Brasil');
INSERT INTO suscripcion VALUES (default, 'premium', 'estandar', '2021-04-11', '2022-04-11', 1);
INSERT INTO suscripcion VALUES (default, 'free basico', 'estandar', '2021-03-28', '2022-03-28', '2');
INSERT INTO suscripcion VALUES (default, 'premium', 'premium', '2021-02-18', '2022-02-18', '3');
INSERT INTO forma_de_pago (id_forma_pago, marca_tarjeta, digitos_tarjeta, fecha_venc_tarjeta, id_suscripcion) VALUES (default, 'visa', '5684', '2023-04-11', 1);
INSERT INTO forma_de_pago (id_forma_pago, marca_tarjeta, digitos_tarjeta, fecha_venc_tarjeta, id_suscripcion) VALUES (default, 'naranja', '7689', '2023-09-12', '2');
INSERT INTO forma_de_pago (id_forma_pago, CBU_transferencia, alias_transferencia, id_suscripcion)VALUES (default, '234533454', 'mi.alias.transferencia', '3');
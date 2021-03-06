------------------------------
-- Archivo de base de datos --
------------------------------

DROP TABLE IF EXISTS usuarios CASCADE;

CREATE TABLE usuarios (
    id       bigserial PRIMARY KEY
  , nombre   varchar(255) NOT NULL UNIQUE
  , password varchar(60) NOT NULL
);

DROP TABLE IF EXISTS zapatos CASCADE;

CREATE TABLE zapatos (
    id           bigserial PRIMARY KEY
  , codigo       numeric(13) NOT NULL UNIQUE
  , denominacion varchar(60) NOT NULL
  , precio       numeric(7, 2)
  , CONSTRAINT ck_caodigo_13 CHECK (length(codigo::text) = 13)
);

DROP TABLE IF EXISTS carritos CASCADE;

CREATE TABLE carritos (
    id         bigserial PRIMARY KEY
  , usuario_id bigint NOT NULL REFERENCES usuarios (id)
  , zapato_id  bigint NOT NULL REFERENCES zapatos (id)
  , cantidad   int NOT NULL
  , UNIQUE (usuario_id, zapato_id)
  , CONSTRAINT ck_cantidad_no_negativa CHECK (cantidad >= 0)
);

DROP TABLE IF EXISTS facturas CASCADE;

CREATE TABLE facturas (
    id         bigserial PRIMARY KEY
  , usuario_id bigint NOT NULL REFERENCES usuarios (id)
  , created_at timestamp(0) NOT NULL DEFAULT LOCALTIMESTAMP
);

DROP TABLE IF EXISTS lineas CASCADE;

CREATE TABLE lineas (
    id         bigserial PRIMARY KEY
  , factura_id bigint NOT NULL REFERENCES facturas (id)
  , zapato_id  bigint NOT NULL REFERENCES zapatos (id)
  , cantidad   int NOT NULL 
  , CONSTRAINT ck_cantidad_no_negativa CHECK (cantidad >= 0)
);
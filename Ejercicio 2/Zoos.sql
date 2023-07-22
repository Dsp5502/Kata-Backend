create database Zoo;

CREATE TABLE Zoo (
  ID SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100),
  pais VARCHAR(100),
  tamano_m2 NUMERIC,
  presupuesto_anual NUMERIC
);
COMMENT ON TABLE Zoo IS 'Tabla para almacenar información de los zoos.';
COMMENT ON COLUMN Zoo.ID IS 'Identificador único para cada zoo.';
COMMENT ON COLUMN Zoo.nombre IS 'Nombre del zoo.';
COMMENT ON COLUMN Zoo.ciudad IS 'Ciudad donde se encuentra el zoo.';
COMMENT ON COLUMN Zoo.pais IS 'País donde se encuentra el zoo.';
COMMENT ON COLUMN Zoo.tamano_m2 IS 'Tamaño del zoo en metros cuadrados.';
COMMENT ON COLUMN Zoo.presupuesto_anual IS 'Presupuesto anual del zoo.';



CREATE TABLE EspeciesAnimales (
  ID_especies SERIAL PRIMARY KEY,
  nombre_vulgar VARCHAR(100),
  nombre_cientifico VARCHAR(100),
  familia VARCHAR(100),
  peligro_extincion BOOLEAN
);
COMMENT ON TABLE EspeciesAnimales IS 'Tabla para almacenar información de las especies animales.';
COMMENT ON COLUMN EspeciesAnimales.ID_especies IS 'Identificador único para cada especie animal.';
COMMENT ON COLUMN EspeciesAnimales.nombre_vulgar IS 'Nombre común de la especie animal.';
COMMENT ON COLUMN EspeciesAnimales.nombre_cientifico IS 'Nombre científico de la especie animal.';
COMMENT ON COLUMN EspeciesAnimales.familia IS 'Familia a la que pertenece la especie animal.';
COMMENT ON COLUMN EspeciesAnimales.peligro_extincion IS 'Flag que indica si la especie está en peligro de extinción.';


CREATE TABLE Animales (
  ID_animal SERIAL PRIMARY KEY,
  ID_especies INTEGER REFERENCES EspeciesAnimales (ID_especies),
  ID_zoo INTEGER REFERENCES Zoo (ID),
  sexo CHAR(1),
  ano_nacimiento DATE,
  pais_origen VARCHAR(100),
  continente VARCHAR(100)
);
COMMENT ON TABLE Animales IS 'Tabla para almacenar información de los animales individuales que se encuentran en los zoos.';
COMMENT ON COLUMN Animales.ID_animal IS 'Identificador único para cada animal.';
COMMENT ON COLUMN Animales.ID_especies IS 'Identificador de la especie a la que pertenece el animal.';
COMMENT ON COLUMN Animales.ID_zoo IS 'Identificador del zoo donde se encuentra el animal.';
COMMENT ON COLUMN Animales.sexo IS 'Sexo del animal.';
COMMENT ON COLUMN Animales.ano_nacimiento IS 'Año de nacimiento del animal.';
COMMENT ON COLUMN Animales.pais_origen IS 'País de origen del animal.';
COMMENT ON COLUMN Animales.continente IS 'Continente de origen del animal.';
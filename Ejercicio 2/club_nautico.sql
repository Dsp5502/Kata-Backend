create database club_nautico;


CREATE TABLE Socios (
  ID_Socio SERIAL PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Fecha_Nacimiento DATE,
  Dirección VARCHAR(100),
  Teléfono VARCHAR(15),
  Email VARCHAR(100)
);


COMMENT ON TABLE Socios IS 'Tabla para almacenar los datos de los socios del club náutico';
COMMENT ON COLUMN Socios.ID_Socio IS 'Identificador único del socio';
COMMENT ON COLUMN Socios.Nombre IS 'Nombre del socio';
COMMENT ON COLUMN Socios.Apellido IS 'Apellido del socio';
COMMENT ON COLUMN Socios.Fecha_Nacimiento IS 'Fecha de nacimiento del socio';
COMMENT ON COLUMN Socios.Dirección IS 'Dirección del socio';
COMMENT ON COLUMN Socios.Teléfono IS 'Número de teléfono del socio';
COMMENT ON COLUMN Socios.Email IS 'Dirección de correo electrónico del socio';




CREATE TABLE Barcos (
  ID_Barco SERIAL PRIMARY KEY,
  ID_Socio INTEGER REFERENCES Socios(ID_Socio),
  Numero_Matricula VARCHAR(20),
  Nombre_Barco VARCHAR(100),
  Numero_Amarre VARCHAR(10),
  Cuota_Amarre DECIMAL(10, 2)
);


COMMENT ON TABLE Barcos IS 'Tabla para almacenar los datos de los barcos de los socios';
COMMENT ON COLUMN Barcos.ID_Barco IS 'Identificador único del barco';
COMMENT ON COLUMN Barcos.ID_Socio IS 'ID del socio propietario del barco';
COMMENT ON COLUMN Barcos.Numero_Matricula IS 'Número de matrícula del barco';
COMMENT ON COLUMN Barcos.Nombre_Barco IS 'Nombre del barco';
COMMENT ON COLUMN Barcos.Numero_Amarre IS 'Número del amarre del barco';
COMMENT ON COLUMN Barcos.Cuota_Amarre IS 'Cuota que paga el socio por el amarre del barco';



CREATE TABLE Salidas (
  ID_Salida SERIAL PRIMARY KEY,
  ID_Barco INTEGER REFERENCES Barcos(ID_Barco),
  Fecha_Salida DATE,
  Hora_Salida TIME,
  Destino VARCHAR(100)
  ID_Patrón INTEGER REFERENCES Patrones(ID_Patrón);
);


COMMENT ON TABLE Salidas IS 'Tabla para almacenar información sobre las salidas realizadas por cada barco';
COMMENT ON COLUMN Salidas.ID_Salida IS 'Identificador único de la salida';
COMMENT ON COLUMN Salidas.ID_Barco IS 'ID del barco asociado a la salida';
COMMENT ON COLUMN Salidas.Fecha_Salida IS 'Fecha de la salida';
COMMENT ON COLUMN Salidas.Hora_Salida IS 'Hora de la salida';
COMMENT ON COLUMN Salidas.Destino IS 'Destino de la salida';
COMMENT ON COLUMN Salidas.ID_Patrón IS 'ID del patrón responsable de la salida ';




CREATE TABLE Patrones (
  ID_Patrón SERIAL PRIMARY KEY,
  Nombre_Patrón VARCHAR(50),
  Apellido_Patrón VARCHAR(50),
  Teléfono_Patrón VARCHAR(15),
  Email_Patrón VARCHAR(100)
);


COMMENT ON TABLE Patrones IS 'Tabla para almacenar los datos personales de los patrones de las salidas';
COMMENT ON COLUMN Patrones.ID_Patrón IS 'Identificador único del patrón';
COMMENT ON COLUMN Patrones.Nombre_Patrón IS 'Nombre del patrón';
COMMENT ON COLUMN Patrones.Apellido_Patrón IS 'Apellido del patrón';
COMMENT ON COLUMN Patrones.Teléfono_Patrón IS 'Número de teléfono del patrón';
COMMENT ON COLUMN Patrones.Email_Patrón IS 'Dirección de correo electrónico del patrón';





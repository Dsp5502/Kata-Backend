create database club_nautico;


CREATE TABLE Socios (
  ID_Socio SERIAL PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Fecha_Nacimiento DATE,
  Direcci�n VARCHAR(100),
  Tel�fono VARCHAR(15),
  Email VARCHAR(100)
);


COMMENT ON TABLE Socios IS 'Tabla para almacenar los datos de los socios del club n�utico';
COMMENT ON COLUMN Socios.ID_Socio IS 'Identificador �nico del socio';
COMMENT ON COLUMN Socios.Nombre IS 'Nombre del socio';
COMMENT ON COLUMN Socios.Apellido IS 'Apellido del socio';
COMMENT ON COLUMN Socios.Fecha_Nacimiento IS 'Fecha de nacimiento del socio';
COMMENT ON COLUMN Socios.Direcci�n IS 'Direcci�n del socio';
COMMENT ON COLUMN Socios.Tel�fono IS 'N�mero de tel�fono del socio';
COMMENT ON COLUMN Socios.Email IS 'Direcci�n de correo electr�nico del socio';




CREATE TABLE Barcos (
  ID_Barco SERIAL PRIMARY KEY,
  ID_Socio INTEGER REFERENCES Socios(ID_Socio),
  Numero_Matricula VARCHAR(20),
  Nombre_Barco VARCHAR(100),
  Numero_Amarre VARCHAR(10),
  Cuota_Amarre DECIMAL(10, 2)
);


COMMENT ON TABLE Barcos IS 'Tabla para almacenar los datos de los barcos de los socios';
COMMENT ON COLUMN Barcos.ID_Barco IS 'Identificador �nico del barco';
COMMENT ON COLUMN Barcos.ID_Socio IS 'ID del socio propietario del barco';
COMMENT ON COLUMN Barcos.Numero_Matricula IS 'N�mero de matr�cula del barco';
COMMENT ON COLUMN Barcos.Nombre_Barco IS 'Nombre del barco';
COMMENT ON COLUMN Barcos.Numero_Amarre IS 'N�mero del amarre del barco';
COMMENT ON COLUMN Barcos.Cuota_Amarre IS 'Cuota que paga el socio por el amarre del barco';



CREATE TABLE Salidas (
  ID_Salida SERIAL PRIMARY KEY,
  ID_Barco INTEGER REFERENCES Barcos(ID_Barco),
  Fecha_Salida DATE,
  Hora_Salida TIME,
  Destino VARCHAR(100)
  ID_Patr�n INTEGER REFERENCES Patrones(ID_Patr�n);
);


COMMENT ON TABLE Salidas IS 'Tabla para almacenar informaci�n sobre las salidas realizadas por cada barco';
COMMENT ON COLUMN Salidas.ID_Salida IS 'Identificador �nico de la salida';
COMMENT ON COLUMN Salidas.ID_Barco IS 'ID del barco asociado a la salida';
COMMENT ON COLUMN Salidas.Fecha_Salida IS 'Fecha de la salida';
COMMENT ON COLUMN Salidas.Hora_Salida IS 'Hora de la salida';
COMMENT ON COLUMN Salidas.Destino IS 'Destino de la salida';
COMMENT ON COLUMN Salidas.ID_Patr�n IS 'ID del patr�n responsable de la salida ';




CREATE TABLE Patrones (
  ID_Patr�n SERIAL PRIMARY KEY,
  Nombre_Patr�n VARCHAR(50),
  Apellido_Patr�n VARCHAR(50),
  Tel�fono_Patr�n VARCHAR(15),
  Email_Patr�n VARCHAR(100)
);


COMMENT ON TABLE Patrones IS 'Tabla para almacenar los datos personales de los patrones de las salidas';
COMMENT ON COLUMN Patrones.ID_Patr�n IS 'Identificador �nico del patr�n';
COMMENT ON COLUMN Patrones.Nombre_Patr�n IS 'Nombre del patr�n';
COMMENT ON COLUMN Patrones.Apellido_Patr�n IS 'Apellido del patr�n';
COMMENT ON COLUMN Patrones.Tel�fono_Patr�n IS 'N�mero de tel�fono del patr�n';
COMMENT ON COLUMN Patrones.Email_Patr�n IS 'Direcci�n de correo electr�nico del patr�n';





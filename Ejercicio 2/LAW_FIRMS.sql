CREATE DATABASE law_firms;

CREATE TABLE Cliente (
    DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200) NOT NULL
);



COMMENT ON TABLE Cliente IS 'Tabla para almacenar información sobre clientes.';
COMMENT ON COLUMN Cliente.DNI IS 'Identificador único para cada cliente.';
COMMENT ON COLUMN Cliente.Nombre IS 'Nombre completo del cliente.';
COMMENT ON COLUMN Cliente.Direccion IS 'Dirección del cliente.';


CREATE TABLE Procurador (
    DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200) NOT NULL
);


COMMENT ON TABLE Procurador IS 'Tabla para almacenar información sobre procuradores.';
COMMENT ON COLUMN Procurador.DNI IS 'Identificador único para cada procurador.';
COMMENT ON COLUMN Procurador.Nombre IS 'Nombre completo del procurador.';
COMMENT ON COLUMN Procurador.Direccion IS 'Dirección del procurador.';


CREATE TABLE Asunto (
    NumExpediente SERIAL PRIMARY KEY,
    Periodo DATERANGE NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    DNI_Cliente VARCHAR(20) REFERENCES Cliente(DNI),
    DNI_Procurador VARCHAR(20) REFERENCES Procurador(DNI)
);

COMMENT ON TABLE Asunto IS 'Tabla para almacenar información sobre los casos manejados por el bufete de abogados.';
COMMENT ON COLUMN Asunto.NumExpediente IS 'Identificador único para cada caso (generado automáticamente).';
COMMENT ON COLUMN Asunto.Periodo IS 'Rango de fechas que representa la fecha de inicio y finalización del caso.';
COMMENT ON COLUMN Asunto.Estado IS 'Estado actual del caso (por ejemplo, en progreso, archivado, etc.).';
COMMENT ON COLUMN Asunto.DNI_Cliente IS 'Clave foránea que referencia el DNI del cliente asociado con el caso.';
COMMENT ON COLUMN Asunto.DNI_Procurador IS 'Clave foránea que referencia el DNI del procurador asociado con el caso.';



CREATE TABLE Asunto_Procurador (
    Asunto_NumExpediente INTEGER REFERENCES Asunto(NumExpediente),
    Procurador_DNI VARCHAR(20) REFERENCES Procurador(DNI),
    PRIMARY KEY (Asunto_NumExpediente, Procurador_DNI)
);


COMMENT ON TABLE Asunto_Procurador IS 'Tabla de cruce para relacionar los asuntos con los procuradores que los manejan.';
COMMENT ON COLUMN Asunto_Procurador.Asunto_NumExpediente IS 'Clave foránea que referencia el número de expediente del asunto relacionado.';
COMMENT ON COLUMN Asunto_Procurador.Procurador_DNI IS 'Clave foránea que referencia el DNI del procurador relacionado.';

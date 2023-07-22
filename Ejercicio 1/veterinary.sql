CREATE DATABASE veterinary;

CREATE TABLE Owner (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Lastname VARCHAR(100) NOT NULL,
  Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Pet (
  ID SERIAL PRIMARY KEY,
  PetName VARCHAR(100) NOT NULL,
  PetType VARCHAR(50) NOT NULL,
  Breed VARCHAR(100),
  Age INTEGER,
  OwnerID INTEGER REFERENCES Owner(ID)
);

CREATE TABLE Veterinarian (
  ProfessionalLicense VARCHAR(20) PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Age INTEGER,
  YearsOfExperience INTEGER
);

CREATE TABLE VetAttendance (
  VeterinarianID VARCHAR(20) REFERENCES Veterinarian(ProfessionalLicense),
  PetID INTEGER REFERENCES Pet(ID),
  PRIMARY KEY (VeterinarianID, PetID)
);
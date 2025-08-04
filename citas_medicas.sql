-- Crear base de datos
CREATE DATABASE IF NOT EXISTS proyecto_final CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE proyecto_final;

-- Tabla: customers (Pacientes)
CREATE TABLE customers (
  codpaci INT(11) NOT NULL AUTO_INCREMENT,
  dnipa CHAR(8) NOT NULL,
  nombrep VARCHAR(50) NOT NULL,
  apellidop VARCHAR(50) NOT NULL,
  seguro CHAR(10) NOT NULL,
  tele CHAR(9) NOT NULL,
  sexo CHAR(15) NOT NULL,
  usuario VARCHAR(15) NOT NULL,
  clave VARCHAR(255) NOT NULL,
  cargo CHAR(1) NOT NULL,
  estado VARCHAR(15) NOT NULL,
  fecha_create TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (codpaci)
);

-- Tabla: specialty (Especialidades)
CREATE TABLE specialty (
  codespe INT(11) NOT NULL AUTO_INCREMENT,
  nombrees VARCHAR(50) NOT NULL,
  fecha_create TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (codespe)
);

-- Tabla: doctor (Médicos)
CREATE TABLE doctor (
  coddoc INT(11) NOT NULL AUTO_INCREMENT,
  dnidoc CHAR(8) NOT NULL,
  nomdoc VARCHAR(50) NOT NULL,
  apedoc VARCHAR(50) NOT NULL,
  codespe INT(11) NOT NULL,
  sexo CHAR(15) NOT NULL,
  telefo CHAR(9) NOT NULL,
  fechanaci DATE NOT NULL,
  correo VARCHAR(50) NOT NULL,
  naciona VARCHAR(35) NOT NULL,
  estado CHAR(15) NOT NULL,
  fecha_create TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (coddoc),
  FOREIGN KEY (codespe) REFERENCES specialty(codespe)
);

-- Tabla: horario (Horarios de atención)
CREATE TABLE horario (
  codhor INT(11) NOT NULL AUTO_INCREMENT,
  nomhor VARCHAR(30) NOT NULL,
  coddoc INT(11) NOT NULL,
  estado CHAR(1) NOT NULL,
  fere TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (codhor),
  FOREIGN KEY (coddoc) REFERENCES doctor(coddoc)
);

-- Tabla: appointment (Citas médicas)
CREATE TABLE appointment (
  codcit INT(11) NOT NULL AUTO_INCREMENT,
  dates DATE NOT NULL,
  hour TIME NOT NULL,
  codpaci INT(11) NOT NULL,
  coddoc INT(11) NOT NULL,
  codespe INT(11) NOT NULL,
  estado CHAR(1) NOT NULL,
  fecha_create TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (codcit),
  FOREIGN KEY (codpaci) REFERENCES customers(codpaci),
  FOREIGN KEY (coddoc) REFERENCES doctor(coddoc),
  FOREIGN KEY (codespe) REFERENCES specialty(codespe)
);

-- Tabla: usuarios (Administrador del sistema)
CREATE TABLE usuarios (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  usuario VARCHAR(15) NOT NULL,
  email VARCHAR(50) NOT NULL,
  clave VARCHAR(255) NOT NULL,
  cargo CHAR(1) NOT NULL,
  PRIMARY KEY (id)
);

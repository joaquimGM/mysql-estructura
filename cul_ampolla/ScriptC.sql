DROP DATABASE IF EXISTS Cul_Ampolla;
CREATE DATABASE Cul_Ampolla CHARACTER SET utf8mb4;
USE Cul_Ampolla;

CREATE TABLE Proveidors (
    id_proveidor INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    carrer VARCHAR(100),
    numero INT,
    pis INT,
    porta INT,
    ciutat VARCHAR(50),
    cp INT,
    pais VARCHAR(50),
    telf BIGINT,
    fax BIGINT,
    NIF VARCHAR(20)
);

CREATE TABLE Empleats (
    id_empleat INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    cognoms VARCHAR(100),
    inici_contracte DATE,
    fi_contracte DATE
);

CREATE TABLE TipusMuntura (
    id_tipus INT AUTO_INCREMENT PRIMARY KEY,
    nom_tipus VARCHAR(50) UNIQUE
);

CREATE TABLE Clients (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    adreça VARCHAR(255),
    telf BIGINT,
    correu VARCHAR(100),
    data_registre DATE,
    id_client_recomanador INT,
    FOREIGN KEY (id_client_recomanador) REFERENCES Clients(id_client)
);

CREATE TABLE Ulleres (
    id_client INT,
    id_proveidor INT,
    marca VARCHAR(100),
    graduacio FLOAT,
    tipus VARCHAR(20),
    color_muntura VARCHAR(50),
    color_vidre VARCHAR(50),
    preu FLOAT,
    id_empleat INT,
    data_venda DATE,
    FOREIGN KEY (id_client) REFERENCES Clients(id_client),
    FOREIGN KEY (id_proveidor) REFERENCES Proveidors(id_proveidor),
    FOREIGN KEY (id_empleat) REFERENCES Empleats(id_empleat)
);

INSERT INTO TipusMuntura (nom_tipus) VALUES
    ('flotant'),
    ('pasta'),
    ('metàl·lica');

INSERT INTO Empleats (nom, cognoms) VALUES
    ('Anna', 'Martínez López'),
    ('Pau', 'García Rodríguez'),
    ('Laura', 'Fernández Gómez'),
    ('Marc', 'Díaz Pérez'),
    ('Júlia', 'Sánchez Martí');

INSERT INTO Proveidors (nom, carrer, numero, pis, porta, ciutat, cp, pais, telf, fax, NIF) VALUES
    ('Optica Supplier S.L.', 'Carrer Major', 123, NULL, NULL, 'Barcelona', 08001, 'Espanya', 34123456789, 34123456790, 'B12345678'),
    ('Vista Glasses Company', 'Carrer Gran', 456, NULL, 2, 'Madrid', 28002, 'Espanya', 34987654321, 34987656322, 'B98765432'),
    ('Lens World S.A.', 'Avinguda Central', 789, NULL, NULL, 'València', 46003, 'Espanya', 34654321987, 34654321988, 'A65432198'),
    ('Sunrise Optics Ltd.', 'Carrer del Sol', 10, NULL, 1, 'Barcelona', 08002, 'Espanya', 34123987654, 34123987655, 'C12398765');

INSERT INTO Clients (nom, adreça, telf, correu, data_registre, id_client_recomanador) VALUES 
    ('Maria', 'Carrer del Parc, 15', 34612345678, 'maria@example.com', '2024-04-01', NULL),
    ('Jordi', 'Carrer de la Marina, 22', 34612345679, 'jordi@example.com', '2024-04-02', NULL),
    ('Elena', 'Avinguda del Paral·lel, 30', 34612345680, 'elena@example.com', '2024-04-03', 1),
    ('Marc', 'Carrer de Balmes, 45', 34612345681, 'marc@example.com', '2024-04-04', 2),
    ('Laia', 'Avinguda Diagonal, 100', 34612345682, 'laia@example.com', '2024-04-05', 3);

INSERT INTO Ulleres (id_proveidor, id_client, marca, graduacio, tipus, color_muntura, color_vidre, preu, id_empleat, data_venda) VALUES
    (1, 1, 'Ray-Ban', 1.50, 'Flotant', 'Negre', 'Gris', 150.00, 1, '2024-04-01'),
    (2, 2, 'Oakley', 2.00, 'Metàl·lica', 'Blau', 'Marró', 180.00, 2, '2024-04-02'),
    (3, 4, 'Persol', -1.75, 'Pasta', 'Marró', 'Transparent', 200.00, 3, '2024-04-03'),
    (4, 4, 'Prada', 2.25, 'Flotant', 'Platejat', 'Verd', 250.00, 1, '2024-04-04'),
    (1, 5, 'Ray-Ban', -2.50, 'Pasta', 'Vermell', 'Blau', 220.00, 5, '2024-04-05'),
    (2, 3, 'Oakley', 1.75, 'Metàl·lica', 'Negre', 'Gris', 190.00, 1, '2024-04-06'),
    (3, 4, 'Persol', 1.00, 'Flotant', 'Marró', 'Marró', 180.00, 2, '2024-04-07'),
    (4, 5, 'Prada', -1.25, 'Pasta', 'Negre', 'Transparent', 210.00, 3, '2024-04-08'),
    (1, 1, 'Ray-Ban', 2.75, 'Flotant', 'Blanc', 'Vermell', 260.00, 1, '2024-04-09'),
    (2, 2, 'Oakley', -1.50, 'Metàl·lica', 'Platejat', 'Verd', 230.00, 5, '2024-04-10'),
    (3, 5, 'Persol', 1.25, 'Pasta', 'Marró', 'Gris', 190.00, 1, '2024-04-11'),
    (4, 2, 'Prada', -2.00, 'Flotant', 'Negre', 'Transparent', 240.00, 2, '2024-04-12'),
    (1, 3, 'Ray-Ban', 1.00, 'Pasta', 'Blanc', 'Vermell', 200.00, 3, '2024-04-13'),
    (2, 1, 'Oakley', -2.25, 'Metàl·lica', 'Gris', 'Negre', 210.00, 4, '2024-04-14'),
    (3, 5, 'Persol', 2.50, 'Flotant', 'Marró', 'Transparent', 250.00, 5, '2024-04-15'),
    (4, 3, 'Prada', -1.00, 'Pasta', 'Negre', 'Vermell', 220.00, 1, '2024-04-16'),
    (1, 1, 'Ray-Ban', 1.50, 'Metàl·lica', 'Platejat', 'Blau', 230.00, 1, '2024-04-17'),
    (2, 1, 'Oakley', 1.75, 'Flotant', 'Negre', 'Transparent', 240.00, 5, '2024-04-18'),
    (3, 2, 'Persol', 2.50, 'Pasta', 'Marró', 'Gris', 220.00, 4, '2024-04-19'),
    (4, 4, 'Prada', 2.00, 'Metàl·lica', 'Negre', 'Blau', 260.00, 5, '2024-04-20'),
    (1, 4, 'Nike', 1.00, 'Flotant', 'Negre', 'Gris', 150.00, 1, '2024-04-21'),
    (2, 1, 'Nike', 2.50, 'Metàl·lica', 'Blau', 'Marró', 180.00, 4, '2024-04-22'),
    (3, 3, 'Nike', -1.75, 'Pasta', 'Marró', 'Transparent', 200.00, 4, '2024-04-23'),
    (4, 2, 'Nike', 1.25, 'Flotant', 'Platejat', 'Verd', 250.00, 4, '2024-04-24'),
    (1, 2, 'Nike', -2.00, 'Pasta', 'Vermell', 'Blau', 220.00, 5, '2024-04-25');
    
SELECT C.nom AS nom_client, COUNT(*) AS total_compres FROM Ulleres U  JOIN Clients C ON U.id_client = C.id_client GROUP BY U.id_client;

SELECT DISTINCT P.nom AS proveidor FROM Ulleres U INNER JOIN Proveidors P ON U.id_proveidor = P.id_proveidor;

SELECT DISTINCT id_empleat, marca, id_client, preu FROM Ulleres WHERE id_empleat = 1 AND YEAR(data_venda) = 2024;

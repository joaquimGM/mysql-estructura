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

CREATE TABLE Marques (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) UNIQUE
);

CREATE TABLE Proveidor_marca (
    id_proveidor INT,
    id_marca INT,
    PRIMARY KEY (id_proveidor, id_marca),
    FOREIGN KEY (id_proveidor) REFERENCES Proveidors(id_proveidor),
    FOREIGN KEY (id_marca) REFERENCES Marques(id_marca)
);

CREATE TABLE Ulleres (
    id_ullera INT AUTO_INCREMENT PRIMARY KEY,
    id_marca INT,
    id_proveidor INT,
    graduacio FLOAT,
    tipus_muntura ENUM('flotant', 'pasta', 'metàl·lica'),
    color_muntura VARCHAR(50),
    color_vidre VARCHAR(50),
    preu FLOAT,
    FOREIGN KEY (id_marca) REFERENCES Marques(id_marca),
    FOREIGN KEY (id_proveidor) REFERENCES Proveidors(id_proveidor)
);

CREATE TABLE Empleats (
    id_empleat INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    cognoms VARCHAR(100),
    inici_contracte DATE,
    fi_contracte DATE
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

CREATE TABLE Ventes (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    id_empleat INT,
    data_venta DATE,
    FOREIGN KEY (id_client) REFERENCES Clients(id_client),
    FOREIGN KEY (id_empleat) REFERENCES Empleats(id_empleat)
);

CREATE TABLE Detalls_Venta (
    id_venta INT,
    id_ullera INT,
    quantitat INT,
    FOREIGN KEY (id_venta) REFERENCES Ventes(id_venta),
    FOREIGN KEY (id_ullera) REFERENCES Ulleres(id_ullera)
);

INSERT INTO Empleats (nom, cognoms, inici_contracte) VALUES
    ('Anna', 'Martínez López', '2024-01-01'),
    ('Pau', 'García Rodríguez', '2024-02-01'),
    ('Laura', 'Fernández Gómez', '2024-03-01'),
    ('Marc', 'Díaz Pérez', '2024-04-01'),
    ('Júlia', 'Sánchez Martí', '2024-05-01');

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

INSERT INTO Marques (nom) VALUES
    ('Ray-Ban'),
    ('Oakley'),
    ('Persol'),
    ('Prada'),
    ('Adidas'),
    ('Nike');
    
INSERT INTO Ulleres (id_marca, id_proveidor, graduacio, tipus_muntura, color_muntura, color_vidre, preu) VALUES
    (1, 1, 1.50, 'flotant', 'Negre', 'Gris', 150.00),
    (2, 2, 2.00, 'metàl·lica', 'Blau', 'Marró', 180.00),
    (3, 3, -1.75, 'metàl·lica', 'Marró', 'Transparent', 200.00),
    (4, 4, 2.25, 'flotant', 'Platejat', 'Verd', 250.00),
    (1, 4, -2.50, 'metàl·lica', 'Vermell', 'Blau', 220.00),
    (3, 4, 1.00, 'flotant', 'Marró', 'Marró', 180.00),
    (1, 1, 2.75, 'flotant', 'Blanc', 'Vermell', 260.00),
    (2, 2, -1.50, 'pasta', 'Platejat', 'Verd', 230.00),
    (4, 2, -2.00, 'flotant', 'Negre', 'Transparent', 240.00),
    (1, 3, 1.00, 'pasta', 'Blanc', 'Vermell', 200.00),
    (2, 1, -2.25, 'metàl·lica', 'Gris', 'Negre', 210.00),
    (4, 3, -1.00, 'metàl·lica', 'Negre', 'Vermell', 220.00),
    (1, 1, 1.50, 'pasta', 'Platejat', 'Blau', 230.00),
    (2, 1, 1.75, 'flotant', 'Negre', 'Transparent', 240.00),
    (3, 2, 2.50, 'metàl·lica', 'Marró', 'Gris', 220.00),
    (4, 4, 2.00, 'pasta', 'Negre', 'Blau', 260.00),
    (1, 2, 1.00, 'flotant', 'Negre', 'Gris', 150.00),
    (2, 1, 2.50, 'metàl·lica', 'Blau', 'Marró', 180.00),
    (3, 3, -1.75, 'metàl·lica', 'Marró', 'Transparent', 200.00),
    (4, 2, 1.25, 'flotant', 'Platejat', 'Verd', 250.00),
    (1, 2, -2.00, 'metàl·lica', 'Vermell', 'Blau', 220.00);
    
    INSERT INTO Ventes (id_client, id_empleat, data_venta) VALUES
    (1, 1, '2024-04-06'),
    (2, 2, '2024-04-07'),
    (3, 3, '2024-04-08'),
    (4, 4, '2024-04-09'),
    (5, 5, '2024-04-10'),
    (1, 2, '2024-04-11'),
    (2, 3, '2024-04-12'),
    (3, 4, '2024-04-13'),
    (4, 5, '2024-04-14'),
    (5, 1, '2024-04-15');

INSERT INTO Detalls_Venta (id_venta, id_ullera, quantitat) VALUES
    (1, 1, 2),   
    (2, 2, 1),   
    (3, 3, 3),   
    (4, 4, 2),   
    (5, 5, 1),   
    (6, 6, 2),   
    (7, 7, 1),   
    (8, 8, 3),  
    (9, 9, 2),   
    (10, 10, 1); 

SELECT Clients.nom, COUNT(Ventes.id_venta) AS total_compres
	FROM Clients
	LEFT JOIN Ventes ON Clients.id_client = Ventes.id_client
	GROUP BY Clients.nom;
    
SELECT CONCAT(e.nom, ' ', e.cognoms) AS nom_empleat, COUNT(v.id_venta) AS total_vendes
FROM Empleats e
LEFT JOIN Ventes v ON e.id_empleat = v.id_empleat
GROUP BY e.nom, e.cognoms;

SELECT DISTINCT P.nom
FROM Proveidors P
INNER JOIN Ulleres U ON P.id_proveidor = U.id_proveidor
INNER JOIN Detalls_Venta DV ON U.id_ullera = DV.id_ullera
INNER JOIN Ventes V ON DV.id_venta = V.id_venta
WHERE V.data_venta IS NOT NULL;

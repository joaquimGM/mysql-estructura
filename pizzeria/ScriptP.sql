DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(50) NOT NULL,
    adreca VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefon VARCHAR(15) NOT NULL
);

CREATE TABLE Comandes (
    comanda_id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    tipus_entrega ENUM('domicili', 'botiga') NOT NULL,
    quantitat_productes INT NOT NULL,
    preu_total DECIMAL(10,2) NOT NULL,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE Productes (
    producte_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    descripcio TEXT,
    imatge_url VARCHAR(255),
    preu DECIMAL(10,2) NOT NULL
);

CREATE TABLE Categories (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE Pizza_Categoria (
    pizza_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categories(categoria_id)
);

CREATE TABLE Comanda_Productes (
    comanda_id INT,
    producte_id INT,
    quantitat INT NOT NULL,
    PRIMARY KEY (comanda_id, producte_id),
    FOREIGN KEY (comanda_id) REFERENCES Comandes(comanda_id),
    FOREIGN KEY (producte_id) REFERENCES Productes(producte_id)
);

CREATE TABLE Botigues (
    botiga_id INT AUTO_INCREMENT PRIMARY KEY,
    adreca VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL
);

CREATE TABLE Empleats (
    empleat_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(50) NOT NULL,
    nif VARCHAR(20) NOT NULL,
    telefon VARCHAR(15) NOT NULL,
    rol ENUM('cuiner', 'repartidor') NOT NULL,
    botiga_id INT,
    FOREIGN KEY (botiga_id) REFERENCES Botigues(botiga_id)
);

CREATE TABLE Lliuraments (
    comanda_id INT,
    empleat_id INT,
    data_hora DATETIME NOT NULL,
    PRIMARY KEY (comanda_id),
    FOREIGN KEY (comanda_id) REFERENCES Comandes(comanda_id),
    FOREIGN KEY (empleat_id) REFERENCES Empleats(empleat_id)
);

INSERT INTO Botigues (adreca, codi_postal, localitat, provincia)
VALUES
    ('Carrer de Sants, 50', '08014', 'Barcelona', 'Barcelona'),
    ('Rambla de Catalunya, 100', '08007', 'Barcelona', 'Barcelona'),
    ('Passeig de Gràcia, 150', '08008', 'Barcelona', 'Barcelona'),
    ('Carrer del Comte Borrell, 200', '08015', 'Barcelona', 'Barcelona'),
    ('Carrer de Balmes, 250', '08016', 'Barcelona', 'Barcelona'),
    ('Carrer de Sant Antoni, 15', '08002', 'Badalona', 'Barcelona'),
    ('Plaça de la Vila, 10', '08911', 'Badalona', 'Barcelona'),
    ('Carrer del Mar, 25', '08912', 'Badalona', 'Barcelona');

INSERT INTO Productes (nom, descripcio, imatge_url, preu)
VALUES 
    ('Aigua', 'Aigua mineral', 'aigua.jpg', 1.50),
    ('Coca-Cola', 'Beguda carbonatada', 'coca_cola.jpg', 2.00),
    ('Fanta', 'Beguda carbonatada', 'fanta.jpg', 2.00),
    ('Sprite', 'Beguda carbonatada', 'sprite.jpg', 2.00),
    ('Cervesa', 'Beguda alcohòlica', 'cervesa.jpg', 2.50);

INSERT INTO Categories (nom) VALUES
    ('Clàssiques'),
    ('Especials'),
    ('Vegetarianes');
    
INSERT INTO Productes (nom, descripcio, imatge_url, preu) VALUES
    ('Margarita', 'Mozzarella, tomàquet i albahaca', 'margarita.jpg', 8.50),
    ('Quatre Formatges', 'Mozzarella, formatge de cabra, gorgonzola i parmesà', 'quatre_formatges.jpg', 9.50),
    ('Barbacoa', 'Salsa de barbacoa, pollastre, ceba i bacon', 'barbacoa.jpg', 10.00),
    ('Vegetariana', 'Verdures variades i mozzarella', 'vegetariana.jpg', 9.00),
    ('Prosciutto', 'Prosciutto, rúcula i parmesà', 'prosciutto.jpg', 10.50),
	('Hawaiana', 'Pinya, pernil dolç, mozzarella i salsa de tomàquet', 'hawaiana.jpg', 10.00),
    ('Carbonara', 'Salsa de nata, formatge parmesà, ou, bacon i pebre negre', 'carbonara.jpg', 11.50),
    ('Barcelona', 'Fuet, tomàquet, ceba, mozzarella i salsa de tomàquet', 'barcelona.jpg', 9.50),
    ('Capricciosa', 'Jamon york, bolets, olives, mozzarella i salsa de tomàquet', 'capricciosa.jpg', 12.00),
    ('Mediterrània', 'Pebrots, ceba, tomàquet cherry, oli', 'mediterrania.jpg', 10.00);

INSERT INTO Pizza_Categoria (nom, categoria_id) VALUES
    ('Margarita', 1),  -- Clàssiques
    ('Quatre Formatges', 1),  -- Clàssiques
    ('Barbacoa', 2),  -- Especials
    ('Vegetariana', 3),  -- Vegetarianes
    ('Prosciutto', 2),  -- Especials
	('Hawaiana', 2),  -- Especials
    ('Carbonara', 2),  -- Especials
    ('Barcelona', 1),  -- Clàssiques
    ('Capricciosa', 2),  -- Especials
    ('Mediterrània', 3);  -- Vegetarianes

INSERT INTO Clients (nom, cognoms, adreca, codi_postal, localitat, provincia, telefon)
VALUES
    ('Joan', 'Garcia', 'Carrer Major, 123', '08001', 'Barcelona', 'Barcelona', '666111222'),
    ('Maria', 'Martínez', 'Avinguda Gran Via, 456', '08002', 'Barcelona', 'Barcelona', '666222333'),
    ('Pau', 'Sánchez', 'Carrer Girona, 789', '08003', 'Barcelona', 'Barcelona', '666333444'),
    ('Laura', 'Gómez', 'Carrer València, 234', '08004', 'Barcelona', 'Barcelona', '666444555'),
    ('Eduard', 'Fernández', 'Passeig de Gràcia, 567', '08005', 'Barcelona', 'Barcelona', '666555666'),
    ('Anna', 'López', 'Avinguda Diagonal, 890', '08006', 'Barcelona', 'Barcelona', '666666777'),
	('Marc', 'Soler', 'Carrer Provença, 123', '08007', 'Barcelona', 'Barcelona', '666777888'),
    ('Clara', 'Rodríguez', 'Carrer Aragó, 456', '08008', 'Barcelona', 'Barcelona', '666888999'),
    ('Pol', 'Martí', 'Avinguda Meridiana, 789', '08009', 'Barcelona', 'Barcelona', '666999000'),
    ('Laia', 'Giménez', 'Carrer Sardenya, 1011', '08010', 'Barcelona', 'Barcelona', '666000111');

INSERT INTO Comandes (data_hora, tipus_entrega, quantitat_productes, preu_total, client_id)
VALUES
    ('2024-04-24 10:00:00', 'domicili', 3, 6.50, 1),
    ('2024-04-24 11:00:00', 'botiga', 2, 4.00, 2),
    ('2024-04-24 12:00:00', 'domicili', 1, 2.00, 3),
    ('2024-04-24 13:00:00', 'domicili', 2, 5.00, 1),
    ('2024-04-25 10:30:00', 'domicili', 2, 8.00, 2),
    ('2024-04-25 12:45:00', 'botiga', 3, 12.50, 3),
    ('2024-04-26 11:15:00', 'domicili', 1, 4.00, 1),
    ('2024-04-26 13:30:00', 'domicili', 2, 9.00, 2),
	('2024-04-27 14:00:00', 'domicili', 2, 10.00, 4),
    ('2024-04-27 15:30:00', 'domicili', 1, 5.50, 5),
    ('2024-04-28 12:30:00', 'botiga', 3, 15.00, 6),
    ('2024-04-28 13:45:00', 'domicili', 2, 8.50, 1),
    ('2024-04-29 10:00:00', 'domicili', 2, 12.00, 2);

INSERT INTO Empleats (nom, cognoms, nif, telefon, rol, botiga_id)
VALUES
    ('Marc', 'Martínez', '12345678A', '666777888', 'cuiner', 1),
    ('Laura', 'Garcia', '87654321B', '666888777', 'repartidor', 1),
    ('Pau', 'Sánchez', '13579246C', '666999888', 'repartidor', 2),
	('Laia', 'Fernández', '98765432D', '666222333', 'cuiner', 2),
    ('Eric', 'López', '54321678E', '666333444', 'repartidor', 3),
    ('Marta', 'Vidal', '24680135F', '666444555', 'repartidor', 4),
    ('Jordi', 'Roca', '13579246G', '666555666', 'cuiner', 5);

INSERT INTO Comanda_Productes (comanda_id, producte_id, quantitat)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (2, 4, 2),
    (3, 5, 1),
    (4, 2, 1),
    (4, 5, 1),
	(5, 1, 1),
    (5, 3, 1),
    (6, 2, 1),
    (7, 4, 1),
    (7, 5, 2),
    (8, 3, 1),
    (8, 4, 1),
    (9, 1, 2),
    (9, 2, 1);
    
INSERT INTO Lliuraments (comanda_id, empleat_id, data_hora)
VALUES
    (1, 1, '2024-04-24 10:30:00'), -- Marc
    (2, 1, '2024-04-24 11:30:00'), -- Marc
    (3, 3, '2024-04-24 12:30:00'), -- Pau
    (4, 4, '2024-04-24 13:30:00'), -- Laia
    (5, 5, '2024-04-25 11:00:00'), -- Eric
    (6, 6, '2024-04-25 13:00:00'), -- Marta
    (7, 6, '2024-04-26 11:30:00'), -- Marta
    (8, 1, '2024-04-26 14:00:00'), -- Marc
    (9, 2, '2024-04-27 14:30:00'), -- Laura
    (10, 3, '2024-04-27 15:30:00'), -- Pau
    (11, 3, '2024-04-28 13:00:00'), -- Pau
    (12, 5, '2024-04-28 14:00:00'), -- Eric
    (13, 6, '2024-04-29 11:00:00'); -- Marta

SELECT COUNT(cp.comanda_id) AS total_begudes_vendudes FROM Comanda_Productes cp JOIN Comandes c ON cp.comanda_id = c.comanda_id JOIN Productes p ON cp.producte_id = p.producte_id JOIN Clients cl ON c.client_id = cl.client_id WHERE p.nom IN ('Fanta')  AND cl.localitat = 'Barcelona';

SELECT COUNT(*) AS num_comandes FROM Comandes c JOIN Lliuraments l ON c.comanda_id = l.comanda_id JOIN Empleats e ON l.empleat_id = e.empleat_id WHERE e.empleat_id = 5;


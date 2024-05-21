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

CREATE TABLE Comandes (
    comanda_id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    tipus_entrega ENUM('domicili', 'botiga') NOT NULL,
    quantitat_productes INT NOT NULL,
    preu_total DECIMAL(10,2) NOT NULL,
    client_id INT NOT NULL,
    botiga_id INT NOT NULL,
    empleat_id INT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (botiga_id) REFERENCES Botigues(botiga_id),
    FOREIGN KEY (empleat_id) REFERENCES Empleats(empleat_id)
);

CREATE TABLE Productes (
    producte_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    descripcio TEXT,
    imatge_url VARCHAR(255),
    preu DECIMAL(10,2) NOT NULL,
    tipus ENUM('beguda', 'pizza', 'altra') NOT NULL
);

CREATE TABLE Categories (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE Pizza_Categoria (
    producte_id INT,
    categoria_id INT,
    PRIMARY KEY (producte_id, categoria_id),
    FOREIGN KEY (producte_id) REFERENCES Productes(producte_id),
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

INSERT INTO Productes (nom, descripcio, imatge_url, preu, tipus)
VALUES 
    ('Aigua', 'Aigua mineral', 'aigua.jpg', 1.50, 'beguda'),
    ('Coca-Cola', 'Beguda carbonatada', 'coca_cola.jpg', 2.00, 'beguda'),
    ('Fanta', 'Beguda carbonatada', 'fanta.jpg', 2.00, 'beguda'),
    ('Sprite', 'Beguda carbonatada', 'sprite.jpg', 2.00, 'beguda'),
    ('Cervesa', 'Beguda alcohòlica', 'cervesa.jpg', 2.50, 'beguda'),
    ('Margarita', 'Mozzarella, tomàquet i albahaca', 'margarita.jpg', 8.50, 'pizza'),
    ('Quatre Formatges', 'Mozzarella, formatge de cabra, gorgonzola i parmesà', 'quatre_formatges.jpg', 9.50, 'pizza'),
    ('Barbacoa', 'Salsa de barbacoa, pollastre, ceba i bacon', 'barbacoa.jpg', 10.00, 'pizza'),
    ('Vegetariana', 'Verdures variades i mozzarella', 'vegetariana.jpg', 9.00, 'pizza'),
    ('Prosciutto', 'Prosciutto, rúcula i parmesà', 'prosciutto.jpg', 10.50, 'pizza'),
    ('Hawaiana', 'Pinya, pernil dolç, mozzarella i salsa de tomàquet', 'hawaiana.jpg', 10.00, 'pizza'),
    ('Carbonara', 'Salsa de nata, formatge parmesà, ou, bacon i pebre negre', 'carbonara.jpg', 11.50, 'pizza'),
    ('Barcelona', 'Fuet, tomàquet, ceba, mozzarella i salsa de tomàquet', 'barcelona.jpg', 9.50, 'pizza'),
    ('Capricciosa', 'Jamon york, bolets, olives, mozzarella i salsa de tomàquet', 'capricciosa.jpg', 12.00, 'pizza'),
    ('Mediterrània', 'Pebrots, ceba, tomàquet cherry, oli', 'mediterrania.jpg', 10.00, 'pizza');

INSERT INTO Categories (nom) VALUES
    ('Clàssiques'),
    ('Especials'),
    ('Vegetarianes');

INSERT INTO Pizza_Categoria (producte_id, categoria_id) VALUES
    (6, 1), -- Margarita
    (7, 1), -- Quatre Formatges
    (8, 2), -- Barbacoa
    (9, 3), -- Vegetariana
    (10, 2), -- Prosciutto
    (11, 2), -- Hawaiana
    (12, 2), -- Carbonara
    (13, 1), -- Barcelona
    (14, 2), -- Capricciosa
    (15, 3); -- Mediterrània

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

INSERT INTO Empleats (nom, cognoms, nif, telefon, rol, botiga_id)
VALUES
    ('Marc', 'Martínez', '12345678A', '666777888', 'cuiner', 1),
    ('Laura', 'Garcia', '87654321B', '666888777', 'repartidor', 1),
    ('Pau', 'Sánchez', '13579246C', '666999888', 'repartidor', 2),
    ('Laia', 'Fernández', '98765432D', '666222333', 'cuiner', 2),
    ('Eric', 'López', '54321678E', '666333444', 'repartidor', 3),
    ('Marta', 'Vidal', '24680135F', '666444555', 'repartidor', 4),
    ('Jordi', 'Roca', '13579246G', '666555666', 'cuiner', 5);
    
INSERT INTO Comandes (data_hora, tipus_entrega, quantitat_productes, preu_total, client_id, botiga_id, empleat_id)
VALUES
    ('2024-04-24 10:00:00', 'domicili', 3, 6.50, 1, 1, 1),
    ('2024-04-24 11:00:00', 'botiga', 2, 4.00, 2, 2, 6),
    ('2024-04-24 12:00:00', 'domicili', 1, 2.00, 3, 1, 7),
    ('2024-04-24 13:00:00', 'domicili', 2, 5.00, 1, 2, 1),
    ('2024-04-25 10:30:00', 'domicili', 2, 8.00, 2, 6, 5),
    ('2024-04-25 12:45:00', 'botiga', 3, 12.50, 3, 7, 4),
    ('2024-04-26 11:15:00', 'domicili', 1, 4.00, 1, 5, 3),
    ('2024-04-26 13:30:00', 'domicili', 2, 9.00, 2, 2, 6),
    ('2024-04-27 14:00:00', 'domicili', 2, 10.00, 4, 1, 1),
    ('2024-04-27 15:30:00', 'domicili', 1, 5.50, 5, 3, 4),
    ('2024-04-28 12:30:00', 'botiga', 3, 15.00, 6, 4, 5),
    ('2024-04-28 13:45:00', 'domicili', 2, 8.50, 1, 5, 2),
    ('2024-04-29 10:00:00', 'domicili', 2, 12.00, 2, 6, 7);

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

SELECT COUNT(cp.comanda_id) AS total_begudes_venudes FROM Comanda_Productes cp JOIN Comandes c ON cp.comanda_id = c.comanda_id JOIN Productes p ON cp.producte_id = p.producte_id JOIN Clients cl ON c.client_id = cl.client_id WHERE p.nom IN ('Fanta')  AND cl.localitat = 'Barcelona';

SELECT COUNT(*) AS num_comandes FROM Comandes WHERE empleat_id = 1;


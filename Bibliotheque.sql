create database GestionBebliotheque;
use GestionBebliotheque ;
create table Rayon (
Id_rayon int auto_increment primary key ,
libelle varchar(50) not null,
emplacement varchar(200)
);
create table Auteur(
id_Auteur int auto_increment primary key ,
Nom varchar(100) not null,
Prenom varchar(100)
);
create table Lecteur(
idLecteur int auto_increment primary key ,
Nom varchar(100) not null ,
Prenom varchar(100),
Email varchar(100) unique,
Date_Inscription date
);
create table Personnel(
matricule int auto_increment primary key,
Nom varchar(100) not null,
Prenom varchar(100) not null,
Role_Responsable varchar(50) not null,
Email varchar(100) not null unique,
 matricule_responsable int ,
 foreign key (matricule_responsable) references Personel(matricule)

);
create table Ouvrage(
id_ouvrage int auto_increment primary key ,
titre varchar(100) not null,
isbn varchar(50) ,
anneePublication year,
Id_rayon int ,
foreign key (Id_rayon) references Rayon(Id_rayon)
);
create table Ouvrage_Auteur(
id_Auteur int,
id_ouvrage int ,
foreign key (id_ouvrage) references Ouvrage(id_ouvrage),
FOREIGN KEY (id_auteur) REFERENCES Auteur(id_auteur)
);
ALTER TABLE Ouvrage_Auteur 
ADD COLUMN id_auteur_ouvrage INT AUTO_INCREMENT PRIMARY KEY FIRST;
create table Emprunt(
id_emprunt int auto_increment primary key,
date_emprunt DATE NOT NULL,
date_retour_prevue DATE NOT NULL,
date_retour_effective DATE DEFAULT NULL,
id_ouvrage int,
idLecteur int ,
FOREIGN KEY (idLecteur) REFERENCES Lecteur(idLecteur),
FOREIGN KEY (id_ouvrage) REFERENCES Ouvrage(id_ouvrage)

);

-- Utilisation de la base
USE GestionBebliotheque;

--  Insertion dans Rayon
INSERT INTO Rayon (libelle, emplacement) VALUES
('Informatique', 'Étage 1 - Salle A - Rayon gauche'),
('Littérature française', 'Étage 2 - Salle B'),
('Sciences', 'Étage 1 - Salle C'),
('Histoire', 'Étage 2 - Salle A'),
('Bandes dessinées', 'Rez-de-chaussée - Espace jeunesse');

--  Insertion dans Auteur
INSERT INTO Auteur (Nom, Prenom) VALUES
('Hugo', 'Victor'),
('Rowling', 'J.K.'),
('Tolkien', 'J.R.R.'),
('Camus', 'Albert'),
('Christie', 'Agatha'),
('Asimov', 'Isaac');

--  Insertion dans Lecteur
INSERT INTO Lecteur (Nom, Prenom, Email, Date_Inscription) VALUES
('Dupont', 'Marie', 'marie.dupont@univ.fr', '2025-09-15'),
('Martin', 'Lucas', 'lucas.martin@univ.fr', '2025-10-02'),
('Bernard', 'Emma', 'emma.bernard@univ.fr', '2025-08-20'),
('Petit', 'Thomas', 'thomas.petit@univ.fr', '2025-11-10');

-- Insertion dans Personnel
INSERT INTO Personnel (Nom, Prenom, Role_Responsable, Email, matricule_responsable) VALUES
('Durand', 'Sophie', 'Directrice', 'sophie.durand@bibliotheque.univ.fr', NULL),        
('Leroy', 'Paul', 'Bibliothécaire senior', 'paul.leroy@bibliotheque.univ.fr', 1),     
('Moreau', 'Julie', 'Bibliothécaire', 'julie.moreau@bibliotheque.univ.fr', 2),         
('Garcia', 'Antoine', 'Assistant', 'antoine.garcia@bibliotheque.univ.fr', 2); 

ALTER TABLE Ouvrage 
MODIFY anneePublication DATE NULL;  
 INSERT INTO Ouvrage (titre, isbn, anneePublication, Id_rayon) VALUES
('Les Misérables', '978-2070418169', '1862-01-01', 2),                  -- Littérature française
('Harry Potter à l''école des sorciers', '978-2070584628', '1997-06-26', 2),  -- Date précise connue
('Le Seigneur des anneaux', '978-2267016222', '1954-07-29', 2),         -- Tome 1 publié le 29 juillet 1954
('Fondation', '978-2070360529', '1951-01-01', 1),                       -- Science-fiction
('L''Étranger', '978-2070360024', '1942-01-01', 2),
('Le Crime de l''Orient-Express', '978-2253000068', '1934-01-01', 2),
('Dune', '978-2221241028', '1965-01-01', 3);                            -- Sciences                   

--  Insertion dans Ouvrage_Auteur 
INSERT INTO Ouvrage_Auteur (id_ouvrage, id_Auteur) VALUES
(1, 1),  -- Les Misérables → Victor Hugo
(2, 2),  -- Harry Potter → J.K. Rowling
(3, 3),  -- Le Seigneur des anneaux → J.R.R. Tolkien
(4, 6),  -- Fondation → Isaac Asimov
(5, 4),  -- L'Étranger → Albert Camus
(6, 5),  -- Le Crime de l'Orient-Express → Agatha Christie
(7, 6);  
--  Insertion dans Emprunt 
INSERT INTO Emprunt (date_emprunt, date_retour_prevue, date_retour_effective, id_ouvrage, idLecteur) VALUES
-- Emprunts en cours
('2025-12-10', '2026-01-10', NULL, 2, 1),  
('2025-12-15', '2026-01-15', NULL, 4, 2),  
('2025-12-20', '2026-01-20', NULL, 1, 3);  

SELECT * FROM Rayon;
SELECT * FROM Auteur;
SELECT * FROM Lecteur;
SELECT * FROM Personnel;
SELECT * FROM Ouvrage;
SELECT * FROM Ouvrage_Auteur;
SELECT * FROM Emprunt;


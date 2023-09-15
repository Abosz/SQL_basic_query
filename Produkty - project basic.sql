DROP TABLE IF EXISTS Produkty;

-- Tworzenie tabeli

CREATE TABLE Produkty (
  Lp INTEGER Primary key,
  Produkt VARCHAR (200) NOT NULL,
  Ilość INTEGER NOT NULL,
  Cena INTEGER NOT NULL,
  Data_zakupu Date
  );
 
 -- Dodawanie rekordów do tabeli
 
 INSERT INTO Produkty (Lp, Produkt, Ilość, Cena) VALUES 
 (1, "Apple", 1, 5),
 (NULL, "Peer", 1, 8),
 (NULL, "Orange", 1, 10),
 (NULL, "Clementines", 1, 10),
 (NULL, "Corn", 1, 12),
 (NULL, "Tomato", 1, 4),
 (NULL, "Onion", 1, 4),
 (NULL, "Cucumber", 1, 7),
 (NULL, "Red onion", 1, 6),
 (NULL, "Red pepper", 1, 10),
 (NULL, "Yellow pepper", 1, 8),
 (NULL, "Green pepper", 1, 7),
 (NULL, "Chicken breast", 1, 14),
 (NULL, "Chicken drumsticks", 1, 13),
 (NULL, "Beef", 1, 20),
 (NULL, "Potato", 1, 4),
 (NULL, "Parsley", 1, 2);

-- Weryfikacja, czy dodano wszystkie rekordy

SELECT * FROM Produkty;

-- Sprawdzenie produktu z maksymalną ceną i 5 pierwszych najdroższych

SELECT Produkt, MAX(Cena) 
FROM Produkty;

SELECT * 
FROM Produkty 
ORDER BY Cena DESC 
LIMIT 5;

-- Sprawdzenie produktu z najmniejszą ceną i 5 pierwszych najtaańszych

SELECT Produkt, MIN(Cena) 
FROM Produkty;

SELECT * 
FROM Produkty 
ORDER BY Cena ASC 
LIMIT 5;

-- Usunięcie kolumny Data_zakupu

ALTER TABLE Produkty DROP COLUMN Data_zakupu;
 
-- Dodanie kolumny Jednostka

ALTER TABLE Produkty ADD COLUMN Jednostka VARCHAR(100);

-- Dodanie rekordów do kolumny Jednostka z wykluczeniem produktu Parsley
UPDATE Produkty 
SET Jednostka = "kg" 
WHERE NOT Produkt = "Parsley";

-- Dodanie kolejnych rekordów

INSERT INTO Produkty VALUES 
(NULL, "Garlic", 1, 3, "for piece"),
(NULL, "Sweet potato", 1, 8, "box"),
(NULL, "Parsley", 1, 2, "per piece");

-- Dodanie kolumny Data_zakupu

ALTER TABLE Produkty ADD COLUMN Data_zakupu DATE;

-- Uzupełnienie daty zakupu produktów

UPDATE Produkty SET Data_zakupu = "2023.09.11" 
--WHERE Produkt = "Apple",
--WHERE Produkt = "Clementines";
--WHERE Produkt = "Onion";
--WHERE Produkt = "Red pepper";
--WHERE Produkt = "Chicken breast";
--WHERE Produkt = "Beef";
WHERE Produkt = "Sweet potato";

UPDATE Produkty SET Data_zakupu = "2023.09.09" 
--WHERE Produkt = "Peer";
--WHERE Produkt = "Corn";
--WHERE Produkt = "Cucumber";
--WHERE Produkt = "Yellow pepper";
--WHERE Produkt = "Garlic";
WHERE Produkt = "Parsley";

UPDATE Produkty SET Data_zakupu = "2023.09.07"
WHERE Data_zakupu IS NULL;

-- Poprawa kilku rekordów o poprawne jednostki zakupu i instrukcji LIKE

UPDATE Produkty 
SET Jednostka = "per piece" 
WHERE Produkt = "Corn";

UPDATE Produkty 
SET Jednostka = "per piece" 
WHERE Jednostka LIKE "for%";

-- Dodanie kolumny Zakupiono_sztuk

ALTER TABLE Produkty ADD COLUMN Zakupiono_sztuk INTEGER;

SELECT * FROM Produkty;

-- Update dnia 2023.09.11
UPDATE Produkty SET Zakupiono_sztuk = 2 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Apple";
UPDATE Produkty SET Zakupiono_sztuk = 3 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Onion";
UPDATE Produkty SET Zakupiono_sztuk = 1 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Red pepper";
UPDATE Produkty SET Zakupiono_sztuk = 1.5 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Chicken breast";
UPDATE Produkty SET Zakupiono_sztuk = 0.5 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Beef";
UPDATE Produkty SET Zakupiono_sztuk = 2 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Apple";
UPDATE Produkty SET Zakupiono_sztuk = 3 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Sweet potato";
UPDATE Produkty SET Zakupiono_sztuk = 4 WHERE Data_zakupu = "2023.09.11" AND Produkt = "Clementines";

-- Update dnia 2023.09.09
UPDATE Produkty SET Zakupiono_sztuk = 2 WHERE Data_zakupu = "2023.09.09" AND Produkt = "Peer";
UPDATE Produkty SET Zakupiono_sztuk = 5 WHERE Data_zakupu = "2023.09.09" AND Produkt = "Corn";
UPDATE Produkty SET Zakupiono_sztuk = 3 WHERE Data_zakupu = "2023.09.09" AND Produkt = "Cucumber";
UPDATE Produkty SET Zakupiono_sztuk = 5 WHERE Data_zakupu = "2023.09.09" AND Produkt = "Yellow pepper";
UPDATE Produkty SET Zakupiono_sztuk = 2 WHERE Data_zakupu = "2023.09.09" AND Produkt = "Garlic";
UPDATE Produkty SET Zakupiono_sztuk = 3 WHERE Data_zakupu = "2023.09.09" AND Produkt = "Parsley";

-- Update dnia 2023.09.07
UPDATE Produkty SET Zakupiono_sztuk = 5 WHERE Data_zakupu = "2023.09.07" AND Produkt = "Orange";
UPDATE Produkty SET Zakupiono_sztuk = 5 WHERE Data_zakupu = "2023.09.07" AND Produkt = "Tomato";
UPDATE Produkty SET Zakupiono_sztuk = 4 WHERE Data_zakupu = "2023.09.07" AND Produkt = "Red onion";
UPDATE Produkty SET Zakupiono_sztuk = 2 WHERE Data_zakupu = "2023.09.07" AND Produkt = "Orange";
UPDATE Produkty SET Zakupiono_sztuk = 3 WHERE Data_zakupu = "2023.09.07" AND Produkt = "Green pepper";
UPDATE Produkty SET Zakupiono_sztuk = 1.5 WHERE Data_zakupu = "2023.09.07" AND Produkt = "Chicken drumsticks";
UPDATE Produkty SET Zakupiono_sztuk = 6 WHERE Data_zakupu = "2023.09.07" AND Produkt = "Potato";

SELECT * FROM Produkty;

-- Weryfikacja, ile kosztował zakup każdego z produktów, z wykorzystaniem mnożenia
SELECT Produkt, (Cena * Zakupiono_sztuk) AS Kwota_zakupu, Zakupiono_sztuk
FROM Produkty

-- Ile wydano danego dnia?
SELECT Data_zakupu, SUM(Cena*Zakupiono_sztuk) AS Wydana_kwota
FROM Produkty
GROUP BY Data_zakupu
ORDER BY Data_zakupu ASC

SELECT * FROM Produkty;
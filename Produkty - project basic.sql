DROP TABLE IF EXISTS Products;

-- Creating table

CREATE TABLE Products (
  Lp INTEGER Primary key,
  Product VARCHAR (200) NOT NULL,
  Quantity INTEGER NOT NULL,
  Price INTEGER NOT NULL,
  Date_of_purchase Date
  );
 
 -- Adding values to table
 
 INSERT INTO Products (Lp, Product, Quantity, Price) VALUES 
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

-- Verifying if we have all the records

SELECT * FROM Products;

-- Product verification with maximum price and top five most expensive products

SELECT Product, MAX(Price) 
FROM Products;

SELECT * 
FROM Products 
ORDER BY Price DESC 
LIMIT 5;

-- Checking the product with the lowest price and the first five cheapest

SELECT Product, MIN(Price) 
FROM Products;

SELECT * 
FROM Products 
ORDER BY Price ASC 
LIMIT 5;

-- Deleting the Date_of_purchase column

ALTER TABLE Products DROP COLUMN Date_of_purchase;
 
-- Adding Unit column

ALTER TABLE Products ADD COLUMN Unit VARCHAR(100);

-- Adding records to the Unit column excluding Parsley
UPDATE Products 
SET Unit = "kg" 
WHERE NOT Produkt = "Parsley";

-- Adding another records

INSERT INTO Products VALUES 
(NULL, "Garlic", 1, 3, "for piece"),
(NULL, "Sweet potato", 1, 8, "box"),
(NULL, "Parsley", 1, 2, "per piece");

-- Adding Date_of_purchase column

ALTER TABLE Products ADD COLUMN Date_of_purchase DATE;

-- Adding the date of purchase of products

UPDATE Products SET Date_of_purchase = "2023.09.11" 
--WHERE Produkt = "Apple",
--WHERE Produkt = "Clementines";
--WHERE Produkt = "Onion";
--WHERE Produkt = "Red pepper";
--WHERE Produkt = "Chicken breast";
--WHERE Produkt = "Beef";
WHERE Product = "Sweet potato";

UPDATE Products SET Date_of_purchase = "2023.09.09" 
--WHERE Produkt = "Peer";
--WHERE Produkt = "Corn";
--WHERE Produkt = "Cucumber";
--WHERE Produkt = "Yellow pepper";
--WHERE Produkt = "Garlic";
WHERE Product = "Parsley";

UPDATE Products SET Date_of_purchase = "2023.09.07"
WHERE Date_of_purchase IS NULL;

-- Corrected several records with correct purchase units and LIKE statements

UPDATE Products 
SET Unit = "per piece" 
WHERE Product = "Corn";

UPDATE Products 
SET Unit = "per piece" 
WHERE Unit LIKE "for%";

-- Adding Pieces_purchased column

ALTER TABLE Products ADD COLUMN Pieces_purchased INTEGER;

SELECT * FROM Products;

-- Update day of 2023.09.11
UPDATE Products SET Pieces_purchased = 2 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Apple";
UPDATE Products SET Pieces_purchased = 3 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Onion";
UPDATE Products SET Pieces_purchased = 1 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Red pepper";
UPDATE Products SET Pieces_purchased = 1.5 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Chicken breast";
UPDATE Products SET Pieces_purchased = 0.5 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Beef";
UPDATE Products SET Pieces_purchased = 2 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Apple";
UPDATE Products SET Pieces_purchased = 3 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Sweet potato";
UPDATE Products SET Pieces_purchased = 4 WHERE Date_of_purchase = "2023.09.11" AND Produkt = "Clementines";

-- Update day of 2023.09.09
UPDATE Products SET Pieces_purchased = 2 WHERE Date_of_purchase = "2023.09.09" AND Produkt = "Peer";
UPDATE Products SET Pieces_purchased = 5 WHERE Date_of_purchase = "2023.09.09" AND Produkt = "Corn";
UPDATE Products SET Pieces_purchased = 3 WHERE Date_of_purchase = "2023.09.09" AND Produkt = "Cucumber";
UPDATE Products SET Pieces_purchased = 5 WHERE Date_of_purchase = "2023.09.09" AND Produkt = "Yellow pepper";
UPDATE Products SET Pieces_purchased = 2 WHERE Date_of_purchase = "2023.09.09" AND Produkt = "Garlic";
UPDATE Products SET Pieces_purchased = 3 WHERE Date_of_purchase = "2023.09.09" AND Produkt = "Parsley";

-- Update day of 2023.09.07
UPDATE Products SET Pieces_purchased = 5 WHERE Date_of_purchase = "2023.09.07" AND Produkt = "Orange";
UPDATE Products SET Pieces_purchased = 5 WHERE Date_of_purchase = "2023.09.07" AND Produkt = "Tomato";
UPDATE Products SET Pieces_purchased = 4 WHERE Date_of_purchase = "2023.09.07" AND Produkt = "Red onion";
UPDATE Products SET Pieces_purchased = 2 WHERE Date_of_purchase = "2023.09.07" AND Produkt = "Orange";
UPDATE Products SET Pieces_purchased = 3 WHERE Date_of_purchase = "2023.09.07" AND Produkt = "Green pepper";
UPDATE Products SET Pieces_purchased = 1.5 WHERE Date_of_purchase = "2023.09.07" AND Produkt = "Chicken drumsticks";
UPDATE Products SET Pieces_purchased = 6 WHERE Date_of_purchase = "2023.09.07" AND Produkt = "Potato";

SELECT * FROM Products;

-- WVerification of how much the purchase of each product cost using multiplication
SELECT Product, (Price * Pieces_purchased) AS Purchase_amount, Pieces_purchased
FROM Products

-- How much was spent that day?
SELECT Date_of_purchase, SUM(Price*Pieces_purchased) AS Amount_spend
FROM Products
GROUP BY Date_of_purchase
ORDER BY Date_of_purchase ASC

SELECT * FROM Products;

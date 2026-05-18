USE project;

 -- WAQTD top 5 highest sales transactions details.
SELECT *
FROM dataset
ORDER BY Sales DESC
LIMIT 5;

-- WAQTD details where sales is greater than average sales.
SELECT *
FROM dataset
WHERE Sales>(SELECT AVG(Sales)
             FROM dataset);
             
-- WAQTD top 5 cities with highest total sales where region is 'East'.
SELECT City, SUM(Sales) AS "Total Sales"
FROM dataset
WHERE Region = "East"
GROUP BY City
ORDER BY SUM(Sales) DESC
LIMIT 5;

-- WAQTD the city and total sales for cities starting with 'N' where the total sales is greater than the average sales of the dataset, and display only 5 records.
 SELECT City,SUM(Sales) as "Total Sales" 
FROM dataset
WHERE City LIKE "N%"
GROUP BY City
HAVING SUM(Sales)>(SELECT AVG(Sales)
				  FROM dataset)
LIMIT 5;

 -- WAQTD total sales and total profit for each region.
SELECT SUM(Sales) "Total Sales" ,SUM(Profit) "Total Profit"
FROM dataset
GROUP BY Region;

 -- WAQTD details of lowest 10 profit records where profit is negative.
SELECT *
FROM dataset
WHERE Profit<0
ORDER BY Profit ASC
LIMIT 10;

-- WAQTD the value of second highest Profit from the data
SELECT MAX(Profit) as "Second highest Profit"
FROM dataset
WHERE Profit<(SELECT MAX(Profit)
			  FROM dataset);
              
-- WAQTD average sales for each category where average sales > 200.
SELECT Category, AVG(Sales)
FROM dataset
GROUP BY Category
HAVING AVG(Sales)>200; 

-- WAQTD number of orders per city where count of no. of orders is greater than 10.
SELECT City,COUNT(*)
FROM dataset
GROUP BY City
HAVING COUNT(*)>10;

-- WAQTD details whose City name contains 2 o's in it and whose sales is above average.
SELECT *
FROM dataset
WHERE City LIKE "%o%o%" AND Sales>(SELECT AVG(Sales)
								   FROM dataset);
                                   
-- WAQTD Segment, city, and sales where sales > 500, region is 'West', and city starts with 'S'.
SELECT Segment, City, Sales
FROM dataset
WHERE Sales>500 AND Region="West" AND City like "S%";

-- WAQTD orders where ship mode is 'Second Class', quantity is between 3 and 5, and profit is positive.
SELECT dataset.*
FROM dataset
WHERE Ship_mode="Second Class" AND Quantity BETWEEN 3 AND 5 
AND Profit>0;

-- WAQTD top 5 cities where City's names length > 6 with highest sales.
SELECT City, MAX(Sales) AS "Highest Sale"
FROM dataset
WHERE LENGTH(City) > 6
GROUP BY City
ORDER BY MAX(Sales) DESC
LIMIT 5;

-- WAQTD 3 records with lowest sales where category is 'Furniture'.
SELECT *
FROM dataset
WHERE Category="Furniture"
ORDER BY Sales ASC
LIMIT 3; 

-- Find details where sales > ALL sales of 'Office Supplies'.
SELECT *
FROM dataset
WHERE Sales>ALL(SELECT Sales
				FROM dataset
				WHERE Category="Office Supplies");
                
 -- WAQTD top 5 orders where sales is greater than ALL sales of Furniture category.
SELECT *
FROM dataset 
WHERE Sales > ALL(SELECT Sales
				  FROM dataset
				  WHERE Category="Furniture");









                                   






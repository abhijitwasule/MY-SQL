CREATE DATABASE amazon;

USE amazon;


SELECT * FROM amazon;

#1) Total order
SELECT COUNT(*) AS total_order 
from amazon;

#2) unique customer
SELECT COUNT(DISTINCT CustomerID) AS
unique_customer
from amazon;

#3)unique product
SELECT COUNT(DISTINCT ProductID ) AS
unique_product
from amazon;

#4) unique category
SELECT COUNT(DISTINCT Category ) AS
unique_category
from amazon;

#5) unique brands
SELECT COUNT(DISTINCT Brand) AS
unique_brand
from amazon;

#6)unique seller
SELECT COUNT(DISTINCT SellerID) AS
unique_seller
from amazon;

#7) DIFFERENT payment method
SELECT DISTINCT PaymentMethod
from amazon;

#8) different order status
SELECT DISTINCT OrderStatus
from amazon;

#9) how many city represented dataset
SELECT COUNT(DISTINCT City) AS
cities 
FROM amazon;

#10) STATES
SELECT COUNT(DISTINCT State) AS
STATE
FROM amazon;

#11)total sales
SELECT ROUND(SUM(TotalAmount),2) AS
 total_sale
from amazon;

#12) AVG values
SELECT ROUND(AVG(TotalAmount),2) AS 
avg_order_value
from amazon;

#13) MIN ORDER AMOUNT
SELECT MIN(TotalAmount) AS 
min_order_amount
from amazon;

#14) MAX 
SELECT MAX(TotalAmount) AS
max_order_amount
from amazon;

#15)total quantity product sold
SELECT SUM(Quantity) AS
TOTAL_QUANTITY
from amazon;

#16) total discount
SELECT ROUND(SUM(Discount),3) AS
total_discount 
from amazon;

#17) AVG quantity
SELECT ROUND(AVG(Quantity),2) AS
avg_quantity
from amazon;

#18) AVG DISCOUNT
SELECT ROUND(AVG(Discount),2) AS
avg_discount
from amazon;

#19) total tax
SELECT ROUND(SUM(Tax),2) AS
total_tax
from amazon;

#20) TOTAL SHIPPING
SELECT ROUND(SUM(ShippingCost),2)
total_shipping
from amazon;

#21)How many order each product
SELECT ProductID,COUNT(DISTINCT OrderID) AS
TOTAL_ORDER 
from amazon
GROUP BY ProductID;

#22) TOTAL quantity each product
SELECT ProductID,SUM(Quantity) AS
TOTAL_QUANTITY
from amazon
GROUP BY ProductID;

#23)Total sale each product
SELECT ProductID,ROUND(SUM(TotalAmount),2) AS
TOTAL_SALE
FROM amazon
GROUP BY ProductID;

#24)Which product highest total sale
SELECT ProductID,MAX(TotalAmount) AS 
High_total_sale
from amazon
GROUP BY ProductID
ORDER BY High_total_sale DESC
LIMIT 1;

#25) High quality sold
SELECT ProductID,MAX(Quantity) AS
High_quantity_sold
from amazon
GROUP BY ProductID
ORDER BY High_quantity_sold DESC
LIMIT 1;


#26)AVG unit price for each product
SELECT ProductID,ROUND(AVG(UnitPrice),2) AS
Avg_unit_price
from amazon
GROUP BY ProductID;

#27)which products have highest avg.discount
SELECT ProductID,ROUND(AVG(Discount),2) AS
AVG_DISCOUNT
FROM amazon
GROUP BY ProductID
ORDER BY AVG_DISCOUNT DESC;

#28)High total discount
SELECT ProductName,ROUND(SUM(Discount),2)
TOTAL_DISCOUNT
FROM amazon
GROUP BY ProductName;

#29) How many different prd.awailable each category
SELECT Category,COUNT(DISTINCT(ProductID)) AS
Product_count
from amazon
GROUP BY Category;

#30) selling price for each category
SELECT Category,ROUND(AVG(UnitPrice),2) AS
AVG_SELLING_PRICE
FROM amazon
GROUP BY Category;

#31) total sale of each category
SELECT Category,ROUND(SUM(TotalAmount),2) AS
total_sale
from amazon
GROUP BY Category;

#32) TOTAL QUQNTITY SOLD EACH CATEGORY
SELECT category,ROUND(SUM(Quantity),2) AS
TOTAL_QUANTITY
from amazon
GROUP BY Category;

#33)high sale in category
SELECT Category,ROUND(MAX(TotalAmount),2) AS 
total_sale
from amazon
GROUP BY Category
ORDER BY total_sale DESC
LIMIT 1;

#34) HIGH Quantity sold
SELECT Category,ROUND(SUM(Quantity),2) AS
quantity_sold
from amazon
GROUP BY Category
ORDER BY quantity_sold;
LIMIT 1;

#35)AVG. order for each category
SELECT Category,ROUND(AVG(TotalAmount),2) AS
Avg_order_value
from amazon
GROUP BY Category;

#36) Total discount each category
SELECT Category,ROUND(SUM(Discount),2) AS
toal_discount
from amazon
GROUP BY Category;

#37) total sale each brand
SELECT Brand,ROUND(SUM(TotalAmount),2) AS
total_sale
from amazon
GROUP BY Brand;

#38) WHICH BRAND HIGH SALE
SELECT Brand,ROUND(SUM(TotalAmount),2)
Total_sale
from amazon
GROUP BY Brand
ORDER BY Total_sale DESC;


#39)total quantity sold each brand
SELECT Brand,ROUND(SUM(Quantity),2) AS
total_quantity
from amazon
GROUP BY Brand
ORDER BY total_quantity;

#40) how many product awailable each brand
SELECT Brand,COUNT(DISTINCT(ProductName)) AS 
total_product
from amazon
GROUP BY Brand;

#41) how many oeder each customer placed
SELECT CustomerName,COUNT(DISTINCT(OrderID)) AS
total_order
from amazon
GROUP BY CustomerName;

#42) total amount spent by customer
SELECT CustomerID,ROUND(SUM(TotalAmount),2) AS
total_spent
from amazon
GROUP BY CustomerID;

#44) avg.order value each customer
SELECT CustomerID,ROUND(AVG(TotalAmount),2) AS
avg_order_value
from amazon
GROUP BY CustomerID;

#45)Total amount of eachh city
SELECT City,ROUND(SUM(TotalAmount),2) AS
Total_sale
from amazon
GROUP BY City;

#46) WICH CITY GGENERATE HHIGH SALE
SELECT City,ROUND(SUM(TotalAmount),2) AS 
Total_sale
from amazon
GROUP BY City
ORDER BY Total_sale DESC;

#47)Total amount for each state
SELECT State,ROUND(SUM(TotalAmount),2) AS
total_sale
from amazon
GROUP BY State;

#48) HIGH SALE
SELECT State,ROUND(SUM(TotalAmount),2)
total_sale
from amazon
GROUP BY State
ORDER BY total_sale DESC;

#49) Total sale each payment mode
SELECT PaymentMethod,ROUND(SUM(TotalAmount),2) AS 
total_sale
from amazon
GROUP BY PaymentMethod;

#50) Distribution of order across different order staus
SELECT OrderStatus,COUNT(DISTINCT OrderID) AS 
total_order
from amazon
GROUP BY OrderStatus
ORDER BY total_order DESC;



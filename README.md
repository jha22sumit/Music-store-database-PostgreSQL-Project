



# 🎵 Music Store SQL Analysis project

[![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)](https://www.mysql.com/)
[![Project Status](https://img.shields.io/badge/Status-Completed-brightgreen.svg)]()
[![Data Source](https://img.shields.io/badge/Data-Sample%20DB-orange.svg)]()

This project explores a sample Music Store database using SQL. It answers a variety of business questions ranging from basic queries to complex CTEs and aggregations.

---

## 📁 Project Structure

- **Dataset**: Includes tables such as `employee`, `invoice`, `customer`, `track`, `artist`, `album`, `genre`, `invoice_line`
- **Tools Used**: SQL (MySQL/PostgreSQL compatible)/POWERBI
- **Skills Demonstrated**: 
  - Joins
  - Aggregations
  - CTEs (Common Table Expressions)
  - Window Functions
  - Filtering & Grouping

----

## 🗺️ ER Diagram

Below is the Entity Relationship Diagram representing the schema of the music store database:

![ER Diagram](https://github.com/jha22sumit/Music-store-database-PostgreSQL-Project/blob/cb410d4d40684bb3fccd9cd1d6146441613c41d6/music_store_er_diagram.png)  


---

## 🔍 Key Insights and Queries

### 🟢 Basic Questions

- **Senior-most Employee**: Finds the highest-ranking employee by job level.
- **Top Invoice Country**: Identifies the country with the most invoice records.
- **Top 3 Invoice Amounts**: Lists the three highest invoice totals.
- **Top Earning City**: Shows the city with the highest revenue—ideal for promotions/festivals.
- **Best Customer**: Determines the customer who has spent the most.

### 🟡 Moderate Questions

- **Rock Music Listeners**: Lists names and emails of customers who listen to Rock music, sorted by email.
- **Top Rock Artists**: Shows top 10 artists with the most Rock songs in the catalog.
- **Songs Above Average Length**: Lists tracks longer than the average duration in milliseconds.

### 🔴 Advanced Questions (CTE / Recursive CTE)

- **Customer Spend on Best-Selling Artist**: For the top-selling artist, this shows how much each customer spent.
- **Top Genre by Country**: For every country, determines the most purchased genre (with tie handling using window functions).
- **Top Customer per Country**: Identifies the top spender per country (includes ties).

---

## ⭐ Project Highlights

- Used **multi-table JOINs** for comprehensive data insights.
- Applied **CTEs and window functions** for advanced segmentation.
- Divided logic into three levels: **Basic**, **Moderate**, and **Advanced**.
- Ensured queries produce **clear and business-relevant results**.

##📸 Dashboard Snapshots:

![Dashboard 1](https://github.com/jha22sumit/Music-store-database-PostgreSQL-Project/blob/0a7829758910290b0528010ac5263211a1c647d9/Dashboard%201.png)  
![Dashboard 2](https://github.com/jha22sumit/Music-store-database-PostgreSQL-Project/blob/c6d47fb3b5a9a4b10481b4bb3890c9d3d84aa12d/Dashboard%202.png)

---

## 📥 How to Use

1. Clone this repository  
2. Import the SQL file into a local PostgreSQL/MySQL environment  
3. Run queries incrementally to validate results  
4. Open the `.pbix` file in Power BI Desktop to explore interactive visuals  
5. Use filters to explore results by genre, country, and customer





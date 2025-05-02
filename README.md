# Music-store-database-PostgreSQL-Project
# 🎵 SQL Project: Music Store Database Analysis

This project uses SQL to perform insightful data analysis on a fictional **Music Store database**, covering customer behavior, sales performance, and business metrics using raw SQL queries.

---

## 📂 Project Overview

- **Language Used**: SQL (Structured Query Language)
- **Database**: Music Store (with tables like `employee`, `invoice`, `customer`, `track`, `genre`, etc.)
- **Tool**: MySQL or any SQL-compatible interface (e.g., PostgreSQL, SQLite)
- **Objective**: Answer business questions using SQL queries to derive actionable insights from sales and customer data.

---

## 📌 Key Business Questions Answered

- 👤 Who is the **senior-most employee** based on job title?
- 🌍 Which **country** has generated the most invoices?
- 💰 What are the **top 3 highest invoice values**?
- 🏙️ Which **city** has the **best customers** in terms of revenue?
- 🏆 Who is the **best customer** based on total money spent?

---

## 🔍 Intermediate to Advanced Queries Included

- 🎸 What is the most popular **music genre**?
- 🛍️ Which **sales agent** has made the most sales?
- 📊 In which **months** do we generate the highest revenue?
- 📍 What are the **top cities** by number of customers?
- ⌛ What is the average time between invoice purchases per customer?

---

## 🧾 SQL Concepts Demonstrated

- `JOIN` operations across multiple tables
- Use of `GROUP BY`, `ORDER BY`, and `LIMIT`
- Subqueries and aggregation (`SUM`, `COUNT`, `MAX`)
- Data transformation with `CONCAT`, `DATE`, and aliases
- Analytical thinking in framing real-world business questions

---

## 🚀 How to Use

1. Clone the repository or download the `.sql` file.
2. Set up a SQL environment using:
   - MySQL Workbench
   - PostgreSQL
   - SQLite
3. Load the music store database schema and data.
4. Run the provided SQL queries section by section to explore insights.

---

## 📁 File Structure

- `SQL PROJECT_MUSIC_STORE_DATABASE.sql` – Contains all SQL queries categorized by difficulty and use case.

---

## 📈 Example Output Highlights

> Example insights based on query results:
- "USA has the most invoices with 104 invoices."
- "The best customer is **Frank Harris**, who spent over $50,000."
- "Rock is the most popular genre in terms of track sales."

---

## 🙌 Contributions

Feel free to fork this project, suggest improvements, or add more advanced queries. All contributions are welcome!

---

## 📬 Contact

For any questions or feedback, open an issue or contact me directly.
# 🎵 Music Store SQL Analysis Project

[![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)](https://www.mysql.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Project Status](https://img.shields.io/badge/Status-Completed-brightgreen.svg)]()
[![Data Source](https://img.shields.io/badge/Data-Sample%20DB-orange.svg)]()

This project explores a sample Music Store database using SQL. It answers a variety of business questions ranging from basic queries to complex CTEs and aggregations.

---

## 📁 Project Structure

- **Dataset**: Includes tables such as `employee`, `invoice`, `customer`, `track`, `artist`, `album`, `genre`, `invoice_line`
- **Tools Used**: SQL (MySQL/PostgreSQL compatible)
- **Skills Demonstrated**: 
  - Joins
  - Aggregations
  - CTEs (Common Table Expressions)
  - Window Functions
  - Filtering & Grouping

----

## 🗺️ ER Diagram

Below is the Entity Relationship Diagram representing the schema of the music store database:

![ER Diagram](path/to/your/er-diagram.png)  
*Replace the image path above with the actual path after uploading the ER diagram to your GitHub repo.*

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

---

## 💡 Optional Enhancements

- Add **screenshots** of key query results (suggested: Basic Q4 & Q5, Advanced Q3).
- Include an **ER Diagram** to illustrate table relationships.
- Convert SQL outputs into visual dashboards using Power BI/Tableau.

---

## ▶️ How to Run

- Import the SQL script into your database (MySQL/PostgreSQL).
- Run each section of queries step-by-step.
- Adjust syntax if needed based on SQL dialect.

---

## 👨‍💻 Author

- [Your Name]

## 📄 License

- MIT

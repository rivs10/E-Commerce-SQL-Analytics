# E-Commerce-SQL-Analytics
This project uses SQL to explore an e-commerce dataset and answer
practical questions about sales, customers, products, payments, and
profit. The aim is to turn the data into useful business findings while
practising common SQL techniques.

The analysis is written for PostgreSQL and can also be run through
Supabase with a PostgreSQL database.

What I looked at

Monthly revenue and changes in sales over time

Average order value and overall sales performance

Repeat purchases and customer value

Product and category performance

Revenue, costs, and gross profit

Payment patterns and discounts

Data quality checks before analysing the results

Dataset

The database contains six related tables:

customers

categories

products

orders

order_items

payments

The dataset has approximately 600 customers, 7 categories, 126 products,
3,500 orders, 6,000 order items, and 3,500 payment records.

Results

The current analysis produced the following figures:

Metric                        Result

Completed orders               3,162
Active customers                 597
Units sold                     6,940
Total revenue           $900,428.15
Average order value         $284.77
Gross profit            $280,688.66
Profit margin                 31.17%

A few sales trends

September 2024 had the highest monthly revenue at $48,113.23.

May 2024 had the lowest monthly revenue at $26,576.59.

Revenue rose 33.66% from August to September 2024, the largest
month-over-month increase in the analysis.

October 2024 saw the largest month-over-month drop, at 28.86%.

December 2025 revenue was $45,577.40, up 29.92% from
November.

These figures describe the results in the current analysis. Recheck them
after loading the data and running the SQL scripts.

SQL used

The project practises:

JOINs and aggregate functions

GROUP BY and conditional aggregation

CASE expressions and date functions

Common table expressions (CTEs)

Window functions, including LAG(), RANK(), and DENSE_RANK()

KPI calculations and data-quality checks

Project structure

ecommerce-sql-analytics/
├── README.md
├── data/
│   └── README.md
├── sql/                 # Setup and analysis scripts
└── insights/
    └── business_insights.md

The sql/ folder contains the database setup and analysis scripts. The
insights/ folder summarises findings from the queries.

How to run it

Create a PostgreSQL database, either locally or through Supabase.

Run sql/01_database_setup.sql to create the tables.

Load the dataset into the six tables. Check data/README.md for
dataset and loading notes.

Run the remaining SQL scripts in the sql/ folder.

Compare your query results with the summary above and review
insights/business_insights.md.

Make sure the data is loaded correctly before running the analysis. If
your results differ, check the data, filters, and calculation logic
rather than changing queries just to match the figures.

Notes

This is a SQL analytics project focused on querying relational data and
explaining the results. The findings depend on the dataset and the
assumptions used in the queries.

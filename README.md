# SQL Queries for the Chinook Database

## Description

This project contains a collection of SQL queries developed for the **Chinook** sample database.

The database represents a digital music store and contains information about customers, employees, invoices, tracks, albums, artists, genres, and sales.

The project demonstrates practical SQL skills through real-world business scenarios, including customer analysis, sales reporting, revenue calculations, and music catalog analysis.

---

## Database

The project uses the **Chinook SQLite database**.

The database file is included in this repository:

```
Database/Chinook_Sqlite.sqlite
```

Database source:
https://github.com/lerocha/chinook-database

---

## Technologies

- SQL
- SQLite
- DBeaver

---

## Database Schema

Main tables used in the project:

- **Customer** — customer information
- **Employee** — employee and support representative information
- **Invoice** — purchase invoices
- **InvoiceLine** — purchased tracks and quantities
- **Track** — music track information
- **Album** — album information
- **Artist** — artist information
- **Genre** — music genres
- **MediaType** — track file formats

---

## Query Categories

### 1_Customers

01_Get_full_user_information
02_Get_the_number_of_users

### 2_Sales

03_Get_purchase_history_of_user
04_Analyze_revenue

### 3_Tracks

05_Get_full_track_information
06_Get_tracks_statistics

### 4_Artists

07_Get_artist_information
08_Get_artists_statistics

---

## Features

- Data filtering and searching
- Table joins (`INNER JOIN`, `LEFT JOIN`)
- Aggregation (`COUNT`, `SUM`, `AVG`)
- Window functions (`RANK`)
- Subqueries
- Business metrics calculation
- Sales and revenue analysis

---

## Requirements

- SQLite database (Chinook)
- DBeaver

### Steps

1. Download repository

```bash
git clone https://github.com/username/SQL-Chinook-Analysis.git
```

2. Open **DBeaver**

3. Create a new database connection:

```
New Database Connection → SQLite
```

4. Select the database file:

```
Database/Chinook_Sqlite.sqlite
```

5. Open SQL scripts from the `SQL` folder

6. Execute queries in DBeaver

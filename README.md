# Airbnb Data Engineering Project (dbt + Snowflake)

##  Overview
This project demonstrates a complete end-to-end data engineering pipeline using **dbt and Snowflake**. It follows a modern analytics engineering approach with Bronze, Silver, and Gold layers to transform raw Airbnb data into analytics-ready datasets.

---

## Architecture

###  Bronze Layer
- Raw data ingestion from source systems
- No transformations applied
- Acts as single source of truth

###Silver Layer
- Data cleaning and standardization
- Handles:
  - NULL values
  - Empty strings
  - Data type casting
  - Default value imputation
- Ensures high-quality structured data

### SCD Type 2
- Tracks historical changes in host data
- Maintains full history of updates using snapshot strategy

### Gold Layer
- Star schema design
- Created:
  - Dimension tables (dim_host, dim_listing)
  - Fact table (fact_booking)
- Optimized for analytics and reporting

---

## ⚙️ Tech Stack
- dbt (Data Build Tool)
- Snowflake
- SQL
- GitHub
- Data Modeling (Star Schema)

---

## 📊 Features
- Bronze–Silver–Gold layered architecture
- Data cleaning & validation
- Star schema design
- SCD Type 2 implementation
- Data quality tests using dbt
- Modular and scalable SQL models


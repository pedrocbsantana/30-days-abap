# 30 Days of ABAP

A 30-day hands-on journey focused on strengthening my SAP ABAP development skills through progressive exercises, business-oriented scenarios, and technical documentation.

The goal of this repository is not only to practice ABAP syntax, but to gradually connect programming concepts with scenarios inspired by real SAP environments, especially SAP SD and MM.

Each day introduces new concepts while building a stronger foundation for future topics such as Open SQL, DDIC, ABAP Objects, CDS Views, AMDP, OData, and modern SAP development.

> The business scenarios in this repository are educational simulations created for learning purposes. They do not represent complete SAP standard implementations.

---

## Progress

| Day | Topic | Status |
|---|---|---|
| 01 | ABAP Structure and Syntax | Completed |
| 02 | Variables and Data Types | Completed |
| 03 | Conditions and Loops | Completed |
| 04 | Advanced Internal Tables | Completed |
| 05 | Open SQL and JOINs | Completed |
| 06 | Modularization | Pending |
| 07 | Review + Mini Project | Pending |
| 08 | ABAP Objects: Classes and Objects | Pending |
| 09 | ABAP Objects: Methods, Inheritance & Interfaces | Pending |
| 10 | ABAP Dictionary (DDIC) | Pending |
| 11 | Debugging and ST22 | Pending |
| 12 | Exceptions and Error Handling | Pending |
| 13 | BAPIs and Function Modules | Pending |
| 14 | Review + Mini Project | Pending |
| 15 | RFC and Integrations | Pending |
| 16 | BAdIs and Enhancement Framework | Pending |
| 17 | CDS Views: Fundamentals | Pending |
| 18 | CDS Views: Associations and Queries | Pending |
| 19 | SAP HANA and Code Pushdown | Pending |
| 20 | AMDP | Pending |
| 21 | Review + Mini Project | Pending |
| 22 | OData and REST APIs | Pending |
| 23 | SAP Integration Scenarios | Pending |
| 24 | Clean Core and Extensibility | Pending |
| 25 | SAP S/4HANA Fundamentals | Pending |
| 26 | SD/MM Processes for ABAP Developers | Pending |
| 27 | DEV, QAS, PRD and Transports | Pending |
| 28 | Real Support Ticket Simulation | Pending |
| 29 | Technical Interview Simulation | Pending |
| 30 | Final ABAP Project | Pending |

---

## Day 01 — ABAP Structure and Syntax

Introduction to the basic structure and syntax of an ABAP program.

Topics practiced:

- `REPORT`
- `DATA`
- Basic data types
- `WRITE`
- Operators
- `IF / ELSE`
- Comments
- Basic program structure

---

## Day 02 — Structures and Internal Tables

Introduction to structured data and Internal Tables.

Topics practiced:

- `TYPES`
- Structures
- Internal Tables
- Work areas
- `LOOP AT`
- Reading and processing multiple records

---

## Day 03 — Control Flow and Business Rules

Focused on controlling program execution and translating simple business rules into ABAP.

Topics practiced:

- `IF / ELSEIF / ELSE`
- `AND / OR / NOT`
- `CASE / WHEN`
- `LOOP AT`
- `WHERE`
- `INTO`
- `ASSIGNING FIELD-SYMBOL`
- `DO`
- `WHILE`
- `sy-index`
- String Templates
- `abap_bool`

The practical exercise introduced an educational SD/MM-inspired sales order validation scenario involving stock availability, blocked customers, order value, pending issues, and order status.

[Read the Day 03 documentation](docs/day-03.md)

---

## Day 04 — Advanced Internal Tables

Day 04 focused on choosing and manipulating different Internal Table types based on how the application needs to access its data.

Topics practiced:

- `STANDARD TABLE`
- `SORTED TABLE`
- `HASHED TABLE`
- `UNIQUE KEY`
- `NON-UNIQUE KEY`
- `READ TABLE`
- `APPEND`
- `INSERT`
- `MODIFY`
- `DELETE`
- `SORT`
- Key vs. index access
- `INTO` vs. `ASSIGNING FIELD-SYMBOL`
- `sy-subrc`
- Basic Internal Table performance considerations

The practical exercise introduced an educational SAP MM-inspired inventory scenario using a `HASHED TABLE WITH UNIQUE KEY codigo`.

The program loads materials, searches for a material by its unique code, updates stock through a Field Symbol, detects materials below minimum stock, calculates replenishment requirements, removes a discontinued material, and displays the resulting inventory.

[Read the Day 04 documentation](docs/day-04.md)

---

## Day 05 — Open SQL and JOINs

Day 05 focused on Open SQL, moving from simple queries to JOINs between tables.

Topics practiced:

- `WHERE` and filtering directly in the database
- `COUNT`, `MAX`, `DISTINCT`, `GROUP BY`, and `HAVING`
- `INNER JOIN` and `LEFT OUTER JOIN`
- Conditions in `ON` vs. `WHERE`
- `ORDER BY` and limiting results with `UP TO ... ROWS`
- Selecting only the fields needed by the application
- Range tables and `BETWEEN`

In `zcl_30days_day05`, I practiced queries against `/DMO/AGENCY`: filtering agencies, counting records, finding the highest agency ID, grouping by country, and selecting distinct country codes. I also prepared a country range table; the final query uses `BETWEEN` to filter agency IDs.

The final exercise, `zcl_30days_day05_ex001`, relates `/DMO/BOOKING` and `/DMO/CUSTOMER` with a `LEFT OUTER JOIN`. It keeps bookings even without a matching customer, filters flight prices above 500, sorts prices in descending order, and returns up to 20 rows containing only the selected booking and customer fields.

The main takeaway was to understand where processing should happen and avoid transferring unnecessary data into the ABAP application.

**Day 5 done. 25 to go.**

---

## Repository Structure

```text
30-days-abap/
│
├── README.md
├── docs/
│   ├── day-03.md
│   └── day-04.md
│
└── src/
    └── ABAP source files managed through abapGit
```

The `/src` directory contains ABAP objects serialized and managed by abapGit.

The `/docs` directory contains detailed notes about each study day, including concepts, exercises, business context, and lessons learned.

---

## Learning Approach

This project follows a hands-on learning approach:

1. Understand the concept.
2. Reason about when and why it should be used.
3. Write the ABAP code.
4. Debug mistakes and understand their cause.
5. Apply the concept to a business-oriented scenario.
6. Document the result.

The exercises become progressively more complex as new ABAP and SAP concepts are introduced.

---

## Roadmap

The full 30-day sequence and completion status are listed in [Progress](#progress).

After the language fundamentals and Open SQL, the roadmap moves into modularization, ABAP Objects, DDIC, debugging, and error handling. Later days cover integrations, enhancements, CDS Views, SAP HANA, AMDP, OData, Clean Core, and SAP S/4HANA business context.

Review and mini-project days are planned for Days 7, 14, and 21. The final stretch covers transports, support and interview simulations, and a final ABAP project on Day 30.

The long-term goal is to evolve the exercises into more complete SAP-oriented projects connecting ABAP development with business scenarios involving SAP SD and MM.

---

## Disclaimer

This repository documents my personal learning journey.

The SAP SD/MM scenarios used throughout the project are simplified educational simulations designed to provide business context for ABAP exercises. They should not be interpreted as complete implementations of SAP standard processes.

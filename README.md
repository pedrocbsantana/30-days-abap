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
| 02 | Structures and Internal Tables | Completed |
| 03 | Control Flow and Business Rules | Completed |
| 04 | Advanced Internal Tables | Completed |
| 05 | Coming next | Pending |
| 06 | Coming next | Pending |
| 07 | Coming next | Pending |

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

The project will progressively explore topics such as:

- Advanced Internal Tables
- Open SQL
- ABAP Dictionary (DDIC)
- ABAP Objects
- Exception Handling
- Automated Tests
- SAP HANA concepts
- ABAP CDS
- AMDP / SQLScript
- OData
- RAP
- SAP S/4HANA development concepts

The long-term goal is to evolve the exercises into more complete SAP-oriented projects connecting ABAP development with business scenarios involving SAP SD and MM.

---

## Disclaimer

This repository documents my personal learning journey.

The SAP SD/MM scenarios used throughout the project are simplified educational simulations designed to provide business context for ABAP exercises. They should not be interpreted as complete implementations of SAP standard processes.

# Day 03 — Control Flow & Business Rules

## Overview

On Day 03 of my 30 Days of ABAP journey, I focused on control flow and repetition structures in ABAP.

To practice these concepts in a more realistic context, I developed a simplified business scenario inspired by SAP SD (Sales and Distribution) and MM (Materials Management).

The exercise simulates the validation of a sales order based on customer status, stock availability, order value, and pending processes.

> This is an educational simulation inspired by SD/MM business scenarios and does not represent a complete SAP standard process.

## Business Scenario

A sales order must be evaluated before being approved.

The validation considers:

- Customer blocking status
- Available stock
- Requested quantity
- Order value
- Pending processes

Based on these conditions, the order receives one of the following statuses:

- `A` — Approved
- `P` — Pending
- `R` — Manual Review
- `B` — Blocked

## Business Rules

The following rules were implemented:

1. If the customer is blocked, the order receives status `B`.
2. If there is not enough stock, the order receives status `P`.
3. If stock is available and the order value is below 10,000, the order receives status `A`.
4. Otherwise, the order receives status `R` and requires manual review.

## ABAP Concepts Practiced

- `TYPES` and structures
- `IF / ELSEIF / ELSE`
- Logical conditions
- `CASE / WHEN`
- `DO / ENDDO`
- `WHILE / ENDWHILE`
- `sy-index`
- String Templates
- Packed numbers (`TYPE p`)
- Boolean values with `abap_bool`
- Business rule implementation

## SD/MM Context

The exercise connects two simplified SAP business concepts:

SAP SD represents the sales order and customer-related validation.

SAP MM is represented by the stock availability check before the order can proceed.

This allowed me to practice ABAP syntax while also starting to understand how technical development can support business processes inside SAP.

## What I Learned

Beyond the syntax itself, this exercise helped me understand how the order of conditions affects business rules, how different control structures serve different purposes, and how loops must be designed carefully to avoid infinite execution.

I also practiced organizing business data using an ABAP structure instead of working only with isolated variables.

---

Part of my `30 Days of ABAP` learning journey.

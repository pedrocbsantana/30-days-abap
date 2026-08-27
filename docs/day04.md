# Day 04 — Advanced Internal Tables

## Objective

The goal of Day 04 was to deepen my understanding of ABAP Internal Tables and, more importantly, understand how the choice of table type affects data access and manipulation.

The study covered `STANDARD`, `SORTED`, and `HASHED` tables, different key strategies, data access, modification, deletion, sorting, and basic performance considerations.

The concepts were applied in an educational inventory scenario inspired by SAP MM.

> This exercise is a simplified learning simulation. It does not represent a complete SAP MM standard process.

---

## Internal Table Types

### STANDARD TABLE

A `STANDARD TABLE` is useful when data is mainly processed sequentially or when working with a simple list of records.

It supports index access and can be explicitly reordered using `SORT`.

### SORTED TABLE

A `SORTED TABLE` automatically maintains its records according to its defined key.

It can use:

- `UNIQUE KEY`
- `NON-UNIQUE KEY`

A non-unique key is useful when multiple records can share the same key value.

For example, multiple materials could belong to the same category.

### HASHED TABLE

A `HASHED TABLE` is designed primarily for direct access through a unique key.

Example:

```abap
DATA lt_materiais TYPE HASHED TABLE OF ty_material
                  WITH UNIQUE KEY codigo.
```

This makes it appropriate when the application performs frequent individual lookups using a unique identifier.

Unlike STANDARD and SORTED tables, HASHED tables are not designed for index-based access.

---

## Choosing the Table Type

A useful mental model from this study was:

```text
STANDARD
→ sequential processing
→ simple lists
→ index access

SORTED
→ automatically ordered by key
→ key-based access
→ UNIQUE or NON-UNIQUE keys

HASHED
→ direct key-based access
→ UNIQUE KEY
→ no index access
```

The choice should depend on how the data will be used.

A `HASHED TABLE` is not automatically better than a `STANDARD TABLE` or `SORTED TABLE`.

For a small table containing only a few records, the performance difference may be irrelevant.

For a large table where thousands of individual searches are performed using a unique identifier, the choice of table type becomes much more important.

---

## READ TABLE

`READ TABLE` was used to find an individual record.

Example:

```abap
READ TABLE lt_materiais
  ASSIGNING FIELD-SYMBOL(<fs_material>)
  WITH TABLE KEY codigo = 'MAT002'.
```

After operations such as `READ TABLE`, `sy-subrc` can be checked:

```abap
IF sy-subrc = 0.
  " Record found
ENDIF.
```

A key lesson was to evaluate `sy-subrc` immediately after the operation whose result needs to be checked.

---

## INTO vs. ASSIGNING

One of the most important concepts from Day 04 was understanding the difference between `INTO` and `ASSIGNING`.

### INTO

```abap
READ TABLE lt_materiais
  INTO ls_material
  WITH TABLE KEY codigo = 'MAT002'.
```

`INTO` copies the table row into a structure.

Changing:

```abap
ls_material-estoque += 10.
```

does not automatically modify the original Internal Table.

The modified structure can be written back using `MODIFY`.

```abap
MODIFY TABLE lt_materiais FROM ls_material.
```

### ASSIGNING FIELD-SYMBOL

```abap
READ TABLE lt_materiais
  ASSIGNING FIELD-SYMBOL(<fs_material>)
  WITH TABLE KEY codigo = 'MAT002'.
```

The Field Symbol references the actual row.

Therefore:

```abap
<fs_material>-estoque += 10.
```

directly changes the value stored inside `lt_materiais`.

No additional `MODIFY` is required.

---

## INSERT and APPEND

`APPEND` adds a row to the end of an index table and is commonly associated with sequential population of a `STANDARD TABLE`.

`INSERT` inserts a record according to the characteristics of the Internal Table.

For keyed tables such as SORTED and HASHED tables, `INSERT ... INTO TABLE` can be used.

Example:

```abap
INSERT ls_material INTO TABLE lt_materiais.
```

When a table has a unique key, attempting to insert another record with the same key is not allowed.

---

## MODIFY

When a record is read using `INTO`, changes are made to the copied structure.

For example:

```abap
READ TABLE lt_materiais
  INTO ls_material
  WITH TABLE KEY codigo = 'MAT010'.

IF sy-subrc = 0.
  ls_material-estoque += 10.

  MODIFY TABLE lt_materiais FROM ls_material.
ENDIF.
```

This writes the modified structure back to the Internal Table.

---

## DELETE

Records can also be removed directly using their table key.

Example:

```abap
DELETE TABLE lt_materiais
  WITH TABLE KEY codigo = 'MAT003'.
```

The result can then be checked using `sy-subrc`.

---

## SORT

For a `STANDARD TABLE`, records can be explicitly ordered using `SORT`.

Example:

```abap
SORT lt_materiais BY estoque DESCENDING
                     codigo ASCENDING.
```

This sorts primarily by stock in descending order.

When two materials have the same stock, their code is used as the second sorting criterion in ascending order.

A `SORTED TABLE`, however, already maintains its ordering according to its table key.

---

# Practical Exercise — SAP MM-Inspired Inventory Simulation

The practical exercise simulated a simplified material inventory scenario inspired by SAP MM.

Each material contained:

```text
codigo
descricao
estoque
estoque_minimo
```

The following materials were used:

| Code | Description | Stock | Minimum Stock |
|---|---|---:|---:|
| MAT001 | Monitor 24 | 8 | 5 |
| MAT002 | Teclado | 3 | 5 |
| MAT003 | Mouse | 15 | 10 |
| MAT004 | Headset | 2 | 4 |

Because materials are accessed individually using a unique material code, the exercise used:

```abap
DATA lt_materiais TYPE HASHED TABLE OF ty_material
                  WITH UNIQUE KEY codigo.
```

---

## Loading Materials

The initial inventory was created using the `VALUE` constructor:

```abap
lt_materiais = VALUE #(
  ( codigo = 'MAT001' descricao = 'Monitor 24' estoque = 8  estoque_minimo = 5 )
  ( codigo = 'MAT002' descricao = 'Teclado'    estoque = 3  estoque_minimo = 5 )
  ( codigo = 'MAT003' descricao = 'Mouse'      estoque = 15 estoque_minimo = 10 )
  ( codigo = 'MAT004' descricao = 'Headset'    estoque = 2  estoque_minimo = 4 )
).
```

Each pair of parentheses represents one row of the Internal Table.

---

## Stock Update

The exercise simulated the receipt of 10 additional units of `MAT002`.

The material was found using its unique key:

```abap
READ TABLE lt_materiais
  ASSIGNING FIELD-SYMBOL(<fs_material>)
  WITH TABLE KEY codigo = 'MAT002'.

IF sy-subrc = 0.
  <fs_material>-estoque += 10.
ENDIF.
```

Because a Field Symbol was used, the Internal Table was modified directly.

The stock changed from:

```text
MAT002
3 units → 13 units
```

---

## Replenishment Check

The inventory was then analyzed to identify materials below their minimum stock.

```abap
LOOP AT lt_materiais INTO ls_material.

  IF ls_material-estoque < ls_material-estoque_minimo.

    lv_reposicao =
      ls_material-estoque_minimo - ls_material-estoque.

    out->write(
      |{ ls_material-codigo } - { ls_material-descricao } Precisa repor { lv_reposicao } unidades|
    ).

  ENDIF.

ENDLOOP.
```

The replenishment quantity was calculated as:

```text
minimum stock - current stock
```

For `MAT004`:

```text
Minimum stock = 4
Current stock = 2

4 - 2 = 2 units
```

Therefore, the program identified that the Headset required 2 units of replenishment.

---

## Discontinued Material

`MAT003` was treated as a discontinued material and removed using its key:

```abap
DELETE TABLE lt_materiais
  WITH TABLE KEY codigo = 'MAT003'.
```

---

## Final Inventory

After the stock update and deletion, the final inventory contained:

```text
MAT001 - Monitor 24 - Estoque: 8
MAT002 - Teclado - Estoque: 13
MAT004 - Headset - Estoque: 2
```

---

# Complete Exercise

```abap
CLASS zcl_30days_day04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_30days_day04 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_material,
             codigo         TYPE string,
             descricao      TYPE string,
             estoque        TYPE i,
             estoque_minimo TYPE i,
           END OF ty_material.

    DATA lt_materiais TYPE HASHED TABLE OF ty_material
      WITH UNIQUE KEY codigo.

    DATA lv_reposicao TYPE i.
    DATA ls_material TYPE ty_material.

    lt_materiais = VALUE #(
      ( codigo = 'MAT001' descricao = 'Monitor 24' estoque = 8  estoque_minimo = 5 )
      ( codigo = 'MAT002' descricao = 'Teclado'    estoque = 3  estoque_minimo = 5 )
      ( codigo = 'MAT003' descricao = 'Mouse'      estoque = 15 estoque_minimo = 10 )
      ( codigo = 'MAT004' descricao = 'Headset'    estoque = 2  estoque_minimo = 4 )
    ).

    READ TABLE lt_materiais
      ASSIGNING FIELD-SYMBOL(<fs_material>)
      WITH TABLE KEY codigo = 'MAT002'.

    IF sy-subrc = 0.
      <fs_material>-estoque += 10.
    ENDIF.

    LOOP AT lt_materiais INTO ls_material.

      IF ls_material-estoque < ls_material-estoque_minimo.

        lv_reposicao =
          ls_material-estoque_minimo - ls_material-estoque.

        out->write(
          |{ ls_material-codigo } - { ls_material-descricao } Precisa repor { lv_reposicao } unidades|
        ).

      ENDIF.

    ENDLOOP.

    DELETE TABLE lt_materiais
      WITH TABLE KEY codigo = 'MAT003'.

    IF sy-subrc = 0.
      out->write( 'Material deletado' ).
    ELSE.
      out->write( 'Material nao encontrado' ).
    ENDIF.

    LOOP AT lt_materiais INTO ls_material.

      out->write(
        |{ ls_material-codigo } - { ls_material-descricao } - Estoque: { ls_material-estoque }|
      ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
```

---

## Key Takeaways

Day 04 helped consolidate several important concepts:

- Internal Table types should be selected according to how the data will be accessed.
- `STANDARD`, `SORTED`, and `HASHED` tables solve different problems.
- `HASHED TABLE` is useful for frequent lookups using a unique key.
- `SORTED TABLE` automatically maintains its key order.
- `STANDARD TABLE` is useful for sequential processing and index-based access.
- `READ TABLE` can retrieve individual records.
- `sy-subrc` can be used to check whether an operation succeeded.
- `INTO` works with a copy of the row.
- `ASSIGNING FIELD-SYMBOL` works directly with the original row.
- `MODIFY` can write a modified structure back to an Internal Table.
- `DELETE` can remove records directly using their key.
- `SORT` can order a STANDARD TABLE using one or multiple fields.
- Performance considerations become more relevant as data volume and the number of lookups increase.

---

## Next Step

Day 04 strengthened the foundation for working with collections of business data in ABAP.

The next steps of the journey will continue evolving these exercises toward more SAP-oriented scenarios and persistent data access.

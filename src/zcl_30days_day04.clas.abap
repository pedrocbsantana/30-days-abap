CLASS zcl_30days_day04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

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



    IF sy-subrc = 0.
      out->write( 'Material inserido!' ).
    ELSE.
      out->write( 'Material ja cadastrado!' ).
    ENDIF.

    READ TABLE lt_materiais ASSIGNING FIELD-SYMBOL(<fs_material>)
        WITH TABLE KEY codigo = 'MAT002'.
     IF sy-subrc = 0.
     <fs_material>-estoque += 10.
     ENDIF.

    LOOP AT lt_materiais INTO ls_material.
    IF ls_material-estoque < ls_material-estoque_minimo.
         lv_reposicao = ls_material-estoque_minimo - ls_material-estoque.
        out->write( |{ ls_material-codigo } - { ls_material-descricao } Precisa repor { lv_reposicao } unidades | ).
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
    out->write( | { ls_material-codigo } - { ls_material-descricao  } - Estoque: { ls_material-estoque } | ).
    ENDLOOP.


  ENDMETHOD.
ENDCLASS.

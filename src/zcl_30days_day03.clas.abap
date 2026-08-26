CLASS zcl_30days_day03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_30days_day03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_pedido,
             estoque           TYPE i,
             qntd_solicitada   TYPE i,
             valor             TYPE p LENGTH 8 DECIMALS 2,
             cliente_bloqueado TYPE abap_bool,
             pendencias        TYPE i,
             status            TYPE c LENGTH 1,
           END OF ty_pedido.

    DATA ls_pedido TYPE ty_pedido.

    ls_pedido-estoque = 8.
    ls_pedido-qntd_solicitada = 5.
    ls_pedido-valor = 12500.
    ls_pedido-cliente_bloqueado = abap_false.
    ls_pedido-pendencias = 3.

    out->write( |{ ls_pedido-valor }| ).

    IF ls_pedido-cliente_bloqueado = abap_true.
      ls_pedido-status = 'B'.
    ELSEIF ls_pedido-estoque < ls_pedido-qntd_solicitada.
      ls_pedido-status = 'P'.
    ELSEIF ls_pedido-valor < 10000.
      ls_pedido-status = 'A'.
    ELSE.
      ls_pedido-status = 'R'.

    ENDIF.

    CASE ls_pedido-status.
      WHEN 'B'.
        out->write( 'Bloqueado' ).
      WHEN 'P'.
        out->write( 'Pendente' ).
      WHEN 'A'.
        out->write( 'Aprovado' ).
      WHEN 'R'.
        out->write( 'Revisao manual' ).
    ENDCASE.

    DO 3 TIMES.

      out->write( |Validação { sy-index }| ).
    ENDDO.

    WHILE ls_pedido-pendencias > 0.
      out->write( |Processando pendencia. Restantes: { ls_pedido-pendencias } | ).
      ls_pedido-pendencias -= 1.


    ENDWHILE.



  ENDMETHOD.
ENDCLASS.

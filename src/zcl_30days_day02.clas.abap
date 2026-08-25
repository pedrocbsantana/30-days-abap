CLASS zcl_30days_day02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_30days_day02 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
TYPES: BEGIN OF ty_produto,
    codigo TYPE n LENGTH 6,
    descricao TYPE string,
    qtd TYPE i,
    preco TYPE p LENGTH 6 DECIMALS 2 ,
END OF ty_produto.

DATA ls_produto TYPE ty_produto.

ls_produto-codigo = '000777'.
ls_produto-descricao = 'Monitor'.
ls_produto-qtd = 3.
ls_produto-preco = 129990 / 100.

out->write( |Produto { ls_produto-descricao } - Quantidade { ls_produto-qtd } - Preco: R$ { ls_produto-preco }| ).


CONSTANTS lc_qtdmax TYPE i VALUE 10.
ENDMETHOD.

ENDCLASS.

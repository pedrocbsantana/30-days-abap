CLASS zcl_day01_internal_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_day01_internal_tables IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_customer,
           customer_id TYPE i,
           name TYPE string,
           city TYPE string,
           END OF ty_customer.

    DATA lt_customer TYPE STANDARD TABLE OF ty_customer.
    APPEND VALUE #( customer_id = 1 name = 'Pedro' city = 'Campinas' ) TO lt_customer.
    APPEND VALUE #( customer_id = 2 name = 'Joao' city = 'Sao Paulo' ) TO lt_customer.
    APPEND VALUE #( customer_id = 3 name = 'Maria' city = 'Campinas' ) TO lt_customer.

    out->write( lt_customer ).

    DATA ls_customer TYPE ty_customer.

    READ TABLE lt_customer WITH KEY customer_id = 2 INTO ls_customer.
    IF sy-subrc = 0.
        out->write( ls_customer ).
        ELSE.
        out->write( 'Customer not found' ).
        ENDIF.



ENDMETHOD.


ENDCLASS.

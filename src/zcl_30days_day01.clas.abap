CLASS zcl_30days_day01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_30days_day01 IMPLEMENTATION.
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
ENDMETHOD.


ENDCLASS.

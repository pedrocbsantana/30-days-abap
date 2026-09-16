CLASS zcl_30days_day05_ex001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_30days_day05_ex001 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF ty_tabelinha,
           booking_id TYPE /dmo/booking-booking_id,
           customer_id TYPE /dmo/customer-customer_id,
           first_name TYPE /dmo/customer-first_name,
           second_name  TYPE /dmo/customer-last_name,
           country TYPE  /dmo/customer-country_code,
           price TYPE /dmo/booking-flight_price,
           END OF ty_tabelinha.


    DATA  lt_tabelinha TYPE STANDARD TABLE  OF ty_tabelinha.

       SELECT  booking_id, booking~customer_id, customer~first_name, customer~last_name, customer~country_code, booking~flight_price
       FROM /dmo/booking AS booking
       LEFT OUTER JOIN /dmo/customer AS customer
       ON booking~customer_id = customer~customer_id
       WHERE booking~flight_price > 500
       ORDER BY booking~flight_price DESCENDING
       INTO TABLE @lt_tabelinha
       UP TO 20 ROWS.

       out->write( lt_tabelinha ).

    ENDMETHOD.


ENDCLASS.

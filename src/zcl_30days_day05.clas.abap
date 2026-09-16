CLASS zcl_30days_day05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_30days_day05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_teste,
             id      TYPE /dmo/agency-agency_id,
             nome    TYPE /dmo/agency-name,
             country TYPE /dmo/agency-country_code,
           END OF ty_teste.

    TYPES: BEGIN OF ty_country_count,
             country TYPE /dmo/agency-country_code,
             total   TYPE i,
           END OF ty_country_count.


    DATA lt_country_count TYPE STANDARD TABLE OF ty_country_count.
    DATA lt_teste TYPE STANDARD TABLE OF ty_teste.
    DATA lv_agency_id TYPE /dmo/agency-agency_id.
    DATA ls_agency TYPE ty_teste.
    DATA lv_total TYPE i.
    DATA ls_count TYPE ty_teste.
    DATA lv_max_agency TYPE /dmo/agency-agency_id.
    DATA lt_countries TYPE STANDARD TABLE OF /dmo/agency-country_code.
    DATA lr_countries TYPE RANGE OF /dmo/agency-country_code.
    lv_agency_id = '070003'.

    SELECT agency_id, name, country_code
  FROM /dmo/agency
  WHERE country_code = 'DE'
    AND agency_id > '070020'
  ORDER BY name ASCENDING
  INTO TABLE @lt_teste
  UP TO 5 ROWS.
    IF sy-subrc = 0.
      out->write( lt_teste ).
    ELSE.
      out->write( 'Codigo de agencia nao encontrado!' ).
    ENDIF.

    SELECT COUNT( * )
 FROM /dmo/agency
 WHERE country_code = 'DE'
 INTO @lv_total.


    out->write( |O total de agencias da alemanha é: { lv_total } | ).



    SELECT MAX( agency_id )
 FROM /dmo/agency
 WHERE country_code = 'DE'
 INTO @lv_max_agency.

    out->write( |O maior AgencyId é: { lv_max_agency } | ).

    SELECT country_code, COUNT( * )
    FROM /dmo/agency
    WHERE agency_id > '070020'
    GROUP BY country_code
    HAVING COUNT( * ) > 5
    INTO TABLE @lt_country_count.

    out->write( lt_country_count ).

    SELECT DISTINCT country_code
    FROM /dmo/agency
    INTO TABLE @lt_countries.

    out->write( lt_countries ).


    APPEND VALUE #(
    sign = 'I' option = 'EQ' low = 'DE' ) TO lr_countries.

    APPEND VALUE #(
    sign = 'I' option = 'EQ' low = 'US' ) TO lr_countries.

    APPEND VALUE #(
    sign = 'I' option = 'EQ' low = 'GB' ) TO lr_countries.


    SELECT agency_id, name, country_code
    FROM /dmo/agency
    WHERE agency_id BETWEEN '070020' AND '070030'
    INTO TABLE @lt_teste.

  ENDMETHOD.

ENDCLASS.

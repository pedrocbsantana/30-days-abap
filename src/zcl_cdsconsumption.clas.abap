CLASS zcl_cdsconsumption DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cdsconsumption IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_teste,
             employee_id TYPE zi_employee_jp-EmployeeId,
             name TYPE zi_employee_jp-Name,
             salary TYPE zi_employee_jp-Salary,
            end OF ty_teste.


    DATA lt_teste TYPE STANDARD TABLE OF ty_teste.

    DATA ls_employee TYPE zemployee_jp.
    ls_employee-employee_id = '000001'.
    ls_employee-name = 'Pedro'.
    ls_employee-salary = '3500.50'.


    INSERT zemployee_jp FROM @ls_employee.
    IF sy-subrc = 0.
    out->write( 'Dados inseridos com sucesso!' ).
    ELSE.
    out->write( 'Dados já existentes na tabela, tente novamente!' ).
    ENDIF.


    SELECT * FROM zi_employee_jp INTO TABLE @lt_teste.
    IF sy-subrc = 0.
    out->write( 'Pelo menos um registro foi encontrado!' ).
      out->write( lt_teste ).

    ELSE.
    out->write( 'Nenhum registro encontrado!' ).
    ENDIF.



    ENDMETHOD.

ENDCLASS.

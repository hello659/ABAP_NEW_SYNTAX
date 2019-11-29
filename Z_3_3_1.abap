*&---------------------------------------------------------------------*
*& Report Z_3_3_1
*&---------------------------------------------------------------------*
*&  3.3.1Avoiding Type Mismatch Dumps when Calling Functions
*&---------------------------------------------------------------------*
REPORT z_3_3_1.

CLASS zcl_add DEFINITION.
 PUBLIC SECTION.
  METHODS: add IMPORTING i_num1 TYPE i
                        i_num2 TYPE i
              EXPORTING o_output TYPE i,
          sub IMPORTING i_num1 TYPE i
                        i_num2 TYPE i
              RETURNING VALUE(o_output) TYPE i.
ENDCLASS.
CLASS zcl_add IMPLEMENTATION.
  METHOD add.
      o_output = i_num1 + i_num2.
  ENDMETHOD.

  METHOD sub.
    o_output = i_num1 - i_num2.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.

DATA(lr_add) = NEW zcl_add( ).

lr_add->add(
  EXPORTING
    i_num1   = 3
    i_num2   = 2
  IMPORTING
    o_output = DATA(lv_result)
).
WRITE:/ lv_result.

lv_result = lr_add->sub(
  EXPORTING
    i_num1   = 10
    i_num2   = 9
).

WRITE:/ lv_result.


*It doesn't work for Function Module.
*CALL FUNCTION 'ZADD_NUMBER'
*  EXPORTING
*    i_num1         =  2
*    i_num2         =  4
* IMPORTING
*   O_OUTPUT       =  data(lv_result2).
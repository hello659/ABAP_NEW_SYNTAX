*&---------------------------------------------------------------------*
*& Report Z_3_3_2
*&---------------------------------------------------------------------*
*&  3.3.2Using Constructor Operators to Convert Strings
*&---------------------------------------------------------------------*
REPORT z_3_3_2.

DATA: lv_float TYPE f VALUE '10.0',
      lv_result TYPE i.

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


*CALL FUNCTION 'ZADD_NUMBER'
*  EXPORTING
*    i_num1         = lv_float   "Compiled. but error at runtime.
*    i_num2         = 3
* IMPORTING
*   O_OUTPUT       = lv_result.

CALL FUNCTION 'ZADD_NUMBER'
  EXPORTING
    i_num1         = CONV i( lv_float )  "Cannot use 'CONV #' on Function module. You have to specify data type.
    i_num2         = 3
 IMPORTING
   o_output       = lv_result.

WRITE:/ lv_result.


lr_add->add(
  EXPORTING
    i_num1   = CONV #( lv_float )  "You can use 'CONV #' on class method.
    i_num2   = 10
  IMPORTING
    o_output = lv_result
).

WRITE:/ lv_result.
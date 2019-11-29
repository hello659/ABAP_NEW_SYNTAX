*&---------------------------------------------------------------------*
*& Report Z_3_4_1
*&---------------------------------------------------------------------*
*&  3.4.1Omitting ABAP_TRUE
*&---------------------------------------------------------------------*
REPORT z_3_4_1.

CLASS zcl_get_bool DEFINITION.
  PUBLIC SECTION.
    METHODS: get_true  RETURNING VALUE(o_output) TYPE char1.
ENDCLASS.

CLASS zcl_get_bool IMPLEMENTATION.
  METHOD get_true.
    o_output = 'X'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA(lr_bool) = NEW zcl_get_bool( ).

IF lr_bool->get_true( ) EQ abap_true.
  WRITE:/'true'.
ELSE.
  WRITE:/'error'.
ENDIF.

"New Syntax.
IF lr_bool->get_true( ).  "Same as 'IF lr-bool->get_true() is not initial'.
  WRITE:/'true'.
ELSE.
  WRITE:/'error'.
ENDIF.
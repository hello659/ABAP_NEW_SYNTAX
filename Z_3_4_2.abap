*&---------------------------------------------------------------------*
*& Report Z_3_4_2
*&---------------------------------------------------------------------*
*&  3.4.2Using XSDBOOL as a Workaround for BOOLC
*&---------------------------------------------------------------------*
REPORT z_3_4_2.

DATA: lt_data TYPE TABLE OF mara.

DATA(lv_bool) = boolc( lt_data IS INITIAL ).  "true

*BOOLC returns 1 charater space ' ' for abap_false which is wrong.
IF boolc( lt_data IS NOT INITIAL ) = abap_false.
  WRITE:/ 'empty'.
ELSE.
  WRITE:/ 'not empty'.
ENDIF.

*XSDBOOL returns no values '' for abap_false
*Avoid using BOOLC. Use XSDBOOL instead.
IF xsdbool( lt_data IS NOT INITIAL ) = abap_false.
  WRITE:/ 'empty'.
ELSE.
  WRITE:/ 'not empty'.
ENDIF.
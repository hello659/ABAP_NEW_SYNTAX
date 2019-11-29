*&---------------------------------------------------------------------*
*& Report Z_3_4_3
*&---------------------------------------------------------------------*
*&  3.4.3 The SWITCH statement as a Replacement for CASE
*&---------------------------------------------------------------------*
REPORT z_3_4_3.

DATA: lv_str TYPE string.

DATA(lv_cond) = 'A'.

CASE lv_cond.
  WHEN 'A'.
    lv_str = |It's A|.
  WHEN 'B'.
    lv_str = |It's B|.
  WHEN OTHERS.
    lv_str = |It's Others'|.
ENDCASE.


WRITE:/ lv_str.

lv_cond = 'B'.
lv_str = SWITCH #( lv_cond
  WHEN 'A' THEN |It's A|
  WHEN 'B' THEN |It's B|
  ELSE |It's Others'|
).

WRITE:/ lv_str.
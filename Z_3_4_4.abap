*&---------------------------------------------------------------------*
*& Report Z_3_4_4
*&---------------------------------------------------------------------*
*&  3.4.4 The COND Statement as a Replacement for IF/ELSE
*&---------------------------------------------------------------------*
REPORT Z_3_4_4.


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
lv_str = COND #(
  WHEN lv_cond = 'A' THEN |It's A|
  WHEN lv_cond = 'B' THEN |It's B|
  ELSE |It's Others'|
).

WRITE:/ lv_str.
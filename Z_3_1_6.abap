*&---------------------------------------------------------------------*
*& Report Z_3_1_6
*&---------------------------------------------------------------------*
*&  3.1.6 Enumerations
*&---------------------------------------------------------------------*
REPORT z_3_1_6.

TYPES: BEGIN OF ENUM e_product_size,
        s,
        m ,
        l ,
        xl,
  END OF ENUM e_product_size.

  DATA: lv_size TYPE e_product_size.


lv_size = xl.

WRITE:/ lv_size.
WRITE:/ CONV i( lv_size ).
*lv_size = AA.   "Compile Error
*WRITE:/ lv_size.

*
TYPES:
  basetype TYPE char8,"Maximum length of the basetype is 8 characters(16 bytes)
  BEGIN OF ENUM e_product_color STRUCTURE le_color BASE TYPE basetype,
        red   VALUE IS INITIAL,   "At least 1 element must be initial. Its value is 0.
        green VALUE '20',
        blue  VALUE '30',
  END OF ENUM e_product_color STRUCTURE le_color.


DATA: lv_color TYPE e_product_color .

"put value from structure.
"enumerator structure support autocompletion.
"Press ctrl + space. You can see possible entries for le_color.
lv_color = le_color-blue.
*lv_color = purple.     " Compile Error

WRITE:/ |text : { lv_color }|.
WRITE:/ |value: { CONV char8( lv_color ) }|.
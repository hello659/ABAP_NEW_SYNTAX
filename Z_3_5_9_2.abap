*&---------------------------------------------------------------------*
*& Report Z_3_5_9_2
*&---------------------------------------------------------------------*
*&   3.5.9 Extracting One Table From Another
*&---------------------------------------------------------------------*
REPORT z_3_5_9_2.

DATA(lr_disp) = cl_demo_output=>new( ).

DATA: lt_data  TYPE STANDARD TABLE OF sflight WITH NON-UNIQUE SORTED KEY carrid COMPONENTS carrid price,
      lt_data2 TYPE TABLE OF sflight.

SELECT *
  FROM sflight
  UP TO 30 ROWS
  INTO CORRESPONDING FIELDS OF TABLE @lt_data.

lt_data2 = FILTER #( lt_data USING KEY carrid WHERE carrid EQ CONV #('AA') AND  price < CONV #( 1000 ) ).
lr_disp->begin_section( |Filtered with 'where' condition.| ).
lr_disp->write_data( lt_data2 ).

CLEAR lt_data2.

DATA: lt_filter TYPE SORTED TABLE OF sflight WITH UNIQUE KEY carrid connid.

lt_filter = VALUE #( ( carrid = 'AA' connid = '0017' ) ).
lt_data2 = FILTER #( lt_data IN lt_filter WHERE carrid = carrid AND connid = connid ).
lr_disp->begin_section( |Filter with Filter itab| ).
lr_disp->write_data( lt_data2 ).

lr_disp->display( ).
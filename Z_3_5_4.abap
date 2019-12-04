*&---------------------------------------------------------------------*
*& Report Z_3_5_4
*&---------------------------------------------------------------------*
*&  3.5.4 MOVE-CORRESPONDING for internal tables with Deep Structure
*&---------------------------------------------------------------------*
REPORT z_3_5_4.

TYPES: BEGIN OF t_s_deep1,
  id TYPE char10,
  property1 TYPE char10,
  value1     TYPE string,
  END OF t_s_deep1,
  t_t_deep1 TYPE TABLE OF t_s_deep1 WITH KEY id.

TYPES: BEGIN OF t_s_deep2,
  id TYPE char10,
  property2 TYPE char10,
  value2    TYPE string,
  END OF t_s_deep2,
  t_t_deep2 TYPE TABLE OF t_s_deep2 WITH KEY id.


TYPES: BEGIN OF t_s_1,
  id  TYPE char10,
  name TYPE string,
  property TYPE t_t_deep1,
  END OF t_s_1,
  t_t_1 TYPE TABLE OF t_s_1 WITH KEY id.


TYPES: BEGIN OF t_s_2,
  id  TYPE char10,
  name TYPE string,
  property TYPE t_t_deep2,
  END OF t_s_2,
  t_t_2 TYPE TABLE OF t_s_2 WITH KEY id.


*Deep structure
  DATA(lt_1) = VALUE t_t_1(
    ( id = '0000000001'
      name = 'Car'
      property = VALUE #( ( id = '0000000001' property1 = 'Color' value1 = 'Red' )
                          ( id = '0000000001' property1 = 'Size' value1 = 'Small' )
                           ( id = '0000000001' property1 = 'Speed' value1 = '100' ) )
     )
     ( id = '0000000002'
      name = 'Boat'
      property = VALUE #( ( id = '0000000002' property1 = 'Color' value1 = 'White' )
                          ( id = '0000000002' property1 = 'Size' value1 = 'Big' )
                           ( id = '0000000002' property1 = 'Speed' value1 = '30' ) )
     )
   ).


DATA(lt_2) = VALUE t_t_2( ).

*All fields are copied regardless of their field name.
lt_2 = lt_1.

*Delete lt_2 data and
*Only matched fields are copied including deep structure
MOVE-CORRESPONDING lt_1 TO lt_2 EXPANDING NESTED TABLES.


*Preserve pre-existing data and append new rows.
*Only matched fields are copied including deep structure
MOVE-CORRESPONDING lt_1 TO lt_2 EXPANDING NESTED TABLES KEEPING TARGET LINES.

BREAK-POINT.
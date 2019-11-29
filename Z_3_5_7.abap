*&---------------------------------------------------------------------*
*& Report Z_3_5_7
*&---------------------------------------------------------------------*
*&  3.5.7 Internal Table Queries with REDUCE
*&---------------------------------------------------------------------*
REPORT z_3_5_7.

TYPES: BEGIN OF t_s_data,
  productid  TYPE char10,
  name TYPE string,
  price TYPE i,
  END OF t_s_data,
  t_t_data TYPE TABLE OF t_s_data WITH KEY productid.


DATA(lt_data) = VALUE t_t_data(
                    ( productid = '0000000001' name = 'hello'  price = 100 )
                    ( productid = '0000000002' name = 'hello2' price = 200 )
                    ( productid = '0000000003' name = 'hello3' price = 250 )
                    ( productid = '0000000004' name = 'hello4' price = 300 )
                  ).
*Calculate using REDUCE
DATA(lv_sum) = REDUCE sy-tabix(
  INIT lv_result = 0
  FOR ls_data IN lt_data
  NEXT lv_result = lv_result + ls_data-price
).

WRITE:/ lv_sum.
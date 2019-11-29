*&---------------------------------------------------------------------*
*& Report Z_3_5_6
*&---------------------------------------------------------------------*
*&  3.5.6 New Functions for Common Internal Table Tasks
*&---------------------------------------------------------------------*
REPORT z_3_5_6.
TYPES: BEGIN OF t_s_data,
  id  TYPE char10,
  name TYPE string,
  END OF t_s_data,
  t_t_data TYPE TABLE OF t_s_data WITH KEY id.


DATA(lt_data) = VALUE t_t_data(
                    ( id = '0000000001' name = 'hello' )
                    ( id = '0000000002' name = 'hello2' )
                    ( id = '0000000003' name = 'hello3' )
                    ( id = '0000000004' name = 'hello4' )
                  ).

"Get line index.
*returns 0 if the line is not found. SY-SUBRC value is not changed.
DATA(lv_index) = line_index( lt_data[ id = '0000000003' ] ).
WRITE:/ lv_index.
lv_index = line_index( lt_data[ name = 'hello4' ] ).
WRITE:/ lv_index.


"Check if the row exist.
IF line_exists( lt_data[ id = '0000000002' ] ).
  WRITE:/ 'exist'.
ELSE.
  WRITE:/ 'not exist'.
ENDIF.
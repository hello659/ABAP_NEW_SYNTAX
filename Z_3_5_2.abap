*&---------------------------------------------------------------------*
*& Report Z_3_5_2
*&---------------------------------------------------------------------*
*&  3.5.2 Reading from a Table
*&---------------------------------------------------------------------*
REPORT z_3_5_2.


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

"Find by Key Value
DATA(lv_name) =  lt_data[ '0000000001' ]-name.
WRITE:/ lv_name , /.

"Find by Non-Key value
DATA(lv_id) =  lt_data[ name = 'hello2' ]-id.
WRITE:/ lv_id , /.

"Find by Index
DATA(lv_id2) = lt_data[ 3 ]-id.
WRITE:/ lv_id2 , /.



DO 4 TIMES.
  WRITE:/ lt_data[ sy-index ]-id, lt_data[ sy-index ]-name.
ENDDO.

"Runtime Error at 5th iteration.
*DO 5 TIMES.
*  WRITE:/ lt_data[ sy-index ]-id, lt_data[ sy-index ]-name.
*ENDDO.


"Prevent runtime error by using 'OPTION' OR 'DEFAULT;.
DO 5 TIMES.
  WRITE:/ |{ VALUE #( lt_data[ sy-index ]-id OPTIONAL ) }|,
          |{ VALUE #( lt_data[ sy-index ]-name DEFAULT 'noname' ) }|.
ENDDO.
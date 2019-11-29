*&---------------------------------------------------------------------*
*& Report Z_3_5_1
*&---------------------------------------------------------------------*
*&  3.5.1Table Work Areas
*&---------------------------------------------------------------------*
REPORT z_3_5_1.

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

READ TABLE lt_data ASSIGNING FIELD-SYMBOL(<fs_read>) WITH KEY id = '0000000003'.
WRITE:/ <fs_read>-name.

WRITE:/.

LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs_loop>).
  WRITE:/ <fs_loop>-name. "This syntax is only valid for inline declaration loop.
ENDLOOP.


*FIELD-SYMBOLS: <fs_loop2> type any.
*LOOP AT lt_data ASSIGNING <fs_loop2>.
*  WRITE:/ <fs_loop2>-name.     "Complie Error
*ENDLOOP.


WRITE:/.

*Working example without inline decalartion
FIELD-SYMBOLS: <FS_LOOP_FIX> TYPE ANY,
               <FF> TYPE ANY.

LOOP AT LT_DATA ASSIGNING <FS_LOOP_FIX>.
  ASSIGN COMPONENT 2 OF STRUCTURE <FS_LOOP_FIX> TO <FF>.
  WRITE:/ <FF>.
ENDLOOP.
*&---------------------------------------------------------------------*
*& Report Z_3_3_3
*&---------------------------------------------------------------------*
*&  3.3.3Functions that Expect TYPE REF TO DATA
*&---------------------------------------------------------------------*
REPORT z_3_3_3.

TYPES: BEGIN OF t_s_data,
  field1 TYPE string,
  field2 TYPE string,
  END OF t_s_data,
  t_t_data TYPE TABLE OF t_s_data WITH KEY field1.


CLASS zcl_ref DEFINITION.
  PUBLIC SECTION.
    METHODS: print IMPORTING i_val TYPE REF TO data.

ENDCLASS.

CLASS zcl_ref IMPLEMENTATION.
  METHOD print.
      FIELD-SYMBOLS <ft> TYPE ANY TABLE.
      ASSIGN i_val->* TO <ft>.
      LOOP AT <ft> ASSIGNING FIELD-SYMBOL(<fs>).
          ASSIGN COMPONENT 1 OF STRUCTURE <fs> TO FIELD-SYMBOL(<ff>).
          WRITE:/ <ff>.
      ENDLOOP.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: lr_data TYPE REF TO data.
DATA(lt_data) = VALUE t_t_data(
                  ( field1 = 'test1' field2 = 'hello1'  )
                  ( field1 = 'test2' field2 = 'hello2'  )
                  ( field1 = 'test3' field2 = 'hello3'  )
                ).

"Old code
GET REFERENCE OF lt_data INTO lr_data.
DATA(lr_ref) = NEW zcl_ref( ).
lr_ref->print( i_val = lr_data ).

"New Syntax
lr_ref->print( i_val = REF #( lt_data ) ).
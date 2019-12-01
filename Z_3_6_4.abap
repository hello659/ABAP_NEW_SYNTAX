*&---------------------------------------------------------------------*
*& Report Z_3_6_4
*&---------------------------------------------------------------------*
*&  3.6.4 Changes to Interfaces
*&---------------------------------------------------------------------*
REPORT z_3_6_4.

INTERFACE z_i_demo.
  METHODS: demo1,
           demo2 DEFAULT FAIL,
           demo3 DEFAULT IGNORE,
           demo4 DEFAULT IGNORE RETURNING VALUE(ret) TYPE abap_bool.

ENDINTERFACE.


CLASS zcl_demo DEFINITION.
  PUBLIC SECTION.
  INTERFACES z_i_demo.
ENDCLASS.

CLASS zcl_demo IMPLEMENTATION.
  METHOD z_i_demo~demo1.        "only demo1 method is implemented.
    WRITE:/ 'Redefined method demo 1'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA(lr_demo) = NEW zcl_demo( ).

lr_demo->z_i_demo~demo1( ).
*lr_demo->z_i_demo~demo2( )."Compiled. but error at runtime.
lr_demo->z_i_demo~demo3( ). "No errors even though the method is not implemented.
lr_demo->z_i_demo~demo4( ). "No errors even though the method is not implemented.
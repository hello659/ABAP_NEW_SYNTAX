*&---------------------------------------------------------------------*
*& Report Z_3_6_2
*&---------------------------------------------------------------------*
*&  3.6.2 Finding the Subclass of an Object Instance
*&---------------------------------------------------------------------*
REPORT z_3_6_2.

CLASS zcl_hi DEFINITION.
   PUBLIC SECTION.
    METHODS: hi IMPORTING name TYPE string.
ENDCLASS.

CLASS zcl_hi IMPLEMENTATION.
  METHOD: hi.
    WRITE:/ 'Hi', name.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.


  DATA(lr_hi) = NEW zcl_hi( ).

*IS INSTANCE OF
  IF lr_hi IS INSTANCE OF zcl_hi.
      lr_hi->hi( 'Mr. Lee' ).
  ENDIF.


*CASE TYPE OF ~ WHEN TYPE ~
  CASE TYPE OF lr_hi.
    WHEN TYPE zcl_hi.
      lr_hi->hi( 'Mr. Lee' ).
  ENDCASE.

*CASE TYPE OF ~ WHEN TYPE ~ INTO ~
  CASE TYPE OF lr_hi.
    WHEN TYPE zcl_hi INTO DATA(lr_hello).
      lr_hello->hi( 'Mr. Lee' ).
  ENDCASE.
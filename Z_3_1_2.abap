*&---------------------------------------------------------------------*
*& Report Z_3_1_2
*&---------------------------------------------------------------------*
*&  3.1.1 Omitting Data Type Declaration
*&  3.1.2 Creating Objects Using NEW
*&---------------------------------------------------------------------*
REPORT z_3_1_2.

TYPES:BEGIN OF ty_s_user,
  id   TYPE string,
  name TYPE string,
  END OF ty_s_user.


CLASS zcl_user DEFINITION.

  PUBLIC SECTION.

  METHODS: constructor
                  IMPORTING user TYPE ty_s_user,
           print_name,
           print_id.

  PRIVATE SECTION.

  DATA: lv_name TYPE string,
        lv_id   TYPE char10.

ENDCLASS.

CLASS zcl_user IMPLEMENTATION.

 METHOD constructor.
   lv_name = user-name.
   lv_id = user-id.
 ENDMETHOD.

  METHOD print_name.

    WRITE: lv_name.

  ENDMETHOD.

  METHOD print_id.

    WRITE: lv_id.

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

DATA(lr_newuser) = NEW zcl_user( VALUE #( id = 'helloID' name = 'helloNAme' ) ).


lr_newuser->print_id( ).
lr_newuser->print_name( ).
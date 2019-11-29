*&---------------------------------------------------------------------*
*& Report Z_3_6_3
*&---------------------------------------------------------------------*
*&  3.6.3 CHANGING and EXPORTING parameters
*&---------------------------------------------------------------------*
REPORT z_3_6_3.

CLASS zcl_cal DEFINITION.
  PUBLIC SECTION.
    METHODS: add IMPORTING i_val1 TYPE i
                           i_val2 TYPE i
                 EXPORTING e_val TYPE i
                 CHANGING  c_val TYPE i
                 RETURNING VALUE(r_val) TYPE i.
ENDCLASS.

CLASS zcl_cal IMPLEMENTATION.
  METHOD add.
    e_val = i_val1 + i_val2.
    c_val = c_val + 1.
    r_val = i_val1 + i_val2.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.
DATA: lv_e TYPE i.
DATA(lr_cal) = NEW zcl_cal( ).
DATA(lv_c) = 100.

*inline declaration for IMPORTING is not allowed
*when RECEIVING parameter is out of the method's parenthesis.
data(lv_r) = lr_cal->add(
               EXPORTING
                 i_val1 = 10
                 i_val2 = 20
               IMPORTING
                 e_val  = lv_e
               CHANGING
                 c_val  = lv_c
             ).


WRITE:/ | e_val:{ lv_e }  c_val:{ lv_c }  r_val:{ lv_r } |.



DATA(lv_c2) = 100.

*inline declaration for IMPORTING and RECEIVING is allowed.
*When RECEIVING paremeter is in the parenthesis.
lr_cal->add(
               EXPORTING
                 i_val1 = 10
                 i_val2 = 20
               IMPORTING
                 e_val  = DATA(lv_e2)
               CHANGING
                 c_val  = lv_c2
               RECEIVING    " <-------------
                 r_val = DATA(lv_r2)
             ).

WRITE:/ | e_val:{ lv_e2 }  c_val:{ lv_c2 }  r_val:{ lv_r2 } |.
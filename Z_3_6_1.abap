*&---------------------------------------------------------------------*
*& Report Z_3_6_1
*&---------------------------------------------------------------------*
*&  3.6.1 Upcasting / Downcasting with CAST
*&---------------------------------------------------------------------*
REPORT z_3_6_1.

  DATA: lr_structure_desciptor TYPE REF TO cl_abap_structdescr.


  lr_structure_desciptor ?= cl_abap_typedescr=>describe_by_name( 'SFLIGHT' ).
  data(lt_components1) = lr_structure_desciptor->components.


  DATA(lt_components2) = CAST cl_abap_structdescr(
                              cl_abap_typedescr=>describe_by_name( 'SFLIGHT' )
                            )->components.

  "lt_components1 and lt_components2 are identical.
  DATA(lr_display) = cl_demo_output=>new( ).
  lr_display->begin_section( 'lt_components1' )->write_data( lt_components1 ).
  lr_display->begin_section( 'lt_components2' )->write_data( lt_components2 ).
  lr_display->display( ).
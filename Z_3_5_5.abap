*&---------------------------------------------------------------------*
*& Report Z_3_5_5
*&---------------------------------------------------------------------*
*&  3.5.5 Dynamic MOVE-CORRESPONDING
*&---------------------------------------------------------------------*
REPORT z_3_5_5.

TYPES: BEGIN OF t_s_data1,
  id TYPE char10,
  property1 TYPE char10,
  value1     TYPE string,
  END OF t_s_data1,
  t_t_data1 TYPE TABLE OF t_s_data1 WITH KEY id.

TYPES: BEGIN OF t_s_datap2,
  id TYPE char10,
  property2 TYPE char10,
  value2    TYPE string,
  END OF t_s_datap2,
  t_t_data2 TYPE TABLE OF t_s_datap2 WITH KEY id.

DATA(lt_data1) = VALUE t_t_data1(
                        ( id = '0000000001' property1 = 'Color' value1 = 'Red' )
                        ( id = '0000000002' property1 = 'Size' value1 = 'Large' )
                        ( id = '0000000003' property1 = 'Price' value1 = '1000000' )
                 ).

DATA(lt_data2) = VALUE t_t_data2( ).


DATA: ls_mapping_rule TYPE cl_abap_corresponding=>mapping_info,
      lt_mapping_rule TYPE cl_abap_corresponding=>mapping_table.

"setup mapping rule
ls_mapping_rule-level = 0.
ls_mapping_rule-kind = cl_abap_corresponding=>mapping_component.
ls_mapping_rule-srcname = 'VALUE1'.
ls_mapping_rule-dstname = 'VALUE2'.

APPEND ls_mapping_rule TO lt_mapping_rule.

CLEAR ls_mapping_rule.

ls_mapping_rule-level = 0.
ls_mapping_rule-kind = cl_abap_corresponding=>mapping_component.
ls_mapping_rule-srcname = 'PROPERTY1'.
ls_mapping_rule-dstname = 'PROPERTY2'.

APPEND ls_mapping_rule TO lt_mapping_rule.

"Create Mapping handler
DATA(lr_dynamic_mapper) = cl_abap_corresponding=>create(
                            source                = lt_data1
                            destination           = lt_data2
                            mapping               = lt_mapping_rule
                          ).

"Run mapping
lr_dynamic_mapper->execute(
  EXPORTING
    source      = lt_data1
  CHANGING
    destination = lt_data2
).


cl_demo_output=>display(
  EXPORTING
    data = lt_data2
    name = 'data2'
).
*&---------------------------------------------------------------------*
*& Report Z_3_5_3
*&---------------------------------------------------------------------*
*&  3.5.3 CORRESPONDING for Normal Internal Tables
*&---------------------------------------------------------------------*
REPORT Z_3_5_3.

TYPES: BEGIN OF t_s_data,
  id  TYPE char10,
  name TYPE string,
  nickname type string,
  addr type string,
  addr2 type string,
  END OF t_s_data,
  t_t_data TYPE TABLE OF t_s_data WITH KEY id.


TYPES: BEGIN OF t_s_data2,
  id  TYPE char10,
  name TYPE string,
  nickname type string,
  addr type string,
  END OF t_s_data2,
  t_t_data2 TYPE TABLE OF t_s_data2 WITH KEY id.


DATA(lt_data) = VALUE t_t_data(
    ( id = '0000000001' name = 'hello' nickname = 'KIM' addr = 'seoul' addr2 = 'gasan' )
    ( id = '0000000002' name = 'hello2' nickname = 'HONG' addr = 'gyunggi' addr2 = 'Myungdong' )
    ( id = '0000000003' name = 'hello3' nickname = 'LEE' addr = 'ganwon' addr2 = 'Jongro' )
    ( id = '0000000004' name = 'hello4' nickname = 'CHOI' addr = 'none' addr2 = 'Gangseo' )
).


data(lt_data2) = CORRESPONDING t_t_data2(
        lt_data
        MAPPING name = nickname   "Non-specified fields are mapped to the same named fields.
                nickname = name
        EXCEPT addr              "Not transfered.
).

cl_demo_output=>display(
  EXPORTING
    data = lt_data2
    name = 'mapping'
).
*&---------------------------------------------------------------------*
*& Report Z_3_5_8
*&---------------------------------------------------------------------*
*&  3.5.8 Grouping Internal Tables
*&---------------------------------------------------------------------*
REPORT Z_3_5_8.
data(lr_disp) = cl_demo_output=>new( ).

SELECT *
  FROM sflight
  UP TO 200 ROWS
  INTO TABLE @DATA(lt_sflight).

lr_disp->begin_section( |Representative binding| ).
lr_disp->write_text( |Representative binding : Write down structure and field name after GROUP BY keyword| ).
lr_disp->write_text( |Only unique carrid values are displayed. SY-TABIX has its row number| ).
LOOP AT lt_sflight INTO DATA(ls_sflight) GROUP BY ls_sflight-carrid.
  lr_disp->write_text( |{ ls_sflight-carrid } { ls_sflight-connid } { sy-tabix }| ).
ENDLOOP.

lr_disp->begin_section( |Representative binding with Multiple group fields.| ).

WRITE:/''.
LOOP AT lt_sflight INTO DATA(ls_sflight2) GROUP BY ( carrid = ls_sflight2-carrid  connid = ls_sflight2-connid ).
  lr_disp->write_text( |{ ls_sflight2-carrid }{ ls_sflight2-connid }{ sy-tabix }| ).
ENDLOOP.


lr_disp->begin_section( |Iterate grouped data inside loop| ).
LOOP AT lt_sflight INTO DATA(ls_sflight3) GROUP BY ls_sflight2-carrid.

  LOOP AT GROUP ls_sflight3 INTO DATA(ls_members).
    lr_disp->write_text( |{ ls_members-carrid } { ls_members-connid } { sy-tabix }| ).
  ENDLOOP.

ENDLOOP.


lr_disp->begin_section( |Group key binding| ).
lr_disp->write_text( |Group key binding : Write 'INTO DATA' statement after GROUP BY| ).
lr_disp->write_text( |Has additional features like 'GROUP INDEX', 'GROUP SIZE| ).
lr_disp->write_text( |carrid and connid are not displayed.| ).
lr_disp->write_text( |Only assigned values are accessible via 'key' variable| ).
LOOP AT lt_sflight INTO DATA(ls_sflight4) GROUP BY ls_sflight4-carrid INTO DATA(key).

  lr_disp->write_text( |carrid: { ls_sflight4-carrid }  connid: { ls_sflight4-connid } key: { key } tabix: { sy-tabix }| ).

ENDLOOP.

lr_disp->begin_section( |Group key binding. Multiple fields + GROUP INDEX, GROUP SIZE| ).

LOOP AT lt_sflight INTO DATA(ls_sflight5) GROUP BY ( key1 = ls_sflight5-carrid
                                                      key2 = ls_sflight5-connid
                                                      index = GROUP INDEX
                                                      size = GROUP SIZE )
                                           INTO DATA(keys).
*GROUP SIZE : number of rows which have same key values(carrid, connid) in the group.
  lr_disp->write_text( | key1: { keys-key1 }  key2: { keys-key2 }| &
                       |group_index: { keys-index }  group_size: { keys-size }  tabix: { sy-tabix }|  ).

ENDLOOP.

lr_disp->display( ).
*&---------------------------------------------------------------------*
*& Report Z_3_5_9
*&---------------------------------------------------------------------*
*&  3.5.9 Extracting One Table From Another
*&---------------------------------------------------------------------*
REPORT z_3_5_9.

data(lr_disp) = cl_demo_output=>new( ).

TYPES: BEGIN OF t_s_data,
         id    TYPE char10,
         name  TYPE string,
         price TYPE i,
       END OF t_s_data,
*Types have to have 'SORTED KEY' AND 'COMPONENTS' to use 'FILTER' feature.
*Both 'UNIQUE' and 'NON-UNIQUE' keys are possible
       t_t_data   TYPE STANDARD TABLE OF t_s_data WITH NON-UNIQUE SORTED KEY id COMPONENTS price,
*Filter table has to be 'SORTED' OR 'HASHED' table with 'UNIQUE KEY'.
       t_t_filter TYPE SORTED TABLE OF t_s_data WITH UNIQUE KEY id name .



*Inline Declaration is not allowed for the types with 'NON-UNIQUE SORTED KEY ~ COMPONENTS ~'.
*You have to declare variables first.
DATA: lt_data  TYPE t_t_data,
      lt_data2 TYPE t_t_data.

lt_data = VALUE #(
            ( id = '0000000001' name = 'hello1' price = 1000 )
            ( id = '0000000002' name = 'hello2' price = 3000 )
            ( id = '0000000003' name = 'hello3' price = 2000 )
            ( id = '0000000004' name = 'hello4' price = 5000 )
            ( id = '0000000005' name = 'hello5' price = 6000 )
            ( id = '0000000006' name = 'hello6' price = 7000 )
          ).

*Filter by 'where' condition
lt_data2 = FILTER #( lt_data USING KEY id WHERE price < 5000 ).

lr_disp->begin_section( |Filtered with 'where' condition.| ).
lr_disp->write_data( lt_data2 ).


*Filter by filter table.
*Only Key fields can be used for condition.
CLEAR lt_data2.
DATA: lt_filter TYPE t_t_filter.

lt_filter = VALUE #(
                        ( id = '0000000003' name = 'hello3' price = 2000 )
                        ( id = '0000000004' name = 'hello4' price = 5000 )
                  ).

* lt_data -> Source Table
* lt_filter -> Filter Table
lt_data2 = FILTER #( lt_data IN lt_filter WHERE id = id and name = name ).

lr_disp->begin_section( |Filtered with Filter itab| ).
lr_disp->write_data( lt_data2 ).

lr_disp->display( ).

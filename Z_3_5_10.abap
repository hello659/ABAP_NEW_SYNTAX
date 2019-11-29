*&---------------------------------------------------------------------*
*& Report Z_3_5_10
*&---------------------------------------------------------------------*
*&  3.5.10 Virtual Sorting of Internal Tables
*&---------------------------------------------------------------------*
REPORT z_3_5_10.

TYPES: BEGIN OF t_s_product_name,
  id TYPE char10,
  name TYPE string,
  END OF t_s_product_name,
  t_ts_product_name TYPE TABLE OF t_s_product_name WITH KEY id.

TYPES: BEGIN OF t_s_product_color,
*  id TYPE char10,
  color TYPE string,
  END OF t_s_product_color,
  t_t_product_color TYPE TABLE OF t_s_product_color WITH KEY color.

TYPES: BEGIN OF t_s_product,
  id TYPE char10,
  name TYPE string,
  color TYPE string,
  END OF t_s_product,
  t_t_product TYPE TABLE OF t_s_product WITH KEY id.


DATA: lt_sorted_data TYPE t_t_product.

DATA(lt_product_name) = VALUE t_ts_product_name(
                          ( id = '0000000001' name = 'hello1' )
                          ( id = '0000000002' name = 'hello2' )
                          ( id = '0000000003' name = 'hello4' )
                          ( id = '0000000004' name = 'hello3' )
                          ( id = '0000000005' name = 'hello3' )
                          ( id = '0000000006' name = 'hello5' )
                          ( id = '0000000007' name = 'hello5' )
                       ).

DATA(lt_product_color) = VALUE t_t_product_color(
                          ( color = 'red' )
                          ( color = 'white' )
                          ( color = 'blue' )
                          ( color = 'brown' )
                          ( color = 'yello' )
                          ( color = 'black' )
                          ( color = 'purple' )
                        ).


DATA(lt_product) = VALUE t_t_product(
                          ( id = '0000000001' name = 'hello1'  color = 'red' )
                          ( id = '0000000002' name = 'hello2'  color = 'white')
                          ( id = '0000000003' name = 'hello4'  color = 'blue' )
                          ( id = '0000000004' name = 'hello3'  color = 'brown' )
                          ( id = '0000000005' name = 'hello3'  color = 'yello' )
                          ( id = '0000000006' name = 'hello5'  color = 'black' )
                          ( id = '0000000007' name = 'hello5'  color = 'purple' )
                        ).

*It's possible to use multiple internal table together.
*But they have to have same number of rows.
*It works like multiple Itab combined together and create big one ITAB, and then sort the big ITAB.
*lt_sort has row indexes.
data(lt_sort) = cl_abap_itab_utilities=>virtual_sort(
                        im_virtual_source = value #(
                                                ( source = REF #( lt_product_name )
                                                  components = value #( ( name = 'name' descending = abap_true ) )
                                                )
                                                ( source = REF #( lt_product_color )
                                                  components = value #( ( name = 'color' descending = abap_true ) )
                                                )
                         )
                 ).


LOOP AT lt_sort ASSIGNING FIELD-SYMBOL(<fs>).

  APPEND lt_product[ <fs> ] TO lt_sorted_data.

ENDLOOP.

cl_demo_output=>display(
  EXPORTING
    data = lt_sorted_data
    name = 'lt_sorted_data'
).
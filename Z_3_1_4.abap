*&---------------------------------------------------------------------*
*& Report Z_3_1_4
*&---------------------------------------------------------------------*
*&  3.1.4 Filling Internal Tables from Other Tables Using FOR
*&  3.1.5 Creating short-lived Variables Using LET
*&---------------------------------------------------------------------*
REPORT z_3_1_4.

data(lr_disp) = cl_demo_output=>new( ).

TYPES: BEGIN OF ty_s_city,
  name TYPE string,
  population TYPE i,
  desc TYPE string,
END OF ty_s_city.

TYPES: BEGIN OF ty_s_area,
  name TYPE string,
  area TYPE i,
END OF ty_s_area.

TYPES: ty_t_city TYPE STANDARD TABLE OF ty_s_city WITH KEY name,
       ty_t_area TYPE STANDARD TABLE OF ty_s_area WITH KEY name.


DATA(lt_city1) = VALUE ty_t_city(
        ( name = 'SEOUL' population = 10000000  )
        ( name = 'GYUNGGI' population = 11000000  )
        ).

DATA(lt_area1) = VALUE ty_t_area(
        ( name = 'SEOUL' area = 1234534 )
        ( name = 'GYUNGGI' area = 24542635 )
        ( name = 'GANGWON' area = 23423455 )
).

*Copy fields with same field name
DATA(lt_city2) = VALUE ty_t_city(
  FOR ls_city IN lt_city1   "ls_city -> work area. lt_city1 -> internal table
  ( name = ls_city-name population = ls_city-population )
).

lr_disp->begin_section( |Copy fields with same field name| )->write_data( lt_city2 ).

TYPES: BEGIN OF ty_s_city_total,
  city_name       TYPE string,
  total_population  TYPE i,
      END OF ty_s_city_total,
  ty_t_city_total TYPE TABLE OF ty_s_city_total WITH KEY city_name.

*Copy fields with different field name
DATA(lt_city3) = VALUE ty_t_city_total(
  FOR ls_city IN lt_city1
  ( city_name = ls_city-name  total_population = ls_city-population )
).

lr_disp->begin_section( |Copy fields with different field name| )->write_data( lt_city3 ).

"Where (condition)
DATA(lt_city4) = VALUE ty_t_city(
  FOR ls_city IN lt_city1 WHERE ( population > 10000000 )
  ( name = ls_city-name population = ls_city-population )
).

lr_disp->begin_section( |Where (condition)| )->write_data( lt_city4 ).


*Nested FOR  ~ IN
DATA(lt_city5) = VALUE ty_t_city(
  FOR ls_city IN lt_city1
  FOR ls_area IN lt_area1 WHERE ( name = ls_city-name )
  ( name = ls_city-name )
).
lr_disp->begin_section( |Nested FOR  ~ IN | )->write_data( lt_city5 ).


"Data manipulation using LET keyword in FOR ~ IN loop.
DATA: lv_index TYPE syst_tabix.

DATA(lt_city6) = VALUE ty_t_city(
  FOR ls_city IN lt_city1 INDEX INTO lv_index2
  LET lv_desc = | city name : { ls_city-name }, population: { ls_city-population } |
  IN desc = lv_desc  "variables in LET come after 'IN' keyword
  ( name = ls_city-name population = ls_city-population )  "Rest of the fields come in parenthesis
).
lr_disp->begin_section( |Data manipulation using LET keyword in FOR ~ IN loop| )->write_data( lt_city6 ).


*Filling range table using FOR.
TYPES: BEGIN OF ty_s_sample,
  productid TYPE char10,
  name      TYPE string,
  END OF ty_s_sample,
  ty_t_sample TYPE TABLE OF ty_s_sample WITH KEY productid.

DATA(lt_products) = VALUE ty_t_sample(
                            ( productid = '0000000001' name = 'Iron' )
                            ( productid = '0000000002' name = 'Jerky' )
                            ( productid = '0000000003' name = 'Salmon' )
                            ( productid = '0000000004' name = 'Smartphone' )
                            ( productid = '0000000005' name = 'Laptop' )
                            ( productid = '0000000006' name = 'Headphone' )
                    ).


TYPES: ty_t_values TYPE RANGE OF char10.

DATA(lr_products) = VALUE ty_t_values(
  FOR ls_product IN lt_products
  LET s = 'I'
      o = 'EQ'
  IN sign   = s
     option = o
  ( low = ls_product-productid )
).

lr_disp->begin_section( |Filling range variable using FOR| )->write_data( lr_products ).


"Filling range table using VALUE and LOOP
DATA: lt_range TYPE RANGE OF char10.
LOOP AT lt_products ASSIGNING FIELD-SYMBOL(<fs>).

  APPEND VALUE #( sign = 'I' option = 'EQ' low = <fs>-productid high = '' ) TO lt_range.

ENDLOOP.

lr_disp->begin_section( |Filling range table using VALUE and LOOP| )->write_data( lr_products ).

lr_disp->display( ).
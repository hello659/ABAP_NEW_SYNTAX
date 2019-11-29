*&---------------------------------------------------------------------*
*& Report Z_3_1_3
*&---------------------------------------------------------------------*
*&  3.1.3 Filling Structures and Internal Tables While Creating Them USING VALUE
*&---------------------------------------------------------------------*
REPORT z_3_1_3.


TYPES:BEGIN OF ty_s_user,
  id   TYPE string,
  name TYPE string,
  END OF ty_s_user.

"table type has to have key to use inline declaration
TYPES: ty_t_user TYPE  TABLE OF ty_s_user with key id.

DATA: ls_user01 TYPE ty_s_user,
      lt_users01  TYPE TABLE OF ty_s_user.


*If variables are already typed you can use 'VALUE #'
ls_user01 = VALUE #( id = 'user01' name = 'Kim' ).
lt_users01 = VALUE #(
                    ( id = 'user02' name = 'Lee' )
                    ( id = 'user03' name = 'Park' )
                    ( id = 'user04' name = 'Choi' )
                  ).

*Have to set type after VALUE.
*Because inline-declared variables are not typed yet.
DATA(ls_user02) = VALUE ty_s_user( id = 'user05' name = 'Raj' ).
data(lt_users02) = VALUE ty_t_user(    "table type을 사용
                    ( id = 'user06' name = 'Steve' )
                    ( id = 'user07' name = 'Trevor' )
                    ( id = 'user08' name = 'Jake' )
                  ).


BREAK-POINT.
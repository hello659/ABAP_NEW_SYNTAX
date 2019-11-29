*&---------------------------------------------------------------------*
*& Report Z_3_1_7
*&---------------------------------------------------------------------*
*&  3.1.7 New Mathematical Operators
*&---------------------------------------------------------------------*
REPORT Z_3_1_7.
*Supported after S4HANA 1811 cloud version.

*data: lv_int1 type i,
*      lv_int2 type i,
*      lv_float type f.
*
*lv_int1 = 10.
*lv_int1 += 10.
*WRITE:/ lv_int1.
*
*
*lv_float = '10.0'.
*lv_float /= 3.
*WRITE:/ lv_float.
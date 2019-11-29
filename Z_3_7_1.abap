*&---------------------------------------------------------------------*
*& Report Z_3_7_1
*&---------------------------------------------------------------------*
*&  Predictive Search Helps
*&---------------------------------------------------------------------*
REPORT z_3_7_1.
TABLES: snwd_employees.

PARAMETERS: p_demo TYPE snwd_first_name MATCHCODE OBJECT yfuzzy.

SELECT-OPTIONS so_demo FOR snwd_employees-employee_id MATCHCODE OBJECT yfuzzy.
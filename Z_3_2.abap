*&---------------------------------------------------------------------*
*& Report Z_3_2
*&---------------------------------------------------------------------*
*&  3.2 String Processing
*&   All source codes comes from SAP documents.
*&---------------------------------------------------------------------*
REPORT z_3_2.


"WIDTH
WRITE:/ 'WIDTH'.
DATA(lv_width) = |/{ CONV decfloat34( 1234 / 10 ) WIDTH = 20 }/|.
WRITE:/ lv_width.

ULINE.

"ALIGN
WRITE:/'ALIGN'.
DATA(lv_align) = |/{ 1 WIDTH = 5 ALIGN = RIGHT }/|.
WRITE:/ lv_align.
lv_align = |/{ 1 WIDTH = 5 ALIGN = LEFT }/|.
WRITE:/ lv_align.
lv_align = |/{ 1 WIDTH = 5 ALIGN = CENTER }/|.
WRITE:/ lv_align.

ULINE.

"PAD(Fill space)
WRITE:/'PAD'.
DATA(lv_pad) = |{ 'X' ALIGN = RIGHT WIDTH = 10 PAD = '_' }|.
WRITE:/ lv_pad.

ULINE.

"CASE ( Lowercase <-> Uppercase ) ))
WRITE:/'CASE'.
DATA(lv_case) = |{ 'ABCDEFG' CASE = LOWER }| .
WRITE:/ lv_case.
lv_case = |{ 'abcdefgg' CASE = UPPER }| .
WRITE:/ lv_case.
lv_case = |{ 'abcdefggAAAAGGGDDDF' CASE = RAW }| .
WRITE:/ lv_case.

ULINE.


"SIGN( +/- sign ))
WRITE:/'SIGN'.
DATA(lv_sign) = |\|{ 1 SIGN = LEFT }\|{ -1 SIGN = LEFT }\||.
WRITE:/ lv_sign.
lv_sign = |\|{ 1 SIGN = LEFTPLUS }\|{ -1 SIGN = LEFTPLUS }\||.
WRITE:/ lv_sign.
lv_sign = |\|{ 1 SIGN = LEFTSPACE }\|{ -1 SIGN = LEFTSPACE }\||.
WRITE:/ lv_sign.
lv_sign = |\|{ 1 SIGN = RIGHT }\|{ -1 SIGN = RIGHT }\||.
WRITE:/ lv_sign.
lv_sign = |\|{ 1 SIGN = RIGHTPLUS }\|{ -1 SIGN = RIGHTPLUS }\||.
WRITE:/ lv_sign.
lv_sign = |\|{ 1 SIGN = RIGHTSPACE }\|{ -1 SIGN = RIGHTSPACE }\||.
WRITE:/ lv_sign.

ULINE.


"EXPONENT
WRITE:/'EXPONENT'.
DATA(lv_exponent) = |{ CONV f( 2 / 3 ) }|.
WRITE:/ lv_exponent.
lv_exponent = |{ CONV f( 2 / 3 ) EXPONENT = -1 }|.
WRITE:/ lv_exponent.

ULINE.

"DECIMALS
WRITE:/'DECIMALS'.
DATA(lv_decimals) = |{ - 2 / 3   DECIMALS = 3 }, {
                CONV decfloat34( - 2 / 3 ) DECIMALS = 4 }, {
                CONV          f( - 2 / 3 ) DECIMALS = 5 }|.

WRITE:/ lv_decimals.

ULINE.


"ZERO( print 0 value or not )
WRITE:/'ZERO'.
DATA(lv_zero) = |{ 0 ZERO = NO }, { 0 ZERO = YES }|.
WRITE:/ lv_zero.

ULINE.


"XSD( true / false)
WRITE:/'XSD(true / false)'.
DATA:
  flag1 TYPE xsdboolean VALUE abap_true,
  flag2 TYPE xsdboolean VALUE abap_false.

DATA(lv_xsd) = |flag1 : { flag1 XSD = YES }, flag2 : { flag2 XSD = YES }|.
WRITE:/ lv_xsd.

ULINE.


"STYLE
WRITE:/'STYLE'.
DATA(lv_style) = |{ CONV decfloat34( '123456' ) STYLE = SIMPLE }|.
WRITE:/ lv_style.
lv_style = |{ CONV decfloat34( '123456' ) STYLE = SIGN_AS_POSTFIX }|.
WRITE:/ lv_style.
lv_style = |{ CONV decfloat34( '123456' ) STYLE = SCALE_PRESERVING }|.
WRITE:/ lv_style.
lv_style = |{ CONV decfloat34( '123456' ) STYLE = SCIENTIFIC }|.
WRITE:/ lv_style.
lv_style = |{ CONV decfloat34( '123456' ) STYLE = SCIENTIFIC_WITH_LEADING_ZERO }|.
WRITE:/ lv_style.
lv_style = |{ CONV decfloat34( '123456' ) STYLE = SCALE_PRESERVING_SCIENTIFIC }|.
WRITE:/ lv_style.
lv_style = |{ CONV decfloat34( '123456' ) STYLE = ENGINEERING }|.
WRITE:/ lv_style.

ULINE.

"Currency
WRITE:/'Currency'.
DATA(lv_currency) = |{ 12345678 CURRENCY = 'EUR' }|.
WRITE:/ lv_currency.
lv_currency = |{ 12345678 CURRENCY = 'KRW' }|.
WRITE:/ lv_currency.
lv_currency = |{ 12345678 CURRENCY = 'USD' }|.
WRITE:/ lv_currency.

ULINE.



"Number
WRITE:/'Number'.
DATA(lv_number) = |{ 1000000 NUMBER = RAW }|.
WRITE:/ lv_number.
lv_number = |{ 1000000 NUMBER = USER }|.
WRITE:/ lv_number.
lv_number = |{ 1000000 NUMBER = ENVIRONMENT }|.
WRITE:/ lv_number.

ULINE.

"ALPHA
WRITE:/'CONVERSION ALPHA'.
DATA: lv_num TYPE n LENGTH 10,
      lv_c   TYPE c LENGTH 10.

lv_num = '0000000001'.
lv_c = lv_num.
WRITE:/ lv_c.

lv_c = |{ lv_c ALPHA = OUT }|.
WRITE:/ 'ALPHA OUT : ', lv_c.
lv_c = |{ lv_num ALPHA = IN }|.
WRITE:/ 'ALPHA IN : ' , lv_c.

ULINE.

"DATE
WRITE:/'DATE'.
DATA(lv_date) = |{ sy-datlo DATE = RAW }|.
WRITE:/ lv_date.
lv_date = |{ sy-datlo DATE = ISO }|.
WRITE:/ lv_date.
lv_date = |{ sy-datlo DATE = USER }|.
WRITE:/ lv_date.
lv_date = |{ sy-datlo DATE = ENVIRONMENT }|.
WRITE:/ lv_date.

ULINE.

"TIME
WRITE:/'TIME'.
DATA(lv_time) = |{ sy-timlo TIME = RAW }|.
WRITE:/ lv_time.
lv_time = |{ sy-timlo TIME = ISO }|.
WRITE:/ lv_time.
lv_time = |{ sy-timlo TIME = USER }|.
WRITE:/ lv_time.
lv_time = |{ sy-timlo TIME = ENVIRONMENT }|.

ULINE.


"TIMESTAMP
WRITE:/'TIMESTAMP'.
GET TIME STAMP FIELD DATA(tmstmp).
DATA(lv_timestamp) = |{ tmstmp TIMESTAMP = SPACE }|.
WRITE:/ lv_timestamp.
lv_timestamp = |{ tmstmp TIMESTAMP = ISO }|.
WRITE:/ lv_timestamp.
lv_timestamp = |{ tmstmp TIMESTAMP = USER }|.
WRITE:/ lv_timestamp.
lv_timestamp = |{ tmstmp TIMESTAMP = ENVIRONMENT }|.
WRITE:/ lv_timestamp.
lv_timestamp = |{ tmstmp }|.
WRITE:/ lv_timestamp.

ULINE.

"TIMEZONE
WRITE:/'TIMEZONE'.
DATA(lv_TIMEZONE) = |{ tmstmp TIMESTAMP = ISO }|.
WRITE:/ lv_timezone.
lv_timezone = |{ tmstmp TIMESTAMP = ISO TIMEZONE = 'CET' }|.
WRITE:/ lv_timezone.
lv_timezone = |{ tmstmp TIMESTAMP = ISO TIMEZONE = 'UTC+9' }|.
WRITE:/ lv_timezone.

ULINE.

"COUNTRY
WRITE:/'COUNTRY'.
DATA(lv_COUNTRY) = |{ 1000000 COUNTRY = 'DE ' }|.  "T005X-LAND for COUNTRY
WRITE:/ lv_COUNTRY.
lv_COUNTRY = |{ 1000000 COUNTRY = 'KR ' }|.
WRITE:/ lv_COUNTRY.
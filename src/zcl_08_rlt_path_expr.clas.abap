CLASS zcl_08_rlt_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_08_RLT_PATH_EXPR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
    FROM Z08_C_EmployeeQuery
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           Description,
           AssistantName,
           \_Department\_Head-LastName as HeadName

    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.

CLASS zcl_08_parameter DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_08_parameter IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
    FROM /LRN/C_Employee_Par(
    p_target_curr = 'JPY'
* , p_date = @sy-datum
    )
    FIELDS employeeid,
                 firstname,
                 lastname,
                 departmentid,
                 DepartmentDescription,
                 AssistantName,
                 \_Department\_Head-LastName AS HeadName,
                 AnnualSalaryConverted,
                 CurrencyCode
          INTO TABLE @FINAL(result).

    out->write( result ).
  ENDMETHOD.
ENDCLASS.

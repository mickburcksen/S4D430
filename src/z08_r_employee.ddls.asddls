
@AbapCatalog: {
  dataMaintenance: #RESTRICTED,
  viewEnhancementCategory: [#NONE]
  }
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Entitity)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #D,
  sizeCategory: #M,
  dataClass: #MASTER
}
define view entity Z08_R_Employee
  as select from /lrn/employ_dep
  association [1..1] to Z08_R_Department as _Department on $projection.DepartmentId = _Department.Id
{
  key employee_id           as EmployeeId,
      first_name            as FirstName,
      last_name             as LastName,
      birth_date            as BirthDate,
      entry_date            as EntryDate,
      department_id         as DepartmentId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary as AnnualSalary,
      @EndUserText.label: 'Currency Key'
      currency_code as CurrencyCode,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      
      _Department
      
      
}

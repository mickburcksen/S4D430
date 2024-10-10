@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z08_C_EmployeeQueryP
with parameters
p_target_curr : /dmo/currency_code,
@EndUserText.label: 'Date of evaluation'
@Environment.systemField: #SYSTEM_DATE
p_date : abap.dats
as select from Z08_R_Employee
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentId,

      _Department.Description                                                                   as DepartmentDescription,
      //_Department._Assistant.LastName as AssistantName,
      concat_with_space( _Department._Assistant.FirstName, _Department._Assistant.LastName, 1 ) as AssistantName,

      division( dats_days_between( EntryDate,
$parameters.p_date ),
365,
1 ) as CompanyAffiliation,
      /* Associations */
      @EndUserText.label: 'Emplyee Role'
      case EmployeeId
      when _Department.HeadId then 'H'
      when _Department.AssistantId then 'A'
      else ' '
      end                                                                                       as EmployeeRole,
      @EndUserText.label: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount=> AnnualSalary,
      source_currency => CurrencyCode,
      target_currency => $projection.CurrencyCode,
      exchange_rate_date => $parameters.p_date
      )                                                                                         as AnnualSalaryConverted,
      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( $projection.AnnualSalaryConverted as abap.fltp )
      / 12.0                                                                                    as MonthlySalaryConverted,
      // CurrencyCode,
      // cast( 'USD' as /dmo/currency_code ) as CurrencyCodeUSD,
      $parameters.p_target_curr  
      
      
                                                                     as CurrencyCode
                                                                     
      

}

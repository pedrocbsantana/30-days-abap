@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS views studying.'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_EMPLOYEE_JP as select from zemployee_jp
{
    key employee_id as EmployeeId,
    name as Name,
    salary as Salary
}

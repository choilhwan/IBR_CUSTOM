@EndUserText.label: '[MM] 구매오더 선금 업데이트 여부 필드 - Value Help View'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMM_I_DownpayUpdated_VH
  as select from zmm_a_downpay_vh
{
 @ObjectModel.text.element: [ 'text' ]
  key code as Code,
 
      text as Text
}

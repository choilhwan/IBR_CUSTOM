
@EndUserText.label: '[MM]Abstact View Root(HEAD)'
define root abstract  entity  ZMM_D_PAYLOAD_CJWMS_HD
{
    key hd_key :  abap.char(1);
    _Item : composition [0..*] of ZMM_D_PAYLOAD_CJWMS_ITEM;
    
}

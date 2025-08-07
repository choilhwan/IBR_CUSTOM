
define abstract  entity  ZMM_D_PAYLOAD_CJWMS_ITEM
{
    key item_key :  abap.char(1);
    key hd_key : abap.char(1);
    Product : matnr; 
    _Header : association to parent ZMM_D_PAYLOAD_CJWMS_HD on $projection.hd_key = _Header.hd_key;
}

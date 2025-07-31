@EndUserText.label: '[MM] Product Abstact View Root(HEAD)'
define abstract entity ZMM_D_PRODUCT_C
{
  key dummy               : abap.char(4);
  key product             : matnr   ;
      _head               : association to parent ZMM_D_PRODUCT_H on $projection.dummy = _head.DUMMY;
}

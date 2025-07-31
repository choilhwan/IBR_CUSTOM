@EndUserText.label: '[MM] Product Abstact View Root(HEAD)'
define root abstract entity ZMM_D_PRODUCT_H
{
  key DUMMY : abap.char(4);  
     _products  : composition [0..*] of ZMM_D_PRODUCT_C;
   
      //
      //    key dummy : abap.char(1) ;
      //    product : composition [1..*] of ZMM_D_PRODUCT_C;
}

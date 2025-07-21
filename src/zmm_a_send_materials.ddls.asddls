@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '[MM] SEND MATERIAL MASTER TO CJ WMS'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZMM_A_SEND_MATERIALS as select from I_ProductPlantBasic as _ProductPlant 
 inner join I_Product as _product on _ProductPlant.Product = _product.Product
 inner join I_ProductGroupText_2 as _productgrouptext on _product.ProductGroup =  _productgrouptext.ProductGroup and _productgrouptext.Language = '3'
association [0..1] to  I_ProductDescription as _desc on $projection.Product = _desc.Product and  _desc.Language = '3' 
//association [0..1] to  I_ProductGroupText_2 as _grouptext on $projection.productGroup = _grouptext.ProductGroup and _grouptext.Language = '3'
{

    key _ProductPlant.Product                                as Product,
                                   
    key _ProductPlant.Plant                                  as Plant,
    
    _ProductPlant.YY1_TransferDate_PLT                       as TransferDate,
    
    _ProductPlant.YY1_TransferStatus_PLT                     as TransferStatus,
    
    _desc.ProductDescription                                 as ProductDescription,
                                    
    _product.ProductGroup                                    as ProductGroup,
                                    
    _product.BaseUnit                                        as BaseUnit,
    
    _productgrouptext.ProductGroupName                       as ProductGroupName
   
}


 
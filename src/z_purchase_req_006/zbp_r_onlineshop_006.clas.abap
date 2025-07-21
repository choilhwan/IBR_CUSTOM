class ZBP_R_ONLINESHOP_006 definition
  public
  abstract
  final
  for behavior of ZR_ONLINESHOP_006 .

public section.
TYPES: BEGIN OF ts_mapping,
     order_uuid type uuid,
     pid type abp_behv_pid,
     END OF ts_mapping,
     tt_mapping type table of ts_mapping.

 class-DATA cv_pr_mapped TYPE tt_mapping.


protected section.
private section.
ENDCLASS.



CLASS ZBP_R_ONLINESHOP_006 IMPLEMENTATION.
ENDCLASS.

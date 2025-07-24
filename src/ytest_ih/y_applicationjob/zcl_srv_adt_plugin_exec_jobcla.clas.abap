class ZCL_SRV_ADT_PLUGIN_EXEC_JOBCLA definition
  public
  create public .

public section.

  interfaces IF_HTTP_SERVICE_EXTENSION .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SRV_ADT_PLUGIN_EXEC_JOBCLA IMPLEMENTATION.


  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.
    types: lty_char   type c length 100,
           ltyt_range type range of lty_char.
    data: lo_definition type ref to if_apj_dt_exec_object,
          lo_runtime    type ref to if_apj_rt_exec_object,
          lt_values     type if_apj_rt_exec_object=>tt_templ_val,
          begin of ls_value,
            param type string,
            range type ltyt_range,
          end of ls_value,
          lv_params type string.
    data(lt_form) = request->get_form_fields( ).
    loop at lt_form reference into data(lo_form).
      translate lo_form->name to upper case.
    endloop.
    read table lt_form into data(ls_form) with key name = 'CLASSNAME'.
    if sy-subrc eq 0.
      try.
          translate ls_form-value to upper case.
          create object lo_definition type (ls_form-value).
          create object lo_runtime type (ls_form-value).
          lo_definition->get_parameters( importing et_parameter_def = data(lt_params) ).
        catch cx_root into data(lo_root).
          response->set_text( |Class { ls_form-value } is invalid| ).
          response->set_status( 400 ).
          return.
      endtry.

      case request->get_method( ).
        when 'GET'.
          loop at lt_params into data(ls_param).
            lv_params = lv_params &&
                        cond #( when lv_params is not initial then ',' && cl_abap_char_utilities=>newline ) &&
                        |"{ ls_param-selname }":| &&
                        cond #( when ls_param-kind = 'S' then |[\{"SIGN":"I","OPTION":"EQ","LOW":"","HIGH":""\}]| else |""| ).
          endloop.
          lv_params = |\{{ cl_abap_char_utilities=>newline }{ lv_params }{ cl_abap_char_utilities=>newline }\}|.
          response->set_text( lv_params ).
        when 'POST'.
          try.
              data(lv_body) = request->get_text( ).
              loop at lt_params into ls_param.
                /ui2/cl_json=>deserialize( exporting json          = lv_body
                                                     name_mappings = value #( ( abap = cond #( when ls_param-kind = 'S' then 'RANGE' else 'PARAM' )
                                                                                json = ls_param-selname ) )
                                           changing  data          = ls_value ).
                if ls_param-kind = 'S'.
                  loop at ls_value-range into data(ls_rng).
                    append value #( selname = ls_param-selname sign = ls_rng-sign option = ls_rng-option low = ls_rng-low high = ls_rng-high ) to lt_values.
                  endloop.
                elseif ls_value-param is not initial.
                  append value #( selname = ls_param-selname low = ls_value-param ) to lt_values.
                endif.
                clear ls_value.
              endloop.
              lo_runtime->execute( lt_values ).
            catch cx_root.
              response->set_status( 400 ).
              return.
          endtry.
      endcase.
      response->set_content_type( 'application/json' ).
      response->set_status( 200 ).
    endif.

  endmethod.
ENDCLASS.

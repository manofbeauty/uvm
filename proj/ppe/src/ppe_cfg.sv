//
// Template for UVM-compliant configuration class
//

`ifndef PPE_CFG__SV
`define PPE_CFG__SV

class ppe_cfg extends uvm_object; 

   // Define test configuration parameters (e.g. how long to run)
   rand int num_trans;
   rand int num_scen;
   // ToDo: Add other environment configuration varaibles

   constraint cst_num_trans_default {
      num_trans inside {[1:7]};
   }
   constraint cst_num_scen_default {
      num_scen inside {[1:2]};
   }
   // ToDo: Add constraint blocks to prevent error injection

   `uvm_object_utils_begin(ppe_cfg)
      `uvm_field_int(num_trans,UVM_ALL_ON) 
      `uvm_field_int(num_scen,UVM_ALL_ON)
      // ToDo: add properties using macros here

   `uvm_object_utils_end

   extern function new(string name = "");
  
endclass: ppe_cfg

function ppe_cfg::new(string name = "");
   super.new(name);
endfunction: new


`endif // PPE_CFG__SV

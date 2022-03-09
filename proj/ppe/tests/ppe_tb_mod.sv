//
// Template for UVM-compliant Program block

`ifndef PPE_TB_MOD__SV
`define PPE_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module ppe_tb_mod;

import uvm_pkg::*;

`include "ppe_ral_env.sv"
`include "ppe_test.sv"  //ToDo: Change this name to the testcase file-name

// ToDo: Include all other test list here
   typedef virtual tx_inf v_if1;
   typedef virtual tx_slv_inf v_if2;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",ppe_top.mst_if); 
      uvm_config_db #(v_if2)::set(null,"","slv_if",ppe_top.slv_if);
      run_test();
   end

endmodule: ppe_tb_mod

`endif // PPE_TB_MOD__SV


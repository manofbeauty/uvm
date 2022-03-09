//
// Template for UVM-compliant verification environment
//

`ifndef PPE__SV
`define PPE__SV




`include "mstr_slv_src.incl"

`include "ppe_cfg.sv"


`include "tx_sb.sv"

`include "ppe_cov.sv"

`include "mon_2cov.sv"


`include "ral_single.sv"
`include "ral_ppe.sv"
// ToDo: Add additional required `include directives

`endif // PPE__SV

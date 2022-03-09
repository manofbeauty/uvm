//
// Template for UVM-compliant testcase

`ifndef TEST__SV
`define TEST__SV

typedef class ppe_ral_env;

class ppe_test extends uvm_test;

  `uvm_component_utils(ppe_test)

  ppe_ral_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ppe_ral_env::type_id::create("env", this);
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase",
                    "default_sequence", tx_sqr_sequence_library::get_type()); 
  endfunction

endclass : ppe_test

`endif //TEST__SV


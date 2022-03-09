//
// Template for UVM-compliant generic slave agent component
//

`ifndef TX_SLAVE__SV
`define TX_SLAVE__SV


class tx_slave extends uvm_agent;
   // ToDo: add sub environment properties here
   protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   tx_slv_drv slv_drv;
   tx_slv_mon slv_mon;
   tx_slv_sqr slv_seqr;
   typedef virtual tx_slv_inf vif;
   vif slv_agt_if;

   `uvm_component_utils_begin(tx_slave)
    //ToDo: add field utils macros here if required
   `uvm_component_utils_end

      // ToDo: Add required short hand override method

   function new(string name = "slv_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      slv_mon = tx_slv_mon::type_id::create("mon", this);
      if (is_active == UVM_ACTIVE) begin
         slv_drv = tx_slv_drv::type_id::create("drv", this);
         slv_seqr = tx_slv_sqr::type_id::create("slv_seqr",this);
      end
      if (!uvm_config_db#(vif)::get(this, "", "slv_if", slv_agt_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"slv_drv","slv_if",slv_drv.drv_if);
      uvm_config_db# (vif)::set(this,"mast_mon","slv_if",slv_mon.mon_if);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
		  
	   	  slv_drv.seq_item_port.connect(slv_seqr.seq_item_export);
      end
   endfunction

   virtual function void start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);

      //ToDo :: Implement here

   endfunction

   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
     // phase.raise_objection(this,"slv_agt_main"); //Raise/drop objections in sequence file

      //ToDo :: Implement here

      // phase.drop_objection(this);
   endtask

   virtual function void report_phase(uvm_phase phase);
      super.report_phase(phase);

      //ToDo :: Implement here

   endfunction

endclass: tx_slave

`endif // TX_SLAVE__SV

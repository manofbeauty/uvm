//
// Template for UVM-compliant physical-level monitor
//

`ifndef TX_MON__SV
`define TX_MON__SV


typedef class tx_xaction;
typedef class tx_mon;

class tx_mon_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use a task if callbacks can be blocking


   // Called at start of observed transaction
   virtual function void pre_trans(tx_mon xactor,
                                   tx_xaction tr);
   endfunction: pre_trans


   // Called before acknowledging a transaction
   virtual function pre_ack(tx_mon xactor,
                            tx_xaction tr);
   endfunction: pre_ack
   

   // Called at end of observed transaction
   virtual function void post_trans(tx_mon xactor,
                                    tx_xaction tr);
   endfunction: post_trans

   
   // Callback method post_cb_trans can be used for coverage
   virtual task post_cb_trans(tx_mon xactor,
                              tx_xaction tr);
   endtask: post_cb_trans

endclass: tx_mon_callbacks

   

class tx_mon extends uvm_monitor;

   uvm_analysis_port #(tx_xaction) mon_analysis_port;  //TLM analysis port
   typedef virtual tx_inf v_if;
   v_if mon_if;
   // ToDo: Add another class property if required
   extern function new(string name = "tx_mon",uvm_component parent);
   `uvm_register_cb(tx_mon,tx_mon_callbacks);
   `uvm_component_utils_begin(tx_mon)
      // ToDo: Add uvm monitor member if any class property added later through field macros

   `uvm_component_utils_end
      // ToDo: Add required short hand override method


   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task tx_monitor();

endclass: tx_mon


function tx_mon::new(string name = "tx_mon",uvm_component parent);
   super.new(name, parent);
   mon_analysis_port = new ("mon_analysis_port",this);
endfunction: new

function void tx_mon::build_phase(uvm_phase phase);
   super.build_phase(phase);
   //ToDo : Implement this phase here

endfunction: build_phase

function void tx_mon::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   uvm_config_db#(v_if)::get(this, "", "mon_if", mon_if);
endfunction: connect_phase

function void tx_mon::end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase); 
   //ToDo: Implement this phase here

endfunction: end_of_elaboration_phase


function void tx_mon::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo: Implement this phase here

endfunction: start_of_simulation_phase


task tx_mon::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   // ToDo: Implement reset here

endtask: reset_phase


task tx_mon::configure_phase(uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure your component here
endtask:configure_phase


task tx_mon::run_phase(uvm_phase phase);
   super.run_phase(phase);
  // phase.raise_objection(this,""); //Raise/drop objections in sequence file
   fork
      tx_monitor();
   join
  // phase.drop_objection(this);

endtask: run_phase


task tx_mon::tx_monitor();
   forever begin
      tx_xaction tr;
      // ToDo: Wait for start of transaction

      `uvm_do_callbacks(tx_mon,tx_mon_callbacks,
                    pre_trans(this, tr))
      `uvm_info("ppe_MONITOR", "Starting transaction...",UVM_LOW)
      // ToDo: Observe first half of transaction

      // ToDo: User need to add monitoring logic and remove $finish
      `uvm_info("ppe_MONITOR"," User need to add monitoring logic ",UVM_LOW)
	  $finish;
      `uvm_do_callbacks(tx_mon,tx_mon_callbacks,
                    pre_ack(this, tr))
      // ToDo: React to observed transaction with ACK/NAK
      `uvm_info("ppe_MONITOR", "Completed transaction...",UVM_HIGH)
      `uvm_info("ppe_MONITOR", tr.sprint(),UVM_HIGH)
      `uvm_do_callbacks(tx_mon,tx_mon_callbacks,
                    post_trans(this, tr))
      mon_analysis_port.write(tr);
   end
endtask: tx_monitor

`endif // TX_MON__SV

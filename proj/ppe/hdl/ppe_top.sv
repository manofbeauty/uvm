//
// Template for Top module
//

`ifndef PPE_TOP__SV
`define PPE_TOP__SV

module ppe_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 50;

   always 
      begin
         #(sim_cycle/2) clk = ~clk;
      end

   tx_inf mst_if(clk,rst);
   tx_slv_inf slv_if(clk,rst);
   
   ppe_tb_mod test(); 
   
   // ToDo: Include Dut instance here
  
   //Driver reset depending on rst_delay
   initial
      begin
         clk = 0;
         rst = 0;
      #1 rst = 1;
         repeat (rst_delay) @(clk);
         rst = 1'b0;
         @(clk);
   end

endmodule: ppe_top

`endif // PPE_TOP__SV

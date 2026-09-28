module channel_model #(CHANNEL_WIDTH=39) (
 input [CHANNEL_WIDTH-1:0] din,
 input single_error_inject,
 input double_error_inject,
 input [$clog2(CHANNEL_WIDTH)-1:0] error_pos1, error_pos2,
 output logic [CHANNEL_WIDTH-1:0] dout
 );

 // add a formal clock to support concurrent SVA syntax
 logic clk;

 default clocking default_clk @(posedge clk);
 endclocking

 // TO DO: Complete the below auxiliary code for channel model
 always_comb begin
  dout = din;
 end


 // TO DO: Complete the SVA properties for channel model

    // constrain the valid error positions 
    ASSUME_VALID_ERROR_POSITION1: assume property ((error_pos1 >=0) && (error_pos1 < CHANNEL_WIDTH));
    ASSUME_VALID_ERROR_POSITION2: assume property ((error_pos2 >=0) && (error_pos2 < CHANNEL_WIDTH));

    // different error positions for double errors 
   // ASSUME_UNIQUE_DOUBLE_ERROR_POSITION: assume property (double_error_inject |-> (error_pos1 != error_pos2));

    // if a single error is injected, don't inject double error at the same time
  //  ASSUME_SINGLE_OR_DOUBLE_ERROR: assume property ();

    wire [CHANNEL_WIDTH-1:0] error_mask;
    assign error_mask = dout ^ din;
    // check if a single injected error causes 1 bit flip in dout
   // ASSERT_SINGLE_ERROR_PRESENT: assert property ();

    // check if a double injected error causes 2 bit flips in dout
  //  ASSERT_DOUBLE_ERROR_PRESENT: assert property ();

   // check if no error injected, then din matches dout
  //  ASSERT_NO_ERROR_PRESENT: assert property ();
endmodule

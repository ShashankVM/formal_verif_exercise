module channel_model #(CHANNEL_WIDTH=39) (
 input [CHANNEL_WIDTH-1:0] din,
 input single_error_inject,
 input double_error_inject,
 input [$clog2(CHANNEL_WIDTH)-1:0] error_pos1, error_pos2,
 output logic [CHANNEL_WIDTH-1:0] dout
 );

 // TO DO: Write the auxiliary code for channel model



 // TO DO: Write the SVA properties for channel model

   // write a reusable property for valid error position
   // property valid_error_pos(error_pos);

   // endproperty

    // constrain the valid error positions using the reusable property
   // ASSUME_VALID_ERROR_POSITION1:
  //  ASSUME_VALID_ERROR_POSITION2:

    // different error positions for double errors 
  //  ASSUME_UNIQUE_DOUBLE_ERROR_POSITION:

    // if a single error is injected, don't inject double error at the same time
  //  ASSUME_SINGLE_OR_DOUBLE_ERROR:

    // check if a single injected error causes 1 bit flip in dout
  //  ASSERT_SINGLE_ERROR_PRESENT:

    // check if a double injected error causes 2 bit flips in dout
  //  ASSERT_DOUBLE_ERROR_PRESENT:

   // check if no error injected, then din matches dout
  //  ASSERT_NO_ERROR_PRESENT:
endmodule

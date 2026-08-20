module channel_model #(CHANNEL_WIDTH=39) (
 input [CHANNEL_WIDTH-1:0] din,
 input single_error_inject,
 input double_error_inject,
 input [$clog2(CHANNEL_WIDTH)-1:0] error_pos1, error_pos2,
 output logic [CHANNEL_WIDTH-1:0] dout
 );

 // TO DO: Write the auxiliary code for channel model

endmodule

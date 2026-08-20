module rvecc_sva  #(
                    parameter DATA_WIDTH = 64,
                    localparam ECC_WIDTH = (DATA_WIDTH == 32) ? ($clog2(DATA_WIDTH) + 2) : ($clog2(DATA_WIDTH) + 1),
                    localparam CHANNEL_WIDTH = DATA_WIDTH + ECC_WIDTH
                    )(
                      input logic [DATA_WIDTH-1:0] din_encoder,
                      input logic [$clog2(CHANNEL_WIDTH)-1:0] error_pos1, error_pos2,
                      input logic decoder_en, single_error_inject, double_error_inject);

    logic [CHANNEL_WIDTH-1:0] encoded_data, received_data;
    logic double_ecc_error;

    logic clk;

    default clocking default_clk @(posedge clk);
    endclocking

    top                                         uut(.din_encoder(din_encoder),
                                                    .error_pos1(error_pos1), 
                                                    .error_pos2(error_pos2), 
                                                    .decoder_en(decoder_en),
                                                    .sed_ded(sed_ded),
                                                    .single_error_inject(single_error_inject),
                                                    .double_error_inject(double_error_inject),
                                                    .encoded_data(encoded_data), 
                                                    .received_data(received_data), 
                                                    .double_ecc_error(double_ecc_error));    


    // constrain the valid error positions

    // different error positions for double errors 

    // if a single error is injected, don't inject double error at the same time


    // prove that a single injected error causes encoded data to be not equal to received data


    // prove that a double injected error causes encoded data to be not equal to received data


    // prove that if no error injected then encoded data matches the received data


    // prove that no errors detected when decoder is disabled


    // prove that if no errors injected, then no errors are detected when decoder is enabled

    
    // prove that all double-errors injected are detected when decoder is enabled

  
    // all single errors injected are detected when decoder is enabled

       
    // cover data is zero


    // cover data is non-zero


    // cover a few error position combinations

  endmodule

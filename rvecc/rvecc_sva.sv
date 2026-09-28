module rvecc_sva  #(
                    parameter DATA_WIDTH = 32,
                    localparam ECC_WIDTH = (DATA_WIDTH == 32) ? ($clog2(DATA_WIDTH) + 2) : ($clog2(DATA_WIDTH) + 1),
                    localparam CHANNEL_WIDTH = DATA_WIDTH + ECC_WIDTH
                    )(
                      input logic [DATA_WIDTH-1:0] din_encoder,
                      input logic [$clog2(CHANNEL_WIDTH)-1:0] error_pos1, error_pos2,
                      input logic decoder_en, sed_ded, single_error_inject, double_error_inject);
    // encoded_data is output of encoder
    // received_data is data received from the channel, and input to the decoder
    // decoded_data is output of decoder
    logic [CHANNEL_WIDTH-1:0] encoded_data, received_data, decoded_data;
    logic single_ecc_error, double_ecc_error;

    // add a formal clock to support concurrent SVA syntax
    logic clk;

    default clocking default_clk @(posedge clk);
    endclocking

    top #(DATA_WIDTH) uut(
                                                    .din_encoder(din_encoder),
                                                    .error_pos1(error_pos1), 
                                                    .error_pos2(error_pos2), 
                                                    .decoder_en(decoder_en),
                                                    .sed_ded(sed_ded),
                                                    .single_error_inject(single_error_inject),
                                                    .double_error_inject(double_error_inject),
                                                    .encoded_data(encoded_data), 
                                                    .received_data(received_data), 
                                                    .decoded_data(decoded_data), 
                                                    .single_ecc_error(single_ecc_error), 
                                                    .double_ecc_error(double_ecc_error));    



 // check if no error injected then encoded data matches the decoded data
 //   ASSERT_NO_ERROR_PRESENT_DECODED_DATA:

 // check if no errors detected or corrected when decoder is disabled
 //   ASSERT_DECODER_ENABLE_FALSE:

    // check if if no errors injected, then no errors are detected when decoder is enabled
 //   ASSERT_NO_FALSE_DOUBLE_ERROR_DETECTION:
//    ASSERT_NO_FALSE_SINGLE_ERROR_DETECTION:
    
    // check if all double-errors injected are detected when decoder is enabled
 //   ASSERT_DOUBLE_ERROR_DETECTION_DOUBLE_ECC_ERROR:

    // check if when double-errors are injected, single_ecc_error remains low
 //   ASSERT_DOUBLE_ERROR_DETECTION_NO_SINGLE_ECC_ERROR:
    
    // in single-error and double-error detection mode when decoder is enabled, single_ecc_error should be low
//    ASSERT_NO_SINGLE_ERROR_CORRECTION_IN_SED_DED:

    // in single-error and double-error detection mode when decoder is enabled, all single errors injected should cause double_ecc_error to go to 1 since single_ecc_error will be low

 //   ASSERT_SINGLE_ERROR_CORRECTION_IN_SED_DED_DOUBLE_ECC_ERROR:

    // in single-error correction mode when decoder is enabled, all single errors injected should cause single_ecc_error to go to 1
 //   ASSERT_SINGLE_ERROR_CORRECTION_IN_NO_SED_DED:
        
    // for single errors injected, double_ecc_error should remain low when sed_ded == 0    
  //  ASSERT_NO_DOUBLE_ERROR_CORRECTION_IN_NO_SED_DED:

  // check if all single errors are corrected - unoptimized
 //  ASSERT_DATA_CORRECTION: assert property ();

    // use a case splitting optimization to quickly check if all possible error positions are corrected. A speedup of 2.5x compared to without case splitting.    
/*   genvar i;
    generate
      for (i = 0; i <= CHANNEL_WIDTH-1; i++) begin : loop_error_pos
        ASSERT_DATA_CORRECTION:
      end
    endgenerate  
 */
    // cover data is zero
    COVER_ALL_0: cover property (encoded_data == 0);

    
    // cover data is non-zero
//    COVER_NON_0: cover property ();

    // cover a few error position combinations
 //   COVER_ERROR_0_POS: cover property ();
 //   COVER_ERROR_CHANNEL_WIDTH_POS: cover property ();

    // cover single error detection and correction
//    COVER_SED_DED_ZERO: cover property ();

    // cover single and double error detection
 //   COVER_SED_DED_ONE: cover property ();
    
  endmodule

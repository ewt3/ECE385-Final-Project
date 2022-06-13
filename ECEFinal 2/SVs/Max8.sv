module Max(
    input logic signed [10:0] in0, in1, in2, in3, in4, in5, in6, in7,
    output logic [2:0] out
);


    
    logic [2:0] max1_0, max1_1, max1_2, max1_3;
    logic [2:0] max2_0, max2_1;
    logic signed [10:0] val1_0, val1_1, val1_2, val1_3;
    logic signed [10:0] val2_0, val2_1;

    
    //[in0, in1, in2, in3, in4, in5, in6, in7];



    always_comb begin
        if(in0>in1) begin
            max1_0 = 0;
            val1_0 = in0;
        end else begin
            max1_0 = 1;
            val1_0 = in1;
        end


        if(in2>in3) begin
            max1_1 = 2;
            val1_1 = in2;
        end else begin
            max1_1 = 3;
            val1_1 = in3;
        end


        if(in4>in5) begin
            max1_2 = 4;
            val1_2 = in4;
        end else begin
            max1_2 = 5;
            val1_2 = in5;
        end


        if(in6>in7) begin
            max1_3 = 6;
            val1_3 = in6;
        end else begin
            max1_3 = 7;
            val1_3 = in7;
        end


        if(val1_0 > val1_1) begin
            max2_0 = max1_0;
            val2_0 = val1_0;
        end else begin
            max2_0 = max1_1;
            val2_0 = val1_1;
        end


        if(val1_2 > val1_3) begin
            max2_1 = max1_2;
            val2_1 = val1_2;
        end else begin
            max2_1 = max1_3;
            val2_1 = val1_3;
        end


        if(val2_0 > val2_1) begin
            out = max2_0;
        end else begin
            out = max2_1;
        end

    end




endmodule
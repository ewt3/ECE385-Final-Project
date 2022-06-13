module scoreClk(
    input CLK, RESET,
    output fast_clock
);




    logic [19:0] count_reg = 0;
    logic hundred;

    always_ff @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            count_reg <= 0;
            hundred <= 0;
        end else begin
            if (count_reg < 166665) begin
                count_reg <= count_reg + 1;
            end else begin
                count_reg <= 0;
                hundred = ~hundred;
            end
        end
    end

    assign fast_clock = hundred;

endmodule


module SmartTomClk(
    input CLK, RESET,
    output TomClk
);




    logic [19:0] count_reg = 0;
    logic hundred;

    always_ff @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            count_reg <= 0;
            hundred <= 0;
        end else begin
            if (count_reg < 104165) begin
                count_reg <= count_reg + 1;
            end else begin
                count_reg <= 0;
                hundred = ~hundred;
            end
        end
    end

    assign TomClk = hundred;

endmodule
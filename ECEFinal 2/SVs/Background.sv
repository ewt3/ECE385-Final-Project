module Background (
    input logic frame_clk, CLK, RESET, Pause, Boss,
    input logic [9:0] DrawX, DrawY,
    output logic [11:0] background
);
    
logic [3:0] palette;
logic [11:0] Palletes [10];
logic [9:0] IndexX, IndexY, Offset;
logic [18:0] IndexRom;

// scrolling logic should go here
always_ff @( posedge frame_clk or posedge RESET ) begin : Scrolling_Sync
    if(RESET)
        Offset <= 10'd543;
    else if(Pause)
        Offset <= Offset;
    else begin
    if( 10'd543<Offset & Offset<=10'hFFF ) // 10'hFFF - 480,    10'hFFF
        Offset <= Offset + 10'hFFF;
    else
        Offset <= 10'hFFF;
    end
end
always_comb begin : Scrolling_NonSync
        IndexY = (DrawY + Offset) % 480;
end




logic [24:0] Timer;
always_ff @( posedge CLK or posedge RESET ) begin : BossCycling
    if(RESET) begin
        Timer <= 0;
    end else begin
        Timer <= Timer + 1;
    end
end



assign IndexX = DrawX;

always_comb begin : Pallete_assignment
    if(Boss) begin
        if(Timer[24]) begin
            Palletes[0] = 12'hF00;
            Palletes[1] = 12'h000;
            Palletes[2] = 12'hD80;
            Palletes[3] = 12'hFD7;
            Palletes[4] = 12'hFEB;
            Palletes[5] = 12'hFA9;
            Palletes[6] = 12'h000;
            Palletes[7] = 12'h372;
            Palletes[8] = 12'hFE9;
            Palletes[9] = 12'h899;
        end else begin
            Palletes[0] = 12'hF00;
            Palletes[1] = 12'h000;
            Palletes[2] = 12'hD80;
            Palletes[3] = 12'hFD7;
            Palletes[4] = 12'hFEB;
            Palletes[5] = 12'hFA9;
            Palletes[6] = 12'h00F;
            Palletes[7] = 12'h372;
            Palletes[8] = 12'hFE9;
            Palletes[9] = 12'h899;
        end
        
    end else begin
        Palletes[0] = 12'hF00;
        Palletes[1] = 12'h000;
        Palletes[2] = 12'hD80;
        Palletes[3] = 12'hFD7;
        Palletes[4] = 12'hFEB;
        Palletes[5] = 12'hFA9;
        Palletes[6] = 12'hFFF;
        Palletes[7] = 12'h372;
        Palletes[8] = 12'hFE9;
        Palletes[9] = 12'h899;
        
    end
end

assign background =  Palletes[palette];

assign IndexRom = IndexY*640 + IndexX;

rom rom_0(
    .clock(CLK),
	 .address(IndexRom),
	 .q(palette)
    );





endmodule
module VRAM_Reader(
input CLK, RESET,
input logic [11:0] Color,
output logic hs,        // Horizontal sync pulse.  Active low
            vs,        // Vertical sync pulse.  Active low
            pixel_clk, // 25 MHz pixel clock output
            blank,     // Blanking interval indicator.  Active low.
            sync,      // Composite Sync signal.  Active low.  We don't use it in this lab,
                        //   but the video DAC on the DE2 board requires an input for it.
output [9:0] DrawX,     // horizontal coordinate
            DrawY,
output logic [3:0]  red, green, blue	// VGA color channels (mapped to output pins in top-level)
);









vga_controller vga_ctrl(.*, .Clk(CLK), .Reset(RESET));




/* REDO FOR FINAL PROJECT
Pallete Format
UNPACKED DIMMENTION = 16
[ 11-7 ][ 7:4 ][ 3:0] 
[ C0_R ][C0_G ][C0_B]
*/

/*
Pallet Register Format:
[31-28 ][27-24][23-20][19-16][ 15:12 ][ 11-7 ][ 7:4 ][ 3:0] 
[UNUSED][C1_R ][C1_G ][C1_B ][UNUSED ][ C0_R ][C0_G ][C0_B]
*/

//pallete Assignment
/*always_comb begin : palleteAssigmnet
	pallete[0] = palletRegister[0][11:0];
	pallete[1] = palletRegister[0][27:16];
	pallete[2] = palletRegister[1][11:0];
	pallete[3] = palletRegister[1][27:16];
	pallete[4] = palletRegister[2][11:0];
	pallete[5] = palletRegister[2][27:16];
	pallete[6] = palletRegister[3][11:0];
	pallete[7] = palletRegister[3][27:16];
	pallete[8] = palletRegister[4][11:0];
	pallete[9] = palletRegister[4][27:16];
	pallete[10] = palletRegister[5][11:0];
	pallete[11] = palletRegister[5][27:16];
	pallete[12] = palletRegister[6][11:0];
	pallete[13] = palletRegister[6][27:16];
	pallete[14] = palletRegister[7][11:0];
	pallete[15] = palletRegister[7][27:16];
end

//pallete loading
always_ff @( posedge CLK ) begin : Pallet_Loading
	if(AVL_ADDR > 38400 & AVL_WRITE) begin //AVL_ADDR[11]
		if(AVL_BYTE_EN[0])
			palletRegister[AVL_ADDR[2:0]][7:0] <= AVL_WRITEDATA[7:0];
		if(AVL_BYTE_EN[1])
			palletRegister[AVL_ADDR[2:0]][15:8] <= AVL_WRITEDATA[15:8];
		if(AVL_BYTE_EN[2])
			palletRegister[AVL_ADDR[2:0]][23:16] <= AVL_WRITEDATA[23:16];
		if(AVL_BYTE_EN[3])
			palletRegister[AVL_ADDR[2:0]][31:24] <= AVL_WRITEDATA[31:24];
	end
end*/

//pallete hardcoding (label later)


/*always_ff @(posedge CLK ) begin : RealTimeClockish
	TimeCounter <= TimeCounter + 1;
	if(TimeCounter[10])
		RealTimeClock <= ~RealTimeClock;
end*/

//assign pallete[0] =  12'h000; //black
//assign pallete[1] =  12'h00a; //blue 
//assign pallete[2] =  12'h0a0; //green
//assign pallete[3] =  12'h0aa; //cyan
//assign pallete[4] =  12'ha00; //red
//assign pallete[5] =  12'ha0a; //mag
//assign pallete[6] =  12'ha50; //brown
//assign pallete[7] =  12'haaa; //light gray
//assign pallete[8] =  12'h555; //dark gray
//assign pallete[9] =  12'h55f; //light blue
//assign pallete[10] = 12'h5f5; //light green 
//assign pallete[11] = 12'h5ff; //light cyan
//assign pallete[12] = 12'hf55; //light red
//assign pallete[13] = 12'hf5f; //light magenta
//assign pallete[14] = 12'hff5; //yellow 
//assign pallete[15] = 12'hfff; //white


always_ff @(posedge pixel_clk) begin // Send valid RGB signals to the VGA controller(hardware)

	if(!blank) begin
		red <= 4'h0;
		green <= 4'h0;
		blue <= 4'h0;
	end else begin
		red <= Color[11:8];// pallete[0][11:8];//red <= 4'hf
		green <= Color[7:4];//red <= 4'hf
		blue <= Color[3:0];//red <= 4'hf
	end

end



endmodule
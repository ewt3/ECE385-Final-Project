module vga_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,

	input logic [7:0] KeyCodes,
	input logic [1:0] KEY,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [16:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic blank, pixel_clk, sync; //VGA control
logic [11:0] Color;
logic [9:0] DrawX, DrawY; //VGA control
logic [8:0] PaletteIndex;
logic [3:0] Red, Green, Blue;
logic Pause;




//vestigile modules
/*ram ram_0(
	
.address_a(AVL_ADDR), .address_b(curReg[15:3]), 
.byteena_a(AVL_BYTE_EN), .byteena_b(byteena_b),
.data_a(AVL_WRITEDATA), .data_b(Ram_Data),
.rden_a(AVL_READ), .rden_b(1), .wren_a(AVL_WRITE), .wren_b(1),
.q_a(AVL_READDATA), .q_b(Eight_Pix),

.clock(CLK));*/




/*vram_driver vga_driver(
.DrawX(DrawX), .DrawY(DrawY),
.Palette(Pallete_Write),
.Old_Data(Eight_Pix),
.Ram_Data(Ram_Data),
.byteena(byteena_b)

);*/


// instanciate modules
/*
logic [10:0] addr; //ROM
logic [15:0] curReg;
logic [31:0] Eight_Pix;
logic [15:0] Ram_Address;
logic [31:0] Ram_Data;
logic [3:0] byteena_b;
*/



logic RestartGame, Start_Text, Death, Death_Text;



always_ff @( posedge CLK or posedge RESET ) begin : Restart
	if(RESET)
		RestartGame <= 1;
	else begin
		if(KeyCodes == 40) // enter
			RestartGame <= 1;
		else
			RestartGame <= 0;
	end
end




VRAM_Reader VRAM_Read(.*);


game g0(
.start_letter_active(start_letter_active),
.death_letter_active(death_letter_active),
.KEY(KEY),
.Death(Death),
.RESET(RestartGame),
.CLK(CLK),
.frame_clk(vs),
.KeyCodes(KeyCodes),
.DrawX(DrawX), .DrawY(DrawY),
.ColorG(Color),
.Pause(Pause),
.loading_active(loading_active)
);


logic start_letter_active, death_letter_active, loading_active, Loading_Text;

FSM edsbitch(.*);

Start_Screen text_start(.*);

Death_Screen text_death(.*);

Loading_Screen text_load(.*);

// local logic 




endmodule









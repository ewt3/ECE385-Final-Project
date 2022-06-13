module game(
input CLK,
input logic start_letter_active, death_letter_active, loading_active,
input logic RESET, Pause,
input logic frame_clk,
input logic [1:0] KEY,
input logic [7:0] KeyCodes,
input logic [9:0] DrawX, DrawY, 
output logic Death,
output logic [11:0] ColorG, ColorStart, ColorDeath
);

//local variables
logic Active, score_active, inc_score;
logic [8:0] EntitiesPallete;
logic [11:0] ColorE, ColorS, background;
logic [50:0] Game_Counter;
logic switch, Boss;


always_ff @(posedge CLK or posedge RESET) begin : Palette_Switching
	if(RESET)
		Game_Counter <= 0;
	else if(Pause)
		Game_Counter <= Game_Counter;
	else
		Game_Counter <= Game_Counter + 1;
end


always_comb begin : Background
	begin	
		if(Active) begin
			ColorG = ColorE;
		end 
		else if(score_active) begin
			ColorG = ColorS;
		end
		else if(start_letter_active) begin
			ColorG = 12'h0f2;
		end
		else if(death_letter_active) begin
			ColorG = 12'h0f2;
		end
		else if(loading_active) begin
			ColorG = 12'h0f2;
		end
		else begin 
			ColorG = background;
		end
	end
end






Background b0(.*);
entities e0(.*);
score score0(.*);


endmodule
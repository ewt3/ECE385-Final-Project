
module vram_driver (
	input logic [9:0] DrawX, DrawY,
	input logic [3:0] Palette,
	input logic [31:0] Old_Data,

	output logic [31:0] Ram_Data,
	output logic [3:0] byteena

);

logic [15:0] curReg;

always_comb begin
	curReg = DrawY[9:0] * 80 + DrawX[9:3]; //might cause bug where only part of screen is occupied
	
	//set current pixel color being drawn here with logic

	case(curReg[2:0])
		3'd00 : 	begin
					Ram_Data = {Palette, Old_Data[27:0]};
				end
		3'd01 : 	begin
					Ram_Data = {Old_Data[31:28], Palette, Old_Data[23:0]};
				end
		3'd02 : 	begin
					Ram_Data = {Old_Data[31:24], Palette, Old_Data[19:0]};
				end
		3'd03 : 	begin
					Ram_Data = {Old_Data[31:20], Palette, Old_Data[15:0]};
				end
		3'd04 : 	begin
					Ram_Data = {Old_Data[31:16], Palette, Old_Data[11:0]};
				end
		3'd05 : 	begin
					Ram_Data = {Old_Data[31:12], Palette, Old_Data[7:0]};
				end
		3'd06 : 	begin
					Ram_Data = {Old_Data[31:8], Palette, Old_Data[3:0]};
				end
		3'd07 : 	begin
					Ram_Data = {Old_Data[31:4], Palette};
				end
	endcase
		
	byteena = 4'b1111;

end


endmodule
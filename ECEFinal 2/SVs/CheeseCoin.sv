module CheeseCoin(
input CLK,
input logic RESET,
input logic Pause,
input logic spawned,
input logic frame_clk, switch, JerryActive,
input logic [11:0] CheeseCoinColors1,CheeseCoinColors2,
input logic [9:0] DrawX, DrawY, 
input logic [9:0] JerryX, JerryY, //JerrywidthEnd, JerryheightEnd,
input logic signed [9:0] X_Start,Y_Start,X_Step,Y_Step,
output logic [11:0] Color,
output logic [6:0] indx, indy,
output logic active, 
output logic CheeseCoin
);


//local variables
logic [9:0] CheeseCoin_X_Pos, CheeseCoin_X_Motion, CheeseCoin_Y_Pos, CheeseCoin_Y_Motion, width, height, widthEnd, heightEnd;
logic caught;


parameter [9:0] CheeseCoin_X_Min=0;       // Leftmost point on the X axis
parameter [9:0] CheeseCoin_X_Max=639;     // Rightmost point on the X axis
parameter [9:0] CheeseCoin_Y_Min=0;       // Topmost point on the Y axis
parameter [9:0] CheeseCoin_Y_Max=479;     // Bottommost point on the Y axis




assign width = 25;
assign height = 25;


always_comb begin : Active_Logic
	if(RESET | ~spawned | caught) begin
		active = 0;
		widthEnd = width + CheeseCoin_X_Pos;
		heightEnd = height + CheeseCoin_Y_Pos;
	end else begin
		widthEnd = width + CheeseCoin_X_Pos;
		heightEnd = height + CheeseCoin_Y_Pos;
		if(	(DrawX >= CheeseCoin_X_Pos) & (DrawX < widthEnd) & 
			(DrawY >= CheeseCoin_Y_Pos) & (DrawY < heightEnd) ) begin
				if(Color == 273)
					active = 0;
				else	
					active = 1;
			end 
		else begin
			active = 0;
		end
	end
end



logic [28:0] Timer;
always_ff @( posedge CLK or posedge RESET) begin : RespawnTimer
	if(RESET)
		Timer <= 0;
	else begin // not reseting
		if(Timer == 0 & caught)
			Timer <= 29'h01;
		else begin
			if(Timer == 0)
				Timer <= Timer;
			else
				Timer <= Timer + 1;
		end
	end
end




always_ff @(posedge CLK or posedge RESET) begin : Coin_Collisions // to do next
	if(RESET) begin
        caught <= 0;
	end else if(caught) begin
        if(Timer == 0)
            caught <= 0;
        else
            caught <= 1;
	end else if(active & JerryActive) begin
        caught <= 1;
	end else begin
        caught <= 0;
	end
end




always_ff @(posedge CLK or posedge RESET) begin : Jerry_Kill_Check // to do next
	if(RESET) begin
		CheeseCoin <= 0;
	end else if(CheeseCoin) begin
		CheeseCoin <= 0;
	end else if(active & JerryActive) begin
		CheeseCoin <= 1;
	end else begin
		CheeseCoin <= 0;
	end
end







always_comb begin : Pallete_Assignment
	indx = DrawX - CheeseCoin_X_Pos;
	indy = DrawY - CheeseCoin_Y_Pos;
	if(switch)
		Color = CheeseCoinColors1;
	else
		Color = CheeseCoinColors2;
end







logic movement_counter;

//CheeseCoin Movement
always_ff @( posedge frame_clk or posedge RESET) begin : Movement_Computation
	begin: Move_CheeseCoin
        if (RESET) begin 
            CheeseCoin_Y_Motion <= Y_Step;
			CheeseCoin_X_Motion <= X_Step;
			CheeseCoin_Y_Pos <= Y_Start;
			CheeseCoin_X_Pos <= X_Start;
			movement_counter <= 0;
        end else begin 
			if(~spawned) begin
				CheeseCoin_Y_Motion <= 0;
				CheeseCoin_X_Motion <= 0;
				CheeseCoin_Y_Pos <= -1;
				CheeseCoin_X_Pos <= -1;
				movement_counter <= 0;
			end
			else begin
				if(CheeseCoin_X_Pos == 10'hFFF) begin
					// Initilize CheeseCoin position
					CheeseCoin_Y_Motion <= Y_Step;
					CheeseCoin_X_Motion <= X_Step;
					CheeseCoin_Y_Pos <= Y_Start;
					CheeseCoin_X_Pos <= X_Start;
					movement_counter <= 0;
				end
				else begin // most common area
				if(Pause) begin
					CheeseCoin_Y_Pos <= CheeseCoin_Y_Pos;
					CheeseCoin_X_Pos <= CheeseCoin_X_Pos;
				end
				else begin
					//if((CheeseCoin_Y_Pos + CheeseCoin_Y_Motion) <= CheeseCoin_Y_Max)
					
					CheeseCoin_Y_Pos <= (CheeseCoin_Y_Pos + CheeseCoin_Y_Motion);  // Update CheeseCoin position
					CheeseCoin_X_Pos <= (CheeseCoin_X_Pos + CheeseCoin_X_Motion);
					
					CheeseCoin_Y_Motion <= Y_Step + 1;
					CheeseCoin_X_Motion <= 0;
						
					
				end
				end
			end
			
			
			
			

		end  
    end
end






endmodule
module HZ(
input CLK,
input logic RESET,
input logic Pause,
input logic spawned, Invincible,
input logic frame_clk, switch, JerryActive,
input logic [11:0] HZColors1,HZColors2,
input logic [9:0] DrawX, DrawY, 
input logic [9:0] JerryX, JerryY, //JerrywidthEnd, JerryheightEnd,
input logic signed [9:0] X_Start,Y_Start,X_Step,Y_Step,
output logic [11:0] Color,
output logic [7:0] indx, indy,
output logic active, 
output logic KilledJerry
);


//local variables
logic [9:0] HZ_X_Pos, HZ_X_Motion, HZ_Y_Pos, HZ_Y_Motion, width, height, widthEnd, heightEnd;



parameter [9:0] HZ_X_Min=0;       // Leftmost point on the X axis
parameter [9:0] HZ_X_Max=639;     // Rightmost point on the X axis
parameter [9:0] HZ_Y_Min=0;       // Topmost point on the Y axis
parameter [9:0] HZ_Y_Max=479;     // Bottommost point on the Y axis




assign width = 125;
assign height = 170;


always_comb begin : Active_Logic
	if(RESET | ~spawned) begin
		active = 0;
		widthEnd = width + HZ_X_Pos;
		heightEnd = height + HZ_Y_Pos;
	end else begin
		widthEnd = width + HZ_X_Pos;
		heightEnd = height + HZ_Y_Pos;
		if(	(DrawX >= HZ_X_Pos) & (DrawX < widthEnd) & 
			(DrawY >= HZ_Y_Pos) & (DrawY < heightEnd) ) begin
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





logic [25:0] NoPuppyGuarding;



always_ff @( posedge CLK or posedge RESET) begin : GracePeriod
	if(RESET)
		NoPuppyGuarding <= 0;
	else begin // not reseting
		if(NoPuppyGuarding == 0 & KilledJerry)
			NoPuppyGuarding <= 26'h01;
		else begin
			if(NoPuppyGuarding == 0)
				NoPuppyGuarding <= NoPuppyGuarding;
			else
				NoPuppyGuarding <= NoPuppyGuarding + 1;
		end
	end
end


always_ff @(posedge CLK or posedge RESET) begin : Jerry_Kill_Check // to do next
	if(RESET) begin
		KilledJerry <= 0;
	end else begin
		if(KilledJerry) begin
			KilledJerry <= 0;
		end else if(active & JerryActive & ~Invincible & NoPuppyGuarding == 0) begin
			KilledJerry <= 1;
		end else begin
			KilledJerry <= 0;
		end
	end
end



logic signed [10:0] in0, in1, in2, in3, in4, in5, in6, in7;
logic [2:0] dir;


//hardcoded pallete
//assign pallete = 6;


always_comb begin : Pallete_Assignment
	indx = DrawX - HZ_X_Pos;
	indy = DrawY - HZ_Y_Pos;
	if(switch)
		Color = HZColors1;
	else
		Color = HZColors2;
end


Max max(
	.*,
	.out(dir)
);




logic signed [10:0] deltaX, deltaY;
assign deltaX = JerryX + (~HZ_X_Pos + 1);
assign deltaY = JerryY + (~HZ_Y_Pos + 1);

/*
always_comb begin
	in0 =  0      - deltaY;
	in1 =  deltaX - deltaY;
	in2 =  deltaX +   0;
	in3 =  deltaX + deltaY;
	in4 =  0      + deltaY;
	in5 = -deltaX + deltaY;;
	in6 =  0      - deltaX;
	in7 = -deltaX - deltaY;;
end
*/


always_comb begin
	in0 =  (~deltaY + 1);
	in1 =  deltaX + (~deltaY + 1);
	in2 =  deltaX ;
	in3 =  deltaX + deltaY;
	in4 =  deltaY;
	in5 =  (~deltaX + 1) + deltaY;;
	in6 =  (~deltaX + 1);
	in7 = (~deltaX + 1) + (~deltaY + 1);;
end


/*
logic HZClk;

always_ff @( posedge frame_clk ) begin : HZ_Clk
	HZClk <= ~HZClk;
end
*/



logic movement_counter;

//HZ Movement
always_ff @( posedge frame_clk or posedge RESET) begin : Movement_Computation
	begin: Move_HZ
        if (RESET) begin 
            HZ_Y_Motion <= Y_Step;
			HZ_X_Motion <= X_Step;
			HZ_Y_Pos <= Y_Start;
			HZ_X_Pos <= X_Start;
			movement_counter <= 0;
        end else begin 
			if(~spawned) begin
				HZ_Y_Motion <= 0;
				HZ_X_Motion <= 0;
				HZ_Y_Pos <= -1;
				HZ_X_Pos <= -1;
				movement_counter <= 0;
			end
			else begin
				if(HZ_X_Pos == 10'hFFF) begin
					// Initilize HZ position
					HZ_Y_Motion <= Y_Step;
					HZ_X_Motion <= X_Step;
					HZ_Y_Pos <= Y_Start;
					HZ_X_Pos <= X_Start;
					movement_counter <= 0;
				end
				else begin // most common area
				if(Pause) begin
					HZ_Y_Pos <= HZ_Y_Pos;
					HZ_X_Pos <= HZ_X_Pos;
				end
				else begin
					//if((HZ_Y_Pos + HZ_Y_Motion) <= HZ_Y_Max)
					movement_counter <= ~movement_counter;
					if(movement_counter) begin
						HZ_Y_Pos <= (HZ_Y_Pos + HZ_Y_Motion);  // Update HZ position
						HZ_X_Pos <= (HZ_X_Pos + HZ_X_Motion);
					end
					
					case (dir) // could reduce footprint by reducing additon opperations
						0:	begin
							HZ_X_Motion <= 0;
							HZ_Y_Motion <= (~Y_Step + 1) + 1;
							end
						1:	begin
							HZ_X_Motion <= X_Step;
							HZ_Y_Motion <= (~Y_Step + 1) + 1;
							end
						2:	begin
							HZ_X_Motion <= X_Step;
							HZ_Y_Motion <= 1;
							end
						3:	begin
							HZ_X_Motion <= X_Step;
							HZ_Y_Motion <= Y_Step + 1;
							end
						4:	begin
							HZ_X_Motion <= 0;
							HZ_Y_Motion <= Y_Step + 1;
							end
						5:	begin
							HZ_X_Motion <= (~X_Step + 1);
							HZ_Y_Motion <= Y_Step + 1;
							end
						6:	begin
							HZ_X_Motion <= (~X_Step + 1);
							HZ_Y_Motion <= 1;
							end
						7:	begin
							HZ_X_Motion <= (~X_Step + 1);
							HZ_Y_Motion <= (~Y_Step + 1) + 1;
							end
						
					

					endcase
				end
				end
			end
			
			
			
			

		end  
    end
end








endmodule
module One_UP(
input CLK,
input logic RESET,
input logic Pause,
input logic spawned,
input logic frame_clk, switch, JerryActive,
input logic [11:0] One_UPColors1,One_UPColors2,
input logic [9:0] DrawX, DrawY, 
input logic [9:0] JerryX, JerryY, //JerrywidthEnd, JerryheightEnd,
input logic signed [9:0] X_Start,Y_Start,X_Step,Y_Step,
output logic [11:0] Color,
output logic [6:0] indx, indy,
output logic active, 
output logic One_Up
);


//local variables
logic [9:0] One_UP_X_Pos, One_UP_X_Motion, One_UP_Y_Pos, One_UP_Y_Motion, width, height, widthEnd, heightEnd;
logic caught;


parameter [9:0] One_UP_X_Min=0;       // Leftmost point on the X axis
parameter [9:0] One_UP_X_Max=639;     // Rightmost point on the X axis
parameter [9:0] One_UP_Y_Min=0;       // Topmost point on the Y axis
parameter [9:0] One_UP_Y_Max=479;     // Bottommost point on the Y axis




assign width = 25;
assign height = 25;


always_comb begin : Active_Logic
	if(RESET | ~spawned | caught) begin
		active = 0;
		widthEnd = width + One_UP_X_Pos;
		heightEnd = height + One_UP_Y_Pos;
	end else begin
		widthEnd = width + One_UP_X_Pos;
		heightEnd = height + One_UP_Y_Pos;
		if(	(DrawX >= One_UP_X_Pos) & (DrawX < widthEnd) & 
			(DrawY >= One_UP_Y_Pos) & (DrawY < heightEnd) ) begin
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

always_ff @(posedge CLK or posedge RESET) begin : onup_collisions // to do next
	if(RESET) begin
        caught <= 0;
	end else if(caught) begin
        caught <= 1;
	end else if(active & JerryActive) begin
        caught <= 1;
	end else begin
        caught <= 0;
	end
end




always_ff @(posedge CLK or posedge RESET) begin : Jerry_Kill_Check // to do next
	if(RESET) begin
		One_Up <= 0;
	end else if(One_Up) begin
		One_Up <= 0;
	end else if(active & JerryActive) begin
		One_Up <= 1;
	end else begin
		One_Up <= 0;
	end
end






logic signed [10:0] in0, in1, in2, in3, in4, in5, in6, in7;
logic [2:0] dir;


//hardcoded pallete
//assign pallete = 6;


always_comb begin : Pallete_Assignment
	indx = DrawX - One_UP_X_Pos;
	indy = DrawY - One_UP_Y_Pos;
	if(switch)
		Color = One_UPColors1;
	else
		Color = One_UPColors2;
end


Max max(
	.*,
	.out(dir)
);




logic signed [10:0] deltaX, deltaY;
assign deltaX = ~(JerryX + (~One_UP_X_Pos + 1)) + 1;
assign deltaY = ~(JerryY + (~One_UP_Y_Pos + 1)) + 1;

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
logic One_UPClk;

always_ff @( posedge frame_clk ) begin : One_UP_Clk
	One_UPClk <= ~One_UPClk;
end
*/



logic movement_counter;

//One_UP Movement
always_ff @( posedge frame_clk or posedge RESET) begin : Movement_Computation
	begin: Move_One_UP
        if (RESET) begin 
            One_UP_Y_Motion <= Y_Step;
			One_UP_X_Motion <= X_Step;
			One_UP_Y_Pos <= Y_Start;
			One_UP_X_Pos <= X_Start;
			movement_counter <= 0;
        end else begin 
			if(~spawned) begin
				One_UP_Y_Motion <= 0;
				One_UP_X_Motion <= 0;
				One_UP_Y_Pos <= -1;
				One_UP_X_Pos <= -1;
				movement_counter <= 0;
			end
			else begin
				if(One_UP_X_Pos == 10'hFFF) begin
					// Initilize One_UP position
					One_UP_Y_Motion <= Y_Step;
					One_UP_X_Motion <= X_Step;
					One_UP_Y_Pos <= Y_Start;
					One_UP_X_Pos <= X_Start;
					movement_counter <= 0;
				end
				else begin // most common area
				if(Pause) begin
					One_UP_Y_Pos <= One_UP_Y_Pos;
					One_UP_X_Pos <= One_UP_X_Pos;
				end
				else begin
					//if((One_UP_Y_Pos + One_UP_Y_Motion) <= One_UP_Y_Max)
					movement_counter <= ~movement_counter;
					if(movement_counter) begin
						One_UP_Y_Pos <= (One_UP_Y_Pos + One_UP_Y_Motion);  // Update One_UP position
						One_UP_X_Pos <= (One_UP_X_Pos + One_UP_X_Motion);
					end
					
					case (dir) // could reduce footprint by reducing additon opperations
						0:	begin
							One_UP_X_Motion <= 0;
							One_UP_Y_Motion <= (~Y_Step + 1) + 2;
							end
						1:	begin
							One_UP_X_Motion <= X_Step;
							One_UP_Y_Motion <= (~Y_Step + 1) + 2;
							end
						2:	begin
							One_UP_X_Motion <= X_Step;
							One_UP_Y_Motion <= 1;
							end
						3:	begin
							One_UP_X_Motion <= X_Step;
							One_UP_Y_Motion <= Y_Step + 1;
							end
						4:	begin
							One_UP_X_Motion <= 0;
							One_UP_Y_Motion <= Y_Step + 1;
							end
						5:	begin
							One_UP_X_Motion <= (~X_Step + 1);
							One_UP_Y_Motion <= Y_Step + 1;
							end
						6:	begin
							One_UP_X_Motion <= (~X_Step + 1);
							One_UP_Y_Motion <= 1;
							end
						7:	begin
							One_UP_X_Motion <= (~X_Step + 1);
							One_UP_Y_Motion <= (~Y_Step + 1) + 2;
							end
						
					

					endcase
				end
				end
			end
			
			
			
			

		end  
    end
end






endmodule
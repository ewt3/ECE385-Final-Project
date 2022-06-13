module Smart_Tom(
input CLK,
input logic RESET,
input logic Pause,
input logic spawned, Invincible,
input logic frame_clk, switch, JerryActive,
input logic [11:0] TomColors1,TomColors2,
input logic [9:0] DrawX, DrawY, 
input logic [9:0] JerryX, JerryY, //JerrywidthEnd, JerryheightEnd,
input logic signed [9:0] X_Start,Y_Start,X_Step,Y_Step,
output logic [11:0] Color,
output logic [6:0] indx, indy,
output logic active, 
output logic KilledJerry
);


//local variables
logic [9:0] Tom_X_Pos, Tom_X_Motion, Tom_Y_Pos, Tom_Y_Motion, width, height, widthEnd, heightEnd;



parameter [9:0] Tom_X_Min=0;       // Leftmost point on the X axis
parameter [9:0] Tom_X_Max=639;     // Rightmost point on the X axis
parameter [9:0] Tom_Y_Min=0;       // Topmost point on the Y axis
parameter [9:0] Tom_Y_Max=479;     // Bottommost point on the Y axis




assign width = 40;
assign height = 40;


always_comb begin : Active_Logic
	if(RESET | ~spawned) begin
		active = 0;
		widthEnd = width + Tom_X_Pos;
		heightEnd = height + Tom_Y_Pos;
	end else begin
		widthEnd = width + Tom_X_Pos;
		heightEnd = height + Tom_Y_Pos;
		if(	(DrawX >= Tom_X_Pos) & (DrawX < widthEnd) & 
			(DrawY >= Tom_Y_Pos) & (DrawY < heightEnd) ) begin
				if(Color == 12'h111)
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
	indx = DrawX - Tom_X_Pos;
	indy = DrawY - Tom_Y_Pos;
	if(switch)
		Color = TomColors1;
	else
		Color = TomColors2;
end


Max max(
	.*,
	.out(dir)
);




logic signed [10:0] deltaX, deltaY;
assign deltaX = JerryX + (~Tom_X_Pos + 1);
assign deltaY = JerryY + (~Tom_Y_Pos + 1);

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
logic TomClk;

always_ff @( posedge frame_clk ) begin : Tom_Clk
	TomClk <= ~TomClk;
end
*/



logic movement_counter;

//Tom Movement
always_ff @( posedge frame_clk or posedge RESET) begin : Movement_Computation
	begin: Move_Tom
        if (RESET) begin 
            Tom_Y_Motion <= Y_Step;
			Tom_X_Motion <= X_Step;
			Tom_Y_Pos <= Y_Start;
			Tom_X_Pos <= X_Start;
			movement_counter <= 0;
        end else begin 
			if(~spawned) begin
				Tom_Y_Motion <= 0;
				Tom_X_Motion <= 0;
				Tom_Y_Pos <= -1;
				Tom_X_Pos <= -1;
				movement_counter <= 0;
			end
			else begin
				if(Tom_X_Pos == 10'hFFF) begin
					// Initilize Tom position
					Tom_Y_Motion <= Y_Step;
					Tom_X_Motion <= X_Step;
					Tom_Y_Pos <= Y_Start;
					Tom_X_Pos <= X_Start;
					movement_counter <= 0;
				end
				else begin // most common area
				if(Pause) begin
					Tom_Y_Pos <= Tom_Y_Pos;
					Tom_X_Pos <= Tom_X_Pos;
				end
				else begin
					//if((Tom_Y_Pos + Tom_Y_Motion) <= Tom_Y_Max)
					movement_counter <= ~movement_counter;
					if(movement_counter) begin
						Tom_Y_Pos <= (Tom_Y_Pos + Tom_Y_Motion);// Update Tom position
					end else begin  
						Tom_X_Pos <= (Tom_X_Pos + Tom_X_Motion);
					end
					
					case (dir) // could reduce footprint by reducing additon opperations
						0:	begin
							Tom_X_Motion <= 0;
							Tom_Y_Motion <= (~Y_Step + 1) + 1;
							end
						1:	begin
							Tom_X_Motion <= X_Step;
							Tom_Y_Motion <= (~Y_Step + 1) + 1;
							end
						2:	begin
							Tom_X_Motion <= X_Step;
							Tom_Y_Motion <= 1;
							end
						3:	begin
							Tom_X_Motion <= X_Step;
							Tom_Y_Motion <= Y_Step + 1;
							end
						4:	begin
							Tom_X_Motion <= 0;
							Tom_Y_Motion <= Y_Step + 1;
							end
						5:	begin
							Tom_X_Motion <= (~X_Step + 1);
							Tom_Y_Motion <= Y_Step + 1;
							end
						6:	begin
							Tom_X_Motion <= (~X_Step + 1);
							Tom_Y_Motion <= 1;
							end
						7:	begin
							Tom_X_Motion <= (~X_Step + 1);
							Tom_Y_Motion <= (~Y_Step + 1) + 1;
							end
						
					

					endcase
				end
				end
			end
			
			
			
			

		end  
    end
end






endmodule
module Dumb_Tom(
input CLK,
input logic RESET, Pause,
input logic spawned, Invincible,
input logic frame_clk, switch, JerryActive,
input logic [11:0] TomColors1,TomColors2,
input logic [9:0] DrawX, DrawY, 
input logic [9:0] JerryX, JerryY, //JerrywidthEnd, JerryheightEnd,
input logic [9:0] X_Start,Y_Start,X_Step,Y_Step,
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












//Tom Movement
always_ff @( posedge frame_clk or posedge RESET) begin : Movement_Computation
	begin: Move_Tom
        if (RESET) begin 
            Tom_Y_Motion <= Y_Step;
			Tom_X_Motion <= X_Step;
			Tom_Y_Pos <= Y_Start;
			Tom_X_Pos <= X_Start;
        end else begin 
			if(~spawned) begin
				Tom_Y_Motion <= 0;
				Tom_X_Motion <= 0;
				Tom_Y_Pos <= -1;
				Tom_X_Pos <= -1;
			end
			else begin
				if(Tom_X_Pos == 10'hFFF) begin
					// Initilize Tom position
					Tom_Y_Motion <= Y_Step;
					Tom_X_Motion <= X_Step;
					Tom_Y_Pos <= Y_Start;
					Tom_X_Pos <= X_Start;
				end
				else begin // most common area
					if(Pause) begin
						Tom_X_Pos <= Tom_X_Pos;
						Tom_Y_Pos <= Tom_Y_Pos;
					end
					else begin
						//if((Tom_Y_Pos + Tom_Y_Motion) <= Tom_Y_Max)
						Tom_Y_Pos <= (Tom_Y_Pos + Tom_Y_Motion);  // Update Tom position
						if((Tom_X_Pos + Tom_X_Motion) <= Tom_X_Max)
							Tom_X_Pos <= (Tom_X_Pos + Tom_X_Motion);

						if ( 0 )  begin// Tom is at the bottom edge, BOUNCE!   ( (Tom_Y_Pos + height) >= Tom_Y_Max)
							//Tom_Y_Pos <= Tom_Y_Max - height;
							Tom_Y_Motion <= (~ (Y_Step) + 1'b1);  // 2's complement.
							end
								
						else if ( (Tom_Y_Pos) <= Y_Step )  begin// Tom is at the top edge, BOUNCE!
							//Tom_Y_Pos <= Tom_Y_Min;
							Tom_Y_Motion <= Y_Step;
							end
								
						else if ( (Tom_X_Pos + width + Tom_X_Motion) >= Tom_X_Max )  begin// Tom is at the Right edge, BOUNCE!   ( & (Tom_X_Pos + height + Tom_X_Motion) < Tom_X_Max + 150)
							//Tom_X_Pos <= Tom_X_Max - width;
							Tom_X_Motion <= (~ (X_Step) + 1'b1);  // 2's complement.
							end
								
						else if ( (Tom_X_Pos) <= X_Step )  begin// Tom is at the Left edge, BOUNCE!
							//Tom_X_Pos <= Tom_X_Min;
							Tom_X_Motion <= X_Step;
						end else begin
							Tom_Y_Motion <= Tom_Y_Motion;  // Tom is somewhere in the middle, don't bounce, just keep moving
							Tom_X_Motion <= Tom_X_Motion;	
						end
					end
				end
			end
			
			
			
			

		end  
    end
end






endmodule
module Star(
input CLK,
input logic RESET, Pause,
input logic spawned,
input logic frame_clk, switch, JerryActive,
input logic [11:0] StarColors1,StarColors2,
input logic [7:0] KeyCodes,
input logic [9:0] DrawX, DrawY, 
input logic [9:0] JerryX, JerryY, //JerrywidthEnd, JerryheightEnd,
input logic [9:0] X_Start,Y_Start,X_Step,Y_Step,
output logic [11:0] Color,
output logic [7:0] indx, indy,
output logic active, 
output logic StarBoost
);


//local variables
logic [9:0] Star_X_Pos, Star_X_Motion, Star_Y_Pos, Star_Y_Motion, width, height, widthEnd, heightEnd;
logic caught;


parameter [9:0] Star_X_Min=0;       // Leftmost point on the X axis
parameter [9:0] Star_X_Max=639;     // Rightmost point on the X axis
parameter [9:0] Star_Y_Min=0;       // Topmost point on the Y axis
parameter [9:0] Star_Y_Max=479;     // BotStarmost point on the Y axis




assign width = 35;
assign height = 35;



always_comb begin : Active_Logic
	if(RESET | ~spawned | caught) begin
		active = 0;
		widthEnd = width + Star_X_Pos;
		heightEnd = height + Star_Y_Pos;
	end else begin
		widthEnd = width + Star_X_Pos;
		heightEnd = height + Star_Y_Pos;
		if(	(DrawX >= Star_X_Pos) & (DrawX < widthEnd) & 
			(DrawY >= Star_Y_Pos) & (DrawY < heightEnd) ) begin
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



always_ff @(posedge CLK or posedge RESET) begin : Jerry_Kill_Check // to do next
	if(RESET) begin
		StarBoost <= 0;
        caught <= 0;
	end else begin //not reseting

		if(Timer == 29'hffffffff) begin
			StarBoost <= 0;
			caught <= 1;
		end

		else begin
			if(Timer>0) begin
				StarBoost <= 1;
				caught <= 1;
			end else if(active & JerryActive) begin
				StarBoost <= 1;
				caught <= 1;
			end else begin
				StarBoost <= 0;
				caught <= 0;
			end
		end
		
	end
end

/*
logic CaughtEdge;
always_ff @( posedge caught ) begin :
	
end
*/




logic [28:0] Timer;
always_ff @( posedge CLK or posedge RESET) begin : InvincibilityTimer
	if(RESET)
		Timer <= 0;
	else begin // not reseting
		if(Timer == 0 & caught)
			Timer <= 29'h01;
		else begin
			if(Timer == 0)
				Timer <= Timer;
			else begin
				if(Timer < 29'hffffffff)
					Timer <= Timer + 1;
			end

		end
	end
end










//hardcoded pallete
//assign pallete = 6;


always_comb begin : Pallete_Assignment
	indx = DrawX - Star_X_Pos;
	indy = DrawY - Star_Y_Pos;
	if(switch)
		Color = StarColors1;
	else
		Color = StarColors2;
end










//Star Movement
always_ff @( posedge frame_clk or posedge RESET) begin : Movement_Computation
	begin: Move_Star
        if (RESET) begin 
            Star_Y_Motion <= Y_Step;
			Star_X_Motion <= X_Step;
			Star_Y_Pos <= Y_Start;
			Star_X_Pos <= X_Start;
        end else begin 
			if(~spawned) begin
				Star_Y_Motion <= 0;
				Star_X_Motion <= 0;
				Star_Y_Pos <= -1;
				Star_X_Pos <= -1;
			end
			else begin
				if(Star_X_Pos == 10'hFFF) begin
					// Initilize Star position
					Star_Y_Motion <= Y_Step;
					Star_X_Motion <= X_Step;
					Star_Y_Pos <= Y_Start;
					Star_X_Pos <= X_Start;
				end
				else begin // most common area
					if(Pause) begin
						Star_X_Pos <= Star_X_Pos;
						Star_Y_Pos <= Star_Y_Pos;
					end
					else begin
						//if((Star_Y_Pos + Star_Y_Motion) <= Star_Y_Max)
						Star_Y_Pos <= (Star_Y_Pos + Star_Y_Motion);  // Update Star position
						if((Star_X_Pos + Star_X_Motion) <= Star_X_Max)
							Star_X_Pos <= (Star_X_Pos + Star_X_Motion);

						if ( 0 )  begin// Star is at the botStar edge, BOUNCE!   ( (Star_Y_Pos + height) >= Star_Y_Max)
							//Star_Y_Pos <= Star_Y_Max - height;
							Star_Y_Motion <= (~ (Y_Step) + 1'b1);  // 2's complement.
							end
								
						else if ( (Star_Y_Pos) <= Y_Step )  begin// Star is at the top edge, BOUNCE!
							//Star_Y_Pos <= Star_Y_Min;
							Star_Y_Motion <= Y_Step;
							end
								
						else if ( (Star_X_Pos + width + Star_X_Motion) >= Star_X_Max )  begin// Star is at the Right edge, BOUNCE!   ( & (Star_X_Pos + height + Star_X_Motion) < Star_X_Max + 150)
							//Star_X_Pos <= Star_X_Max - width;
							Star_X_Motion <= (~ (X_Step) + 1'b1);  // 2's complement.
							end
								
						else if ( (Star_X_Pos) <= X_Step )  begin// Star is at the Left edge, BOUNCE!
							//Star_X_Pos <= Star_X_Min;
							Star_X_Motion <= X_Step;
						end else begin
							Star_Y_Motion <= Star_Y_Motion;  // Star is somewhere in the middle, don't bounce, just keep moving
							Star_X_Motion <= Star_X_Motion;	
						end
					end
				end
			end
			
			
			
			

		end  
    end
end






endmodule
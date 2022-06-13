//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, clk, frame_clk,
					input [7:0] keycode,
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	logic [8:0] movement_counter;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	//assign SPEED = 9'h0A; // speed of ball

	always_ff @( posedge clk ) begin : Speed_Block
		movement_counter <= movement_counter + 1;
	end


   
    always_ff @ (posedge Reset or posedge frame_clk)
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
			Ball_Y_Pos <= Ball_Y_Center;
			Ball_X_Pos <= Ball_X_Center;
        end 
        else 
        begin 
			if(movement_counter <= 1000) begin // tune constant for ball speed
				Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
			end
			begin
			if ( (Ball_Y_Pos + Ball_Size) > Ball_Y_Max )  begin// Ball is at the bottom edge, BOUNCE!
				Ball_Y_Pos <= Ball_Y_Max - Ball_Size;
				//Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
				end
					
			else if ( (Ball_Y_Pos - Ball_Size) < Ball_Y_Min )  begin// Ball is at the top edge, BOUNCE!
				Ball_Y_Pos <= Ball_Size;
				//Ball_Y_Motion <= Ball_Y_Step;
				end
					
			else if ( (Ball_X_Pos + Ball_Size) > Ball_X_Max )  begin// Ball is at the Right edge, BOUNCE!
				Ball_X_Pos <= Ball_X_Max - Ball_Size;
				//Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.
				end
					
			else if ( (Ball_X_Pos - Ball_Size) < Ball_X_Min )  begin// Ball is at the Left edge, BOUNCE!
				Ball_X_Pos <= Ball_Size;
				//Ball_X_Motion <= Ball_X_Step;
				end
					
				else 
				begin
				//Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
				//Ball_X_Motion <= Ball_X_Motion;
					
				case (keycode)
					8'h04 : begin
								if(Ball_X_Pos-Ball_Size > 0) begin
									Ball_X_Motion <= -2;//A
									//Ball_Y_Motion<= 0;
								end
							end
							
					8'h07 : begin
								if(Ball_X_Pos+Ball_Size < 639) begin
									Ball_X_Motion <= 2;//D
									//Ball_Y_Motion <= 0;
								end
							end

								
					8'h16 : begin
								if(Ball_Y_Pos+Ball_Size < 479) begin
									Ball_Y_Motion <= 2;//S
									//Ball_X_Motion <= 0;
								end
							end
								
					8'h1A : begin
								if(Ball_Y_Pos-Ball_Size > 0)begin
									Ball_Y_Motion <= -1;//W
									//Ball_X_Motion <= 0;
								end
							end	  
					default: begin 
								Ball_X_Motion <= 1'b0;
								Ball_Y_Motion <= 1;
							end
				endcase
				end
				
			end		
		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule

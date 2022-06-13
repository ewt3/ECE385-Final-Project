module heart(
    input logic CLK, frame_clk, RESET, Pause,
    input logic [50:0] Game_Counter,
    input logic [9:0] DrawX, DrawY,
    input logic [9:0] One_Up,
    input logic [49:0] KilledJerry,
    output logic heart_active,
    output logic [11:0] ColorH,
    output logic death
);


logic [2:0] cur_health;

logic idx, zeroidx, oneidx, twoidx, threeidx, fouridx;
assign ColorH = 12'hF40;


always_ff @( posedge CLK or posedge RESET ) begin //health incrementer
    if( RESET ) begin
        cur_health <= 3;  //initialization
        death <= 0;
    end 
    else begin
        if(Pause) begin
            cur_health <= cur_health;
            death <= death;
        end else begin //game is playing
        
            if(One_Up>0 & cur_health < 5 & ~death) begin // detect a one-up pulse
                cur_health <= cur_health + 1;
                death <= 0;
            end else 
            begin
                if(KilledJerry > 0) begin // detect a killed pulse
                    if(cur_health == 1) begin
                        death <= 1;
                        cur_health <= 0; 
                    end else begin
                        if(cur_health == 0) begin
                            cur_health <= cur_health;
                            death <= death;
                        end else begin
                            cur_health <= cur_health - 1;
                            death <= 0;
                        end
                    end
                end
            end
            
        end
    end
end


always_comb begin : print_letters 
    
    if( (588 > DrawX) & (DrawX >= 580) & (477 > DrawY) & (DrawY>= 461) ) begin
        logic [9:0] bah;
        bah = DrawX-580;

        if(fouridx)begin
            heart_active = heart[DrawY[3:0]][bah[2:0]];
        end
        else
            heart_active = 0;


    end 

    else if( (596 > DrawX) & (DrawX >= 588) & (477 > DrawY) & (DrawY>= 461) ) begin
        logic [9:0] bah;
        bah = DrawX-588;
        if(threeidx)begin
            heart_active = heart[DrawY[3:0]][bah[2:0]];
        end
        else
            heart_active = 0;

    end 

    else if( (604 > DrawX) & (DrawX >= 596) & (477 > DrawY) & (DrawY>= 461) ) begin
        logic [9:0] bah;
        bah = DrawX-596;
        if(twoidx)begin
            heart_active = heart[DrawY[3:0]][bah[2:0]];
        end
        else
            heart_active = 0;

    end 

    else if( (612 > DrawX) & (DrawX >= 604) & (477 > DrawY) & (DrawY>= 461) ) begin
        logic [9:0] bah;
        bah = DrawX-604;
        if(oneidx)begin
            heart_active = heart[DrawY[3:0]][bah[2:0]];
        end
        else
            heart_active = 0;

    end 

    else if( (620 > DrawX) & (DrawX >= 612) & (477 > DrawY) & (DrawY>= 461) ) begin
        logic [9:0] bah;
        bah = DrawX-612;
        if(zeroidx)begin
            heart_active = heart[DrawY[3:0]][bah[2:0]];
        end
        else
            heart_active = 0;

    end 
    
    else
        heart_active = 0;

end





//need to creat fast_clock
    always_ff @(posedge CLK or posedge RESET) begin : hex_to_dec
        if(RESET)begin
            zeroidx <= 1;
            oneidx <= 1;
            twoidx <= 1;
            threeidx <= 0;
            fouridx <= 0;
        end
        else begin
            if(cur_health == 0)begin
                zeroidx <= 0;
                oneidx <= 0;
                twoidx <= 0;
                threeidx <= 0;
                fouridx <= 0;
            end else if(cur_health > 4) begin
                zeroidx <= 1;
                oneidx <= 1;
                twoidx <= 1;
                threeidx <= 1;
                fouridx <= 1;
            end else if(cur_health > 3) begin
                zeroidx <= 1;
                oneidx <= 1;
                twoidx <= 1;
                threeidx <= 1;
                fouridx <= 0;
            end else if(cur_health > 2) begin
                zeroidx <= 1;
                oneidx <= 1;
                twoidx <= 1;
                threeidx <= 0;
                fouridx <= 0;
            end else if(cur_health > 1) begin
                zeroidx <= 1;
                oneidx <= 1;
                twoidx <= 0;
                threeidx <= 0;
                fouridx <= 0;
            end else if(cur_health > 0) begin
                zeroidx <= 1;
                oneidx <= 0;
                twoidx <= 0;
                threeidx <= 0;
                fouridx <= 0;
            end
            else begin
                zeroidx <= 1;
                oneidx <= 0;
                twoidx <= 0;
                threeidx <= 0;
                fouridx <= 1;
            end

           
        end
    end


        
    parameter bit heart[16][8] = '{
        '{0,1,1,0,1,1,0,0}, //   ** **
        '{1,1,1,1,1,1,1,0}, //  *******
        '{1,1,1,1,1,1,1,0}, //  *******
        '{1,1,1,1,1,1,1,0}, //  *******
        '{1,1,1,1,1,1,1,0}, //  *******
        '{0,1,1,1,1,1,0,0}, //   *****
        '{0,0,1,1,1,0,0,0}, //    ***
        '{0,0,0,1,0,0,0,0}, //     *
        '{0,0,0,0,0,0,0,0}, // 
        '{0,0,0,0,0,0,0,0}, // 
        '{0,0,0,0,0,0,0,0}, // 
        '{0,0,0,0,0,0,0,0},  // 
        '{0,0,0,0,0,0,0,0}, // 
        '{0,0,0,0,0,0,0,0}, // 
        '{0,0,0,0,0,0,0,0}, // 
        '{0,0,0,0,0,0,0,0} // 
    };

endmodule
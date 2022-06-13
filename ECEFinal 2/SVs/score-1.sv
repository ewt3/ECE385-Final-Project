module score (
    input logic CLK, frame_clk, RESET, Pause, inc_score,
    input logic [50:0] Game_Counter,
    input logic [9:0] DrawX, DrawY,
    output logic score_active,
    output logic [11:0] ColorS
);


logic [2:0] counter;
logic [3:0] idx, zeroidx, oneidx, twoidx, threeidx, fouridx;
logic fast_clock;
logic [19:0] score, scoreRemainder; //max score 1048567
logic[25:0] ScoreCounter;
assign ColorS = 12'hF40;


/*always_ff @( posedge frame_clk or posedge RESET ) begin //score incrementer
    if( RESET ) begin
        score <= 0;    
    end 
    else if(Pause) begin
        score <= score;
        ScoreCounter <= ScoreCounter;
    end
    
    else begin
    if(ScoreCounter != 59)
        ScoreCounter <= ScoreCounter + 1;
    else
        ScoreCounter <= 0;
    if(ScoreCounter == 0)
        score <= score + 1;
    end
end*/

always_ff @( posedge CLK or posedge RESET ) begin : thecounter
    if(RESET)
        ScoreCounter <= 1;
    else
    begin
        if(Pause) begin
            if(ScoreCounter==0)
                ScoreCounter <= ScoreCounter + 1;
            else
                ScoreCounter <= ScoreCounter;
            
        end
        else
            ScoreCounter <= ScoreCounter + 1;
    end
end

always_ff @( posedge CLK or posedge RESET ) begin : scoreinc
    if(RESET)
        score <= 0;
    else begin
        if(ScoreCounter == 0)
            score <= score + 1;
        else begin
            if(inc_score)
                score <= score + 10;
            else
                score <= score;
        end


    end

end




scoreClk clk(.*);




always_comb begin : print_letters 
    
    if( (588 > DrawX) & (DrawX >= 580) & (460 > DrawY) & (DrawY>= 444) ) begin
        logic [9:0] bah;
        bah = DrawX-580;
        case(fouridx)

            0: begin score_active = zero[DrawY[3:0]][bah[2:0]];
            end

            1: begin score_active = one[DrawY[3:0]][bah[2:0]];
            end

            2: begin score_active = two[DrawY[3:0]][bah[2:0]];
            end

            3: begin score_active = three[DrawY[3:0]][bah[2:0]];
            end

            4: begin score_active = four[DrawY[3:0]][bah[2:0]];
            end

            5: begin score_active = five[DrawY[3:0]][bah[2:0]];
            end

            6: begin score_active = six[DrawY[3:0]][bah[2:0]];
            end

            7: begin score_active = seven[DrawY[3:0]][bah[2:0]];
            end

            8: begin score_active = eight[DrawY[3:0]][bah[2:0]];
            end

            9: begin score_active = nine[DrawY[3:0]][bah[2:0]];
            end

            default : score_active = 0;

        endcase

    end 

    else if( (596 > DrawX) & (DrawX >= 588) & (460 > DrawY) & (DrawY>= 444) ) begin
        logic [9:0] bah;
        bah = DrawX-588;
        case(threeidx)

            0: begin score_active = zero[DrawY[3:0]][bah[2:0]];
            end

            1: begin score_active = one[DrawY[3:0]][bah[2:0]];
            end

            2: begin score_active = two[DrawY[3:0]][bah[2:0]];
            end

            3: begin score_active = three[DrawY[3:0]][bah[2:0]];
            end

            4: begin score_active = four[DrawY[3:0]][bah[2:0]];
            end

            5: begin score_active = five[DrawY[3:0]][bah[2:0]];
            end

            6: begin score_active = six[DrawY[3:0]][bah[2:0]];
            end

            7: begin score_active = seven[DrawY[3:0]][bah[2:0]];
            end

            8: begin score_active = eight[DrawY[3:0]][bah[2:0]];
            end

            9: begin score_active = nine[DrawY[3:0]][bah[2:0]];
            end

            default : score_active = 0;

        endcase

    end 

    else if( (604 > DrawX) & (DrawX >= 596) & (460 > DrawY) & (DrawY>= 444) ) begin
        logic [9:0] bah;
        bah = DrawX-596;
        case(twoidx)

            0: begin score_active = zero[DrawY[3:0]][bah[2:0]];
            end

            1: begin score_active = one[DrawY[3:0]][bah[2:0]];
            end

            2: begin score_active = two[DrawY[3:0]][bah[2:0]];
            end

            3: begin score_active = three[DrawY[3:0]][bah[2:0]];
            end

            4: begin score_active = four[DrawY[3:0]][bah[2:0]];
            end

            5: begin score_active = five[DrawY[3:0]][bah[2:0]];
            end

            6: begin score_active = six[DrawY[3:0]][bah[2:0]];
            end

            7: begin score_active = seven[DrawY[3:0]][bah[2:0]];
            end

            8: begin score_active = eight[DrawY[3:0]][bah[2:0]];
            end

            9: begin score_active = nine[DrawY[3:0]][bah[2:0]];
            end

            default : score_active = 0;

        endcase

    end 

    else if( (612 > DrawX) & (DrawX >= 604) & (460 > DrawY) & (DrawY>= 444) ) begin
        logic [9:0] bah;
        bah = DrawX-604;
        case(oneidx)

            0: begin score_active = zero[DrawY[3:0]][bah[2:0]];
            end

            1: begin score_active = one[DrawY[3:0]][bah[2:0]];
            end

            2: begin score_active = two[DrawY[3:0]][bah[2:0]];
            end

            3: begin score_active = three[DrawY[3:0]][bah[2:0]];
            end

            4: begin score_active = four[DrawY[3:0]][bah[2:0]];
            end

            5: begin score_active = five[DrawY[3:0]][bah[2:0]];
            end

            6: begin score_active = six[DrawY[3:0]][bah[2:0]];
            end

            7: begin score_active = seven[DrawY[3:0]][bah[2:0]];
            end

            8: begin score_active = eight[DrawY[3:0]][bah[2:0]];
            end

            9: begin score_active = nine[DrawY[3:0]][bah[2:0]];
            end

            default : score_active = 0;

        endcase

    end 

    else if( (620 > DrawX) & (DrawX >= 612) & (460 > DrawY) & (DrawY>= 444) ) begin
        logic [9:0] bah;
        bah = DrawX-612;
        case(zeroidx)

            0: begin score_active = zero[DrawY[3:0]][bah[2:0]];
            end

            1: begin score_active = one[DrawY[3:0]][bah[2:0]];
            end

            2: begin score_active = two[DrawY[3:0]][bah[2:0]];
            end

            3: begin score_active = three[DrawY[3:0]][bah[2:0]];
            end

            4: begin score_active = four[DrawY[3:0]][bah[2:0]];
            end

            5: begin score_active = five[DrawY[3:0]][bah[2:0]];
            end

            6: begin score_active = six[DrawY[3:0]][bah[2:0]];
            end

            7: begin score_active = seven[DrawY[3:0]][bah[2:0]];
            end

            8: begin score_active = eight[DrawY[3:0]][bah[2:0]];
            end

            9: begin score_active = nine[DrawY[3:0]][bah[2:0]];
            end

            default : score_active = 0;

            
        endcase

    end 
    else
        score_active = 0;
    
    


end





//need to creat fast_clock
    always_ff @(posedge fast_clock or posedge RESET) begin : hex_to_dec
        if(RESET)begin
            counter <= 0;
            scoreRemainder <= 0;
            zeroidx <= 0;
            oneidx <= 0;
            twoidx <= 0;
            threeidx <= 0;
            fouridx <= 0;
        end
        else begin
            if(counter==4) begin
                counter <= 0;
                scoreRemainder <= score;
            end else begin
                counter <= counter + 1;
                scoreRemainder <= scoreRemainder / 10;
            end

            case (counter)
                3'h0: zeroidx <= idx;

                3'h1: oneidx <= idx;

                3'h2: twoidx <= idx;

                3'h3: threeidx <= idx;

                3'h4: fouridx <= idx;
            endcase
        end
    end

    assign idx = scoreRemainder % 10;


    parameter bit zero[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,1,1,1,1,1,0,0}, // 2  *****
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{1,1,0,0,0,1,1,0}, // 4 **   **
        '{1,1,0,0,1,1,1,0}, // 5 **  ***
        '{1,1,0,1,1,1,1,0}, // 6 ** ****
        '{1,1,1,1,0,1,1,0}, // 7 **** **
        '{1,1,1,0,0,1,1,0}, // 8 ***  **
        '{1,1,0,0,0,1,1,0}, // 9 **   **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{0,1,1,1,1,1,0,0}, // b  *****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit one[16][8] = '{ 
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,0,0,1,1,0,0,0}, // 2
        '{0,0,1,1,1,0,0,0}, // 3
        '{0,1,1,1,1,0,0,0}, // 4    **
        '{0,0,0,1,1,0,0,0}, // 5   ***
        '{0,0,0,1,1,0,0,0}, // 6  ****
        '{0,0,0,1,1,0,0,0}, // 7    **
        '{0,0,0,1,1,0,0,0}, // 8    **
        '{0,0,0,1,1,0,0,0}, // 9    **
        '{0,0,0,1,1,0,0,0}, // a    **
        '{0,1,1,1,1,1,1,0}, // b    **
        '{0,0,0,0,0,0,0,0}, // c    **
        '{0,0,0,0,0,0,0,0}, // d  ******
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit two[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,1,1,1,1,1,0,0}, // 2  *****
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{0,0,0,0,0,1,1,0}, // 4      **
        '{0,0,0,0,1,1,0,0}, // 5     **
        '{0,0,0,1,1,0,0,0}, // 6    **
        '{0,0,1,1,0,0,0,0}, // 7   **
        '{0,1,1,0,0,0,0,0}, // 8  **
        '{1,1,0,0,0,0,0,0}, // 9 **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{1,1,1,1,1,1,1,0}, // b *******
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit three[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,1,1,1,1,1,0,0}, // 2  *****
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{0,0,0,0,0,1,1,0}, // 4      **
        '{0,0,0,0,0,1,1,0}, // 5      **
        '{0,0,1,1,1,1,0,0}, // 6   ****
        '{0,0,0,0,0,1,1,0}, // 7      **
        '{0,0,0,0,0,1,1,0}, // 8      **
        '{0,0,0,0,0,1,1,0}, // 9      **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{0,1,1,1,1,1,0,0}, // b  *****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit four[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,0,0,0,1,1,0,0}, // 2     **
        '{0,0,0,1,1,1,0,0}, // 3    ***
        '{0,0,1,1,1,1,0,0}, // 4   ****
        '{0,1,1,0,1,1,0,0}, // 5  ** **
        '{1,1,0,0,1,1,0,0}, // 6 **  **
        '{1,1,1,1,1,1,1,0}, // 7 *******
        '{0,0,0,0,1,1,0,0}, // 8     **
        '{0,0,0,0,1,1,0,0}, // 9     **
        '{0,0,0,0,1,1,0,0}, // a     **
        '{0,0,0,1,1,1,1,0}, // b    ****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit five[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{1,1,1,1,1,1,1,0}, // 2 *******
        '{1,1,0,0,0,0,0,0}, // 3 **
        '{1,1,0,0,0,0,0,0}, // 4 **
        '{1,1,0,0,0,0,0,0}, // 5 **
        '{1,1,1,1,1,1,0,0}, // 6 ******
        '{0,0,0,0,0,1,1,0}, // 7      **
        '{0,0,0,0,0,1,1,0}, // 8      **
        '{0,0,0,0,0,1,1,0}, // 9      **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{0,1,1,1,1,1,0,0}, // b  *****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit six[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,0,1,1,1,0,0,0}, // 2   ***
        '{0,1,1,0,0,0,0,0}, // 3  **
        '{1,1,0,0,0,0,0,0}, // 4 **
        '{1,1,0,0,0,0,0,0}, // 5 **
        '{1,1,1,1,1,1,0,0}, // 6 ******
        '{1,1,0,0,0,1,1,0}, // 7 **   **
        '{1,1,0,0,0,1,1,0}, // 8 **   **
        '{1,1,0,0,0,1,1,0}, // 9 **   **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{0,1,1,1,1,1,0,0}, // b  *****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit seven[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{1,1,1,1,1,1,1,0}, // 2 *******
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{0,0,0,0,0,1,1,0}, // 4      **
        '{0,0,0,0,0,1,1,0}, // 5      **
        '{0,0,0,0,1,1,0,0}, // 6     **
        '{0,0,0,1,1,0,0,0}, // 7    **
        '{0,0,1,1,0,0,0,0}, // 8   **
        '{0,0,1,1,0,0,0,0}, // 9   **
        '{0,0,1,1,0,0,0,0}, // a   **
        '{0,0,1,1,0,0,0,0}, // b   **
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
   parameter bit eight[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,1,1,1,1,1,0,0}, // 2  *****
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{1,1,0,0,0,1,1,0}, // 4 **   **
        '{1,1,0,0,0,1,1,0}, // 5 **   **
        '{0,1,1,1,1,1,0,0}, // 6  *****
        '{1,1,0,0,0,1,1,0}, // 7 **   **
        '{1,1,0,0,0,1,1,0}, // 8 **   **
        '{1,1,0,0,0,1,1,0}, // 9 **   **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{0,1,1,1,1,1,0,0}, // b  *****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit nine[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,1,1,1,1,1,0,0}, // 2  *****
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{1,1,0,0,0,1,1,0}, // 4 **   **
        '{1,1,0,0,0,1,1,0}, // 5 **   **
        '{0,1,1,1,1,1,1,0}, // 6  ******
        '{0,0,0,0,0,1,1,0}, // 7      **
        '{0,0,0,0,0,1,1,0}, // 8      **
        '{0,0,0,0,0,1,1,0}, // 9      **
        '{0,0,0,0,1,1,0,0}, // a     **
        '{0,1,1,1,1,0,0,0}, // b  ****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };







endmodule
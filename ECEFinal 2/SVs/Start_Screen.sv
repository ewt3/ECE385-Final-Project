module Start_Screen (
    input logic CLK, RESET, Start_Text,
    input logic [9:0] DrawX, DrawY,
    output logic start_letter_active
);



logic [9:0] mod8;
assign mod8 = (DrawY + 8) % 16;



always_comb begin : print_letters 
    
    
    if(Start_Text) begin
            if( (252 > DrawX) & (DrawX >= 244) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-244;

                start_letter_active = LetterP[mod8[3:0]][bah[2:0]];
                
            end  

            else if( (260 > DrawX) & (DrawX >= 252) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-252;

                start_letter_active = LetterR[mod8[3:0]][bah[2:0]];
                
            end  

            else if( (268 > DrawX) & (DrawX >= 260) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-260;

                start_letter_active = LetterE[mod8[3:0]][bah[2:0]];
                
            end  

            else if( (276 > DrawX) & (DrawX >= 268) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-268;

                start_letter_active = LetterS[mod8[3:0]][bah[2:0]];
                
            end  

            else if( (284 > DrawX) & (DrawX >= 276) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-276;

                start_letter_active = LetterS[mod8[3:0]][bah[2:0]];
                
            end  

            else if( (292 > DrawX) & (DrawX >= 284) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-284;

                start_letter_active = LetterSpace[mod8[3:0]][bah[2:0]];
                
            end

            else if( (300 > DrawX) & (DrawX >= 292) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-292;

                start_letter_active = LetterE[mod8[3:0]][bah[2:0]];
                
            end   

            else if( (308 > DrawX) & (DrawX >= 300) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-300;

                start_letter_active = LetterN[mod8[3:0]][bah[2:0]];
                
            end

            else if( (316 > DrawX) & (DrawX >= 308) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-308;

                start_letter_active = LetterT[mod8[3:0]][bah[2:0]];
                
            end  

            else if( (324 > DrawX) & (DrawX >= 316) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-316;

                start_letter_active = LetterE[mod8[3:0]][bah[2:0]];
                
            end 

            else if( (332 > DrawX) & (DrawX >= 324) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-324;

                start_letter_active = LetterR[mod8[3:0]][bah[2:0]];
                
            end 

            else if( (340 > DrawX) & (DrawX >= 332) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-332;

                start_letter_active = LetterSpace[mod8[3:0]][bah[2:0]];
                
            end 

            else if( (348 > DrawX) & (DrawX >= 340) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-340;

                start_letter_active = LetterT[mod8[3:0]][bah[2:0]];
                
            end 
            
            else if( (356 > DrawX) & (DrawX >= 348) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-348;

                start_letter_active = LetterO[mod8[3:0]][bah[2:0]];
                
            end 

            else if( (364 > DrawX) & (DrawX >= 356) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-356;

                start_letter_active = LetterSpace[mod8[3:0]][bah[2:0]];
                
            end

            else if( (372 > DrawX) & (DrawX >= 364) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-364;

                start_letter_active = LetterS[mod8[3:0]][bah[2:0]];
                
            end

            else if( (380 > DrawX) & (DrawX >= 372) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-372;

                start_letter_active = LetterT[mod8[3:0]][bah[2:0]];
                
            end

            else if( (388 > DrawX) & (DrawX >= 380) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-380;

                start_letter_active = LetterA[mod8[3:0]][bah[2:0]];
                
            end

            else if( (396 > DrawX) & (DrawX >= 388) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-388;

                start_letter_active = LetterR[mod8[3:0]][bah[2:0]];
                
            end

            else if( (404 > DrawX) & (DrawX >= 396) & (376 > DrawY) & (DrawY>= 360) ) begin
                logic [9:0] bah;
                bah = DrawX-396;

                start_letter_active = LetterT[mod8[3:0]][bah[2:0]];
                
            end


            
        
            else begin
                start_letter_active = 0;
            end
        end
    
    else begin
        start_letter_active = 0;
    end
    
end


        
    parameter bit LetterP[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{1,1,1,1,1,1,0,0}, // 2 ******
        '{0,1,1,0,0,1,1,0}, // 3  **  **
        '{0,1,1,0,0,1,1,0}, // 4  **  **
        '{0,1,1,0,0,1,1,0}, // 5  **  **
        '{0,1,1,1,1,1,0,0}, // 6  *****
        '{0,1,1,0,0,0,0,0}, // 7  **
        '{0,1,1,0,0,0,0,0}, // 8  **
        '{0,1,1,0,0,0,0,0}, // 9  **
        '{0,1,1,0,0,0,0,0}, // a  **
        '{1,1,1,1,0,0,0,0}, // b ****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit LetterR[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{1,1,1,1,1,1,0,0}, // 2 ******
        '{0,1,1,0,0,1,1,0}, // 3  **  **
        '{0,1,1,0,0,1,1,0}, // 4  **  **
        '{0,1,1,0,0,1,1,0}, // 5  **  **
        '{0,1,1,1,1,1,0,0}, // 6  *****
        '{0,1,1,0,1,1,0,0}, // 7  ** **
        '{0,1,1,0,0,1,1,0}, // 8  **  **
        '{0,1,1,0,0,1,1,0}, // 9  **  **
        '{0,1,1,0,0,1,1,0}, // a  **  **
        '{1,1,1,0,0,1,1,0}, // b ***  **
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit LetterE[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{1,1,1,1,1,1,1,0}, // 2 *******
        '{0,1,1,0,0,1,1,0}, // 3  **  **
        '{0,1,1,0,0,0,1,0}, // 4  **   *
        '{0,1,1,0,1,0,0,0}, // 5  ** *
        '{0,1,1,1,1,0,0,0}, // 6  ****
        '{0,1,1,0,1,0,0,0}, // 7  ** *
        '{0,1,1,0,0,0,0,0}, // 8  **
        '{0,1,1,0,0,0,1,0}, // 9  **   *
        '{0,1,1,0,0,1,1,0}, // a  **  **
        '{1,1,1,1,1,1,1,0}, // b *******
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit LetterS[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,1,1,1,1,1,0,0}, // 2  *****
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{1,1,0,0,0,1,1,0}, // 4 **   **
        '{0,1,1,0,0,0,0,0}, // 5  **
        '{0,0,1,1,1,0,0,0}, // 6   ***
        '{0,0,0,0,1,1,0,0}, // 7     **
        '{0,0,0,0,0,1,1,0}, // 8      **
        '{1,1,0,0,0,1,1,0}, // 9 **   **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{0,1,1,1,1,1,0,0}, // b  *****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit LetterN[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{1,1,0,0,0,1,1,0}, // 2 **   **
        '{1,1,1,0,0,1,1,0}, // 3 ***  **
        '{1,1,1,1,0,1,1,0}, // 4 **** **
        '{1,1,1,1,1,1,1,0}, // 5 *******
        '{1,1,0,1,1,1,1,0}, // 6 ** ****
        '{1,1,0,0,1,1,1,0}, // 7 **  ***
        '{1,1,0,0,0,1,1,0}, // 8 **   **
        '{1,1,0,0,0,1,1,0}, // 9 **   **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{1,1,0,0,0,1,1,0}, // b **   **
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit LetterT[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{1,1,1,1,1,1,1,1}, // 2 ********
        '{1,1,0,1,1,0,1,1}, // 3 ** ** **
        '{1,0,0,1,1,0,0,1}, // 4 *  **  *
        '{0,0,0,1,1,0,0,0}, // 5    **
        '{0,0,0,1,1,0,0,0}, // 6    **
        '{0,0,0,1,1,0,0,0}, // 7    **
        '{0,0,0,1,1,0,0,0}, // 8    **
        '{0,0,0,1,1,0,0,0}, // 9    **
        '{0,0,0,1,1,0,0,0}, // a    **
        '{0,0,1,1,1,1,0,0}, // b   ****
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit LetterO[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,1,1,1,1,1,0,0}, // 2  *****
        '{1,1,0,0,0,1,1,0}, // 3 **   **
        '{1,1,0,0,0,1,1,0}, // 4 **   **
        '{1,1,0,0,0,1,1,0}, // 5 **   **
        '{1,1,0,0,0,1,1,0}, // 6 **   **
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
    parameter bit LetterA[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,0,0,1,0,0,0,0}, // 2    *
        '{0,0,1,1,1,0,0,0}, // 3   ***
        '{0,1,1,0,1,1,0,0}, // 4  ** **
        '{1,1,0,0,0,1,1,0}, // 5 **   **
        '{1,1,0,0,0,1,1,0}, // 6 **   **
        '{1,1,1,1,1,1,1,0}, // 7 *******
        '{1,1,0,0,0,1,1,0}, // 8 **   **
        '{1,1,0,0,0,1,1,0}, // 9 **   **
        '{1,1,0,0,0,1,1,0}, // a **   **
        '{1,1,0,0,0,1,1,0}, // b **   **
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
    parameter bit LetterSpace[16][8] = '{
        '{0,0,0,0,0,0,0,0}, // 0
        '{0,0,0,0,0,0,0,0}, // 1
        '{0,0,0,0,0,0,0,0}, // 2
        '{0,0,0,0,0,0,0,0}, // 3
        '{0,0,0,0,0,0,0,0}, // 4
        '{0,0,0,0,0,0,0,0}, // 5
        '{0,0,0,0,0,0,0,0}, // 6
        '{0,0,0,0,0,0,0,0}, // 7
        '{0,0,0,0,0,0,0,0}, // 8
        '{0,0,0,0,0,0,0,0}, // 9
        '{0,0,0,0,0,0,0,0}, // a
        '{0,0,0,0,0,0,0,0}, // b
        '{0,0,0,0,0,0,0,0}, // c
        '{0,0,0,0,0,0,0,0}, // d
        '{0,0,0,0,0,0,0,0}, // e
        '{0,0,0,0,0,0,0,0} // f
    };
        

endmodule
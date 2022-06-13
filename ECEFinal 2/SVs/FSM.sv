module FSM(input CLK, RESET, 
           input logic [7:0] KeyCodes,
           input logic Death, 
           output logic Start_Text, Death_Text, Loading_Text, Pause

);

logic [29:0] Counter;

enum logic [2:0] {Loading, Start, Play, PauseState, DeathState} State, Next_State;

always_ff @( posedge CLK or posedge RESET ) begin : blockName
    
    if(RESET)
        State <= Loading;
    else
        State <= Next_State;

end

/*logic PausePress, PausePressRise;
assign PausePress = KeyCodes == 41;

always_ff @( posedge PausePress ) begin : PausePressEdge
    PausePressRise <= ~PausePressRise;
end*/

always_comb begin
    
    Next_State = State;

    Start_Text = 0;
    Death_Text = 0;
    Loading_Text = 0;

    unique case(State)
        Loading: 
            if(Counter[29])
                Next_State = Start;
        
        Start:
            if(KeyCodes == 8'd40)
                Next_State = Play;

        Play:
            if(Death)
                Next_State = DeathState;
            else begin if(KeyCodes == 41)
                Next_State = PauseState;
            end 

        DeathState:
            if(KeyCodes == 8'd40)
                Next_State = Play;

        PauseState:
            if(KeyCodes == 41)
                Next_State = Play;

        default: 
            Next_State = Start;

    endcase


    case(State) 
        Loading: 
        begin
            Start_Text = 0;
            Death_Text = 0;
            Pause = 1;
            Loading_Text = 1;
        end
    
        Start:
        begin
            Start_Text = 1;
            Death_Text = 0;
            Pause = 1;
            Loading_Text = 0;
        end

        Play:
        begin
            Start_Text = 0;
            Death_Text = 0;
            Pause = 0;
            Loading_Text = 0;
        end

        DeathState:
        begin
            Start_Text = 0;
            Death_Text = 1;
            Pause = 1;
            Loading_Text = 0;
        end

        PauseState:
        begin
            Start_Text = 0;
            Death_Text = 0;
            Pause = 1;
            Loading_Text = 0;
        end

        default: 
        begin
            Start_Text = 0;
            Death_Text = 0;
            Pause = 0;
            Loading_Text = 0;
        end

    endcase

end

always_ff @( posedge CLK or posedge RESET ) begin : loading_counter
    
    if(RESET)
        Counter <= 0;
    else
        Counter <= Counter + 1;

end












endmodule
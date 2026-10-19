module binarycounter (
    input wclk, wrst_n, winc, wfull,
    output reg[4:0]out
);
wire[4:0]b2gray ;
reg[4:0]bnext;
    always@(posedge wclk or negedge wrst_n)
    begin
        if(~(wrst_n))
        begin
            out<=5'b00000;
        end
        else if(winc && !wfull)
        begin
            out<=out+1;
        end
    end
assign b2gray= (out)^(out>>1);
    
endmodule


// ip : wclk, wrst_n, winc, wfull
//op : wbin, wgray
// Expected behavior:
// - Reset both pointers to zero.
// - Increment the binary pointer only when winc && !wfull.
// - Generate the next Gray pointer from the next binary value.
// - Register both values on the write clock.
// - Verify that consecutive Gray pointer values differ by exactly one bit when
//. ever the pointer increments.


// 
//. {gray = binary \oplus (binary >> 1)}
module binarycounter (
    input wclk, wrst_n, winc, wfull,
    output 
);
    always@(posedge clk)
    begin
        if(~(rst_n)|(q==4'b1111))
        begin
            out<=4'b0000;
        end
        else
        begin
            out<=out+1;
        end
    end
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
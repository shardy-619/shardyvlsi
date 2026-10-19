module alu32 (
    input  [31:0] A,
    input  [31:0] B,
    input  [2:0]  ALUControl,
    output reg [31:0] ALUResult,
    output        Zero,
    output        Overflow
);

    wire [31:0] b_mux;
    wire [32:0] sum_ext;
    wire [63:0] mult_full;
    wire [4:0]  shift_amt;

    assign shift_amt = B[4:0];
    assign b_mux     = (ALUControl == 3'b001) ? ~B : B;
    assign sum_ext   = A + b_mux + (ALUControl == 3'b001 ? 1'b1 : 1'b0);
    assign mult_full = A * B;

    always @(*) begin
        case (ALUControl)
            3'b000: ALUResult = sum_ext[31:0];    // ADD
            3'b001: ALUResult = sum_ext[31:0];    // SUB
            3'b010: ALUResult = A & B;            // AND
            3'b011: ALUResult = A | B;            // OR
            3'b100: ALUResult = A ^ B;            // XOR
            3'b101: ALUResult = A << shift_amt;   // SLL
            3'b110: ALUResult = A >> shift_amt;   // SRL
            3'b111: ALUResult = mult_full[31:0];  // MUL
            default: ALUResult = 32'h00000000;
        endcase
    end

    assign Zero = (ALUResult == 32'h00000000);
    assign Overflow = (ALUControl == 3'b000 || ALUControl == 3'b001) ? 
                       (A[31] ^ b_mux[31] ^ sum_ext[31] ^ sum_ext[32]) : 1'b0;

endmodule

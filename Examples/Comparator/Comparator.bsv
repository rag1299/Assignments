package Comparator;
typedef 8 BusSize;
interface Comparator_IFC;
  method Action put(Bit#(BusSize) x, Bit#(BusSize) y);
  method Action ack();
  method Bit#(BusSize) getSmall();
  method Bit#(BusSize) getBig();
endinterface
(* synthesize *)
module mkComparator(Comparator_IFC);
  Reg#(Bit#(BusSize)) m1 <- mkReg(10);
  Reg#(Bit#(BusSize)) m2 <- mkReg(9);

  Reg#(Bit#(BusSize)) n1 <- mkReg(0);
  Reg#(Bit#(BusSize)) n2 <- mkReg(0);
  Reg#(Bool) available <- mkReg(True);
  Reg#(bit) finishFlag <- mkReg(0);
  
  rule rule1(!available && finishFlag == 0);
    let c = m1;
    let d = m2;
    if(c >= d) begin
      n1 <= d;
      n2 <= c;
      finishFlag <= 1;
    end
    else begin
      n1 <= c;
      n2 <= d;
      finishFlag <= 1;
      // $display("Comparator time : %t", $time);
    end
  endrule

  // for debugging purpose only
  // rule rule2(!available && finishFlag == 1);
  //   $display("Small : %d , Big : %d", n1, n2);
  //   $finish(0);
  // endrule

  method Action put(Bit#(BusSize) x, Bit#(BusSize) y) if(available);
    m1 <= x;
    m2 <= y;
    available <= False;
  endmethod
  method Action ack() if(!available && finishFlag == 1);
    available <= True;
    finishFlag <= 0;
  endmethod
  method Bit#(BusSize) getSmall() if(!available && finishFlag == 1);
    return n1;
  endmethod
  method Bit#(BusSize) getBig() if(!available && finishFlag == 1);
    return n2;
  endmethod
endmodule : mkComparator
endpackage : Comparator
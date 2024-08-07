/*************************************************************************
   Copyright 2008 Ray Salemi

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
**************************************************************************/
import uvm_pkg::*;
import tinyalu_pkg::*;
`include "tinyalu_defines.svh"

module alu_predictor(ref uvm_tlm_fifo #(alu_operation) op_f,
                     ref uvm_tlm_fifo #(alu_result)    res_f);

   alu_operation req;
   alu_result    res;
   string        err_string,m;

   task run;
      forever begin
         $sformat(m,"%m");
         op_f.get(req);
         uvm_top.uvm_report_info(m,req.convert2string(),300);
         case (req.op)
            add_op: res = new(req.A + req.B);
            and_op: res = new(req.A & req.B);
            xor_op: res = new(req.A ^ req.B);
            mul_op: res = new(req.A * req.B);
            no_op, rst_op:  begin end
            default: begin
               $sformat (err_string,"BAD OP IN TLM ALU: %s",req.op);
               uvm_top.uvm_report_fatal(m,err_string,0,`__FILE__,`__LINE__);
            end
         endcase
         if ((req.op != no_op) && (req.op != rst_op)) res_f.put(res);
      end
   endtask
endmodule


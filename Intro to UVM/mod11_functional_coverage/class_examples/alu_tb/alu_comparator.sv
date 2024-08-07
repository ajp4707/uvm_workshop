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

module alu_comparator(
    ref uvm_tlm_fifo #(alu_result) predicted_f,
    ref uvm_tlm_fifo #(alu_result) actual_f);

    alu_result predicted, actual;
    string     m,message;

    task run();
      $sformat(m,"%m");
      forever
        begin
          actual_f.get(actual);
          predicted_f.get(predicted);
          $sformat(message,"\n\tGolden Result: %s\n\tActual Result: %s",
                    predicted.convert2string,actual.convert2string);
          if (predicted.comp(actual))
            uvm_top.uvm_report_info (m,message,300);
          else
            uvm_top.uvm_report_error(m,message,200);
        end
    endtask
endmodule



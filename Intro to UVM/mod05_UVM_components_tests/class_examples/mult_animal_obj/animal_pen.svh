class animal_pen extends uvm_object;
  integer numb;
  string  name;
  string  group_name;
  
  function new(string nm = "dogs", string gn = "pack",
               integer nb = 5);
      name = nm;
      group_name = gn;
      numb = nb;
  endfunction
endclass
  
  
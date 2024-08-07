module file_writing;
  integer filea, fileb, fileab, filec, allfiles;
  
  initial begin
    filea = $fopen("filea.txt");
    fileb = $fopen("fileb.txt");
    filec = $fopen("filec.txt");
    fileab =   filea | fileb;
    allfiles = filea | fileb | filec;
    
    $fdisplay (filea, "File a");
    $fdisplay (fileb, "File b");
    $fdisplay (filec, "File c");
    $fdisplay (fileab, "This goes into A and B.");
    $fdisplay (allfiles, "This goes into all the files.");
    $fclose(allfiles);
  end
endmodule

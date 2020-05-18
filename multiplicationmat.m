function retval = multiplicationmat (matrix1, matrix2)
  size1 = size(matrix1);
  size2 = size(matrix2);
 
  if (!(size1(1) <= 2 && size1(2) <= 2 &&size2(1) <=2 && size2(2) <=2))
    MA1_1 = matrix1(1:floor(size1(1)/2), 1:floor(size1(2)/2));
    MA1_2 = matrix1(1:floor(size1(1)/2), floor(size1(2)/2)+1:size1(2));
    MA2_1 = matrix1(floor(size1(1)/2)+1:size1(1), 1:floor(size1(2)/2));
    MA2_2 = matrix1(floor(size1(1)/2)+1:size1(1), floor(size1(2)/2)+1:size1(2));
    
    MB1_1 = matrix2(1:floor(size2(1)/2), 1:floor(size2(2)/2));
    MB1_2 = matrix2(1:floor(size2(1)/2), floor(size2(2)/2)+1:size2(2));
    MB2_1 = matrix2(floor(size2(1)/2)+1:size2(1), 1:floor(size2(2)/2));
    MB2_2 = matrix2(floor(size2(1)/2)+1:size2(1), floor(size2(2)/2)+1:size2(2));
    
    matrixrez1_1 = multiplicationmat(MA1_1, MB1_1) + multiplicationmat(MA1_2,MB2_1);
    matrixrez1_2 = multiplicationmat(MA1_1,MB1_2) + multiplicationmat(MA1_2, MB2_2);
    matrixrez2_1 = multiplicationmat(MA2_1,MB1_1) + multiplicationmat(MA2_2,MB2_1);
    matrixrez2_2 = multiplicationmat(MA2_1,MB1_2) + multiplicationmat(MA2_2,MB2_2);  
    tmp1 = [matrixrez1_1,matrixrez1_2];
    tmp2 = [matrixrez2_1,matrixrez2_2];
    retval = [tmp1; tmp2];
  else 
    retval = matrix1*matrix2;
  
  endif
  
endfunction

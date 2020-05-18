function result = inversemat(mat)
  if  size(mat)(1) == size(mat)(2) && mat(1,1)!=0
    if size(mat) != [1,1]
      result = inversemat(mat(1:end-1,1:end-1));
      if result == 0
        return
      endif
      Y = multiplicationmat(mat(end,1:end-1),result);
      if abs(mat(end,end)-multiplicationmat(Y, mat(1:end-1,end)))>0.000001
        O = 1/(mat(end,end)-multiplicationmat(Y, mat(1:end-1,end)));
      else
        O=0;
        'не существует'
      endif
      X = multiplicationmat(result, mat(1:end-1,end));
      if O!=0 && size(multiplicationmat(X*O,Y))(1)==size(X)(1)
        result = [result+multiplicationmat(X*O,Y), -1*O*X; -1*O*Y,O];
      else 
        result = 0;
      endif
    elseif size(mat) == [1,1]
      result = 1/mat;
    endif
  else
    result = 0;
    'не существует'
  endif
endfunction
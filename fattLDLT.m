function A=fattLDLT(A)
%
%   I parametri della funzione sono:
%       A -> la matrice quadrata da fattorizzare
%
%   I valori di ritorno sono:
%       A -> la matrice fattorizzata LDLT
% 
  n=length(A);
  if A(1,1)<=0
      error('la matrice non e'' sdp')
  end
  A(2:n,1)=A(2:n,1)/A(1,1);
  for j=2:n
        v=(A(j,1:j-1).') .*diag(A(1:j-1,1:j-1));
        A(j,j)=A(j,j)-A(j,1:j-1)*v;
        A(j+1:n,j)=(A(j+1:n,j)-A(j+1:n,1:j-1)*v)/A(j,j);
  end
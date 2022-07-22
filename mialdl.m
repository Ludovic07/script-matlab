function x=mialdl(A,b)
%
%
%   I parametri della funzione sono:
%       A -> la matrice dei coefficienti del sistema lineare
%       b -> il vettore dei termini noti
%
%   I valori di ritorno sono:
%       x -> il vettore soluzione del sistema lineare
%
%  
  n=length(b);
  A=fattLDLT(A);
  % Ly=b
  y=b;
  for i=2:n
     for j=1:i-1
         y(i)=y(i)-A(i,j)*y(j);
     end
  end
  %Dz=y
  z=y ./ diag(A);
  %LTx=z
  x=z;
  for i=n:-1:1
     for j=1:i-1
         x(j)=x(j)-A(i,j)*x(i);
     end
  end

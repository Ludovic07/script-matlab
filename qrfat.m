function QR=qrfat(A)
%
%
%   I parametri della funzione sono:
%       A -> la matrice quadrata da fattorizzare
%
%   I valori di ritorno sono:
%       A -> la matrice fattorizzata QR con Q matrice ortogonale e
%            R triangolare superiore
%  
  [m,n]=size(A);
  for i=1:n
    alpha=norm(A(i:m,i));
     if alpha==0
        disp('Matrice non ha rango max');
        return
     end
     v1=A(i,i);
     if v1>=0
        v1=v1+alpha;
        s=1;
        A(i,i)=-alpha;
     else
        v1=v1-alpha;
        s=-1;
        A(i,i)=alpha;
     end
     A(i+1:m,i)=A(i+1:m,i)/v1;
     v=[1;A(i+1:m,i)];
     beta=s*v1/alpha;
     A(i:m,i+1:n)=A(i:m,i+1:n)-(beta*v)*(v'*A(i:m,i+1:n));
  end
  QR=A;
end



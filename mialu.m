function x= mialu(LU,p,b)
%     
%   I parametri della funzione sono:
%       LU -> matrice fattorizzata LU
%       p -> vettore contenente la relativa permutazione
%       b -> vettore dei termini noti
%   
%   I valori di ritorno sono:
%       x -> soluzione del sistema 
%
%
[m,n]=size(LU);
x=b(:);
x=x(p);
if m~=n || n~=length(b) || length(p)~=length(b)
    error("Dati inconsistenti");
else 
    if min(abs(diag(LU)))==0
        error('Matrice singolare');
    end
end
for i=1:n-1
   x(i+1:n)=x(i+1:n)-LU(i+1:n,i)*x(i);
end
for j=n:-1:1
    x(j)=x(j)/LU(j,j);
    x(1:j-1)=x(1:j-1)-LU(1:j-1,j)*x(j);
end
end


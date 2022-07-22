function [LU, p] = plu(A)
%
%   I parametri della funzione sono:
%       A -> matrice quadrata non singolare
%
%   I valori di ritorno sono:
%       LU ->la matrice LU con informazione sui fattori L ed U
%       p -> vettore contenente la relativa permutazione   
%
[m,n]= size(A);
if m~=n
    error('matrice non quadrata');
end
p=(1:n);
LU=A;
for i=1:n-1
    [mi,ki]=max(abs(LU(i:n,i)));
    if mi==0
        error('matrice singolare')
    end
    ki=ki+i-1;
    if ki>i
        LU([i,ki],:)=LU([ki i],:);
        p([i ki])=p([ki i]);
    end
    LU(i+1:n,i) = LU(i+1:n,i) / LU(i,i);
    LU(i+1:n,i+1:n) = LU(i+1:n,i+1:n) - LU(i+1:n,i) * LU(i,i+1:n);
end
end


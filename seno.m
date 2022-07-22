function s=seno(x)
%
%   I parametri della funzione sono:
%       x -> vettore con valori compresi tra -pigreco e pigreco 
%
%
%    I valori di ritorno sono:
%       s -> vettore contenente il valore del seno calcolato in ogni punto
%       del vettore x
%
x=x';
if(abs(x(:))>pi)
    disp('Range Errato');
end
n=size(x);
s=zeros(n);
for i=1:n
    for j=13:-1:0
        s(i)=s(i)+(-1)^j * (x(i)^(2*j+1))/factorial(2*j+1);
    end
end
s=s';
end

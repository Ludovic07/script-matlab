function y=InterpolazioneLagrange(xi,fi,x)
%
%   I parametri della funzione sono:
%       xi -> ascisse di interpolazione
%       fi -> valori della funzione nelle ascisse xi
%       x -> ascisse su cui vogliamo valutare il polinomio
%   
%   I valori di ritorno sono:
%       y -> polinomio interpolante  
%
%
n=size(xi,2);
L=ones(n,size(x,2));
if (size(xi,2)~=size(fi,2))
   fprintf('Devono avere lo stesso numero di elementi');
   y=NaN; %se xi e fi hanno diversi numeri di elementi la funzione ritorna NaN
else
   for i=1:n
      for j=1:n
         if (i~=j)
            L(i,:)=L(i,:).*(x-xi(j))/(xi(i)-xi(j));
         end
      end
   end
   y=0;
   for i=1:n
      y=y+fi(i)*L(i,:);
   end
end
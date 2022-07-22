function y= InterpolazioneNewton(xi,fi,x)
%     
%   I parametri della funzione sono:
%       xi -> ascisse di interpolazione
%       fi -> valori della funzione nelle ascisse xi
%       x -> ascisse su cui vogliamo valutare il polinomio
%   
%   I valori di ritorno sono:
%       y -> polinomio interpolante  
%
%   Calcola il poliniomio interpolante di Newton sulle coppie
%   (xi,fi) nelle ascisse contenute nel vettore x
%
%
%
n=length(xi);
if n<=0 || n~=length(fi)
    error('dati inconsistenti');
end
for i=1:n-1
    for j=i+1:n
        if(xi(i)==xi(j))
            error('ascisse non distinte');
        end
    end
end
c=fi;   %calcolo delle differenze divise
for i=1:n-1
    for j=n:-1:i+1
        c(j)=(c(j)-c(j-1))/(xi(j)-xi(j-i));
    end
end
y=c(n)*ones(size(x));   %calcolo del polinomio
for i=n-1:-1:1
    y=y.*(x-xi(i))+c(i);
end
return
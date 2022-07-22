function y=PolinomioNewtonHermite(xi,fi,f1,x)
%
%   I parametri della funzione sono:
%      xi -> vettore di ascisse di interpolazione 
%      fi -> valori della funzione nelle ascisse 
%      f1 -> valori derivata prima
%      x -> ascisse su cui vogliamo calcolare il polinomio
%   
%   I valori di ritorno sono:
%      y -> vettore di valori del polinomio 
%
% 
n=length(xi);
if n~=length(fi) || n~=length(f1)
    error('dati inconsistenti')
end

for i=1:n-1
    for j=i+1:n
        if(xi(i)==xi(j))
            error('Ascisse non distinte')
        end
    end
end
n=2*n-1; 
xixi=zeros(n+1,1);
df=zeros(n+1,1);

%raddoppio il vettore delle ascisse di interpolazione
xixi(1:2:n)=xi(:);
xixi(2:2:n+1)=xi(:);
df(1:2:n)=fi(:);
df(2:2:n+1)=f1(:);

for i=n:-2:3 % seconda colonna della tabella
    df(i)=( df(i)-df(i-2) )/( xixi(i)-xixi(i-1) );
end


for i=2:n % colonne successive della tabella
    for j=n+1:-1:i+1
        df(j)=( df(j)-df(j-1) )/( xixi(j)-xixi(j-i) );
    end
end
if nargin==4
    % calcolo il polinomio interpolante nelle ascisse specificate
    y=df(n+1)*ones(size(x));
    for k=0:n-1
        y = y.*(x-xixi(n-k))+df(n-k);
    end
end

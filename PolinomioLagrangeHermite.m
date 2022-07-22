function y=PolinomioLagrangeHermite(xi,fi,f1,x)
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
n=length(xi);
z=length(x);
y=zeros(1,z);
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
phi=zeros(n,length(x));
csi=phi;
for i=1:z 
    for j=1:n
        Lk=1;
        L1k=0;
        for l=1:n
            if j~=l
                Lk=Lk*(x(i)-xi(l))/ (xi(j)-xi(l));
                L1k=L1k+(1/(xi(j)-xi(l)));
            end
        end
        phi(j)=(Lk^2)*(1-(2*(x(i)-xi(j))*L1k));
        csi(j)= (x(i)-xi(j))* (Lk^2);
        y(i)=y(i)+fi(j)*phi(j)+f1(j)*csi(j);
    end
end
end

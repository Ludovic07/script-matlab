function sp=coefficientispline(xi,fi)
%
%   I parametri della funzione sono:
%       xi -> vettore delle ascisse di interpolazione
%       fi -> vettore dei valori assunti dalla funzione da interpolare
%
%
%   I valori di ritorno sono:
%       sp -> vettore contenente i coefficienti della spline
%
%

m=length(xi);
[xi,ind]=sort(xi); 
fi=fi(ind); %ordino le ascisse

%Procedimenti intermedi 

hi=diff(xi); %h(i)=x(i)-x(i-1)
n=m-1;
dfi=diff(fi)./hi; %dfi=( f(i)-f(i-1) )/(x(i)-x(i-1))
h=hi(1:n-1)+hi(2:n); %h(i)+h(i+1)
z=6*diff(dfi)./h; %(6*f[x(i),x(i+1)]-f[x(i-1),x(i)])/(x(i+1)-x(i-1))
phi=hi(1:n-1)./h;
csi=hi(2:n)./h;        
phi=phi(2:n-1);
csi=csi(1:n-2);
d=2*ones(n-1,1);
n=length(d);
sp=z;

%Sistema lineare tridiagonale
for i=1:n-1
    phi(i)=phi(i)/d(i);
    d(i+1)=d(i+1)-phi(i)*csi(i);
    sp(i+1)=sp(i+1)-phi(i)*sp(i);
end

%Calcolo dei coefficienti mi 
sp(n)=sp(n)/d(n);
for i=n-1:-1:1
    sp(i)=(sp(i)-csi(i)*sp(i+1))/d(i);
end

sp=[0;sp';0];

end
function I2 = SimpsonAdattivo(f,a,b,tol,fa,f1,fb)
%
%       I parametri della funzione sono:   
%           f -> funzione integranda
%           a,b -> estremi interallo di integrazione
%           tol -> tollerenza richiesta 
%           fa,fb,f1 -> valutazione di funzione nei rispettivi punti 
%       
%       I valori di ritorno sono:
%           I2 -> approssimazione dell'integrale
%
%
if b<a || tol<0
    error('Dati inconsistenti');
end
global np;
x1=(a+b)/2;
if nargin<=4
    fa=feval(f,a);
    fb=feval(f,b);
    f1=feval(f,x1);
    np=3;
end
x2=(a+x1)/2;
x3=(x1+b)/2;
f2=feval(f,x2);
f3=feval(f,x3);
np=np+2;
I1=(b-a)/6*(f(a)+f(b)+4*f(x1)); %giusto
I2= (b-a)/12*(f(a)+f(b)+2*f(x1)+4*f(x2)+4*f(x3));
e=abs( I2-I1 )/15; %giusto
if e>tol 
    I2=SimpsonAdattivo(f,a,x1,tol/2,fa,f2,f1)+...
        SimpsonAdattivo(f,x1,b,tol/2,fb,f2,f3); 
end
if nargin<=4 
    fprintf('%i punti utilizzati\n',np);
end
end

function [val,Err] = CompositaNewton(a,b,n,f)
%
%      I parametri della funzione sono: 
%          a,b -> estremi interallo di integrazione
%          n -> grado di N-C 
%          f -> funzione integranda 
%
%      I valori di ritorno sono:
%          val -> approssimazione dell'integrale
%          Err -> stima dell'errore commesso 
%   
%

if b<a || n<1 
    error('Dati non validi');
end
f=feval(f,linspace(a,b,n+1)); 
% 2 funzioni suddivise nei 2 intervalli
f1=feval(f,linspace(a,(a+b)/2,n+1)); 
f2=feval(f,linspace((a+b)/2,b,n+1)); 
coef=CoeffNC(n); %calcolo i coeff di Newton-Cotes
val=sum(coef.*f1)+sum(coef.*f2);
h=(b-a)/n;
val=val*(h/2); 
If=h*(sum(coef.*f));
if n==2*fix(n/2)
   i=n+2; 
else
    i=n+1;
end
Err=abs(If-val)/(2^i-1);
end

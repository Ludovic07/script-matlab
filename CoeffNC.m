function c=CoeffNC(n)
%
%   I parametri della funzione sono:
%      n -> grado del polinomio Newton-Cotes
%
%   I valori di ritorno sono:
%      c -> vettore contenente i coefficienti
%
    syms x
    w=1;
    for i=0:n
        w=w*(x-i);
    end
    c=[];
    for i=0:n        
        f=w/(x-i);
        ci=int(f,[0,n])*(-1)^(n-i)/factorial(i)/factorial(n-i);
        c=[c ci];
    end
end

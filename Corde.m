function [x,i,tolf]=Corde(x0,df, f, nmax, tolx)
%     I parametri della funzione sono:
%       x0 -> il punto iniziale
%       f -> funzione di cui si vuole calcolare lo zero
%       df -> la derivata della funzione f
%       tolx -> tolleranza per la radice
%       nmax -> massimo numero di iterazioni (di default verra'
%       impostato a 100)
%
%   I valori di ritorno sono:
%       x -> la soluzione trovata
%       i -> il numero di iterazioni necessarie per ottenere la soluzione
%       tolf -> la tolleranza sulla funzione
i = 0;
fx0 = feval(f,x0);
f1x0 = feval(df,x0);
x = x0 - (fx0/f1x0);
while (i<nmax) && (abs(x-x0) > ( tolx * (1+abs(x0))))
i = i+1;
    x0 = x;
    fx0 = feval(f,x0);
    dfx=feval(df,x);
    tolf=tolx*abs(dfx);
    x = x0 - (fx0/f1x0);
end
if abs(x-x0) > (tolx * (1+abs(x0)))
    disp('Il metodo non converge');
end

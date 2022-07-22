function [x,i,tolf]=Secanti(x0,x1,f,tolx,nmax)
%
%   I parametri della funzione sono:
%       x0 -> prima approssimazione di x
%       x1 -> la seconda approssimazione di x
%       f -> funzione di cui si vuole calcolare lo zero
%       tolx -> tolleranza per la radice
%       nmax -> massimo numero di iterazioni (di default verra'
%       impostato a 100)
%
%   I valori di ritorno sono:
%       x -> la soluzione trovata
%       i -> il numero di iterazioni impiegate per ottenere la soluzione
%       tolf -> la tolleranza sulla funzione
%
%   
  i=1;
  fx0=feval(f,x0);
  err=abs(x1-x0);
  while (i<nmax && err>tolx)
      fx1=feval(f,x1);
      dfx1=(fx1-fx0)/(x1-x0);
      tolf=tolx*abs(dfx1);
      if abs(fx1)<=tolf
         break
      end
      x2=x1-(fx1/dfx1);
      err=abs(x2-x1);
      x0=x1;
      x1=x2;
      fx0=fx1;
      i=i+1;
  end
  x=x1;
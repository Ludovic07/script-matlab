function [x,i,tolf]=NewtonModificato(x0,r,f,df,tolx,nmax)
%
%
%   I parametri della funzione sono:
%       x0 -> il punto iniziale
%       r -> molteplicità della radice cercata
%       f -> funzione di cui si vuole calcolare lo zero
%       df -> la derivata della funzione f
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
  i=0;
  err=tolx+1;
  x=x0;
  while(i<nmax && err>tolx)
      fx=feval(f,x);
      dfx=feval(df,x);
      tolf=tolx*abs(dfx);
      if abs(fx)<=tolf
         break
      end
      x1=x-r*(fx/dfx);
      err=abs(x1-x);
      x=x1;
      i=i+1;
  end

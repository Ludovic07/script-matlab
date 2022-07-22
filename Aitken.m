function [x,i,tolf]=Aitken(x0,f,df,tolx,nmax)
%
%
%   I parametri della funzione sono:
%       x0 -> il punto iniziale
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
  while (i<nmax && err>tolx)
      x0=x;
      fx0=feval(f,x0);
      dfx0=feval(df,x0);
      tolf=tolx*abs(dfx0);
      if abs(fx0)<=tolf
         break
      end
      x1=x0-(fx0/dfx0);
      err=abs(x1-x0);
      if err<tolx
         break
      end
      fx1=feval(f,x1);
      dfx1=feval(df,x1);
      tolf=tolx*abs(dfx1);
      if abs(fx1)<=tolf
         break
      end
      x2=x1-(fx1/dfx1);
      err=abs(x2-x1);
      if err<tolx
         break
      end
      x=(x2*x0-(x1)^2)/(x2-2*x1+x0);
      err=abs(x0-x);
      i=i+1;
  end
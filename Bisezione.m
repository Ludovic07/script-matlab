function [x,i,tolf,nmax]=Bisezione(a,b,f,tolx)
%
% I parametri della funzione sono: 
%   f -> funzione di cui si vuole calcolare lo zero                    
%   a,b -> estremi dell'intevallo in cui si trova lo zero di f;                   
%          si richiede che f(a)f(b)<0
%   tolx -> tollerenaza su x
%
% I valori di ritorno sono:
%   x -> la soluzione trovata
%   i -> il numero di itereazioni per ottenere la soluzione
%   tolf -> la tolleranza sulla funzione
%   nmax-> il numero massimo di iterazioni necessarie per
%          per ottenere la soluzione con precisione tolx
%

nmax=ceil(log2(b-a)-log2(tolx));
  fa=feval(f,a);
  fb=feval(f,b);
  if fa*fb>0
     disp('La funzione deve soddisfare f(a)f(b)<0')
  end
  for i=1:nmax
      c=(a+b)/2;
      fc=feval(f,c);
      if abs(b-a)<tolx
          break
      end
      tolf=tolx*abs((fb-fa)/(b-a));
      if abs(fc)<=tolf
          break
      end
      if (fa*fc)<0
          b=c;
          fb=fc;
      else
          a=c;
          fa=fc;
      end
  end
  x=c;

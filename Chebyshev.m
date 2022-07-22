function x=Chebyshev(n,a,b)
%
%   I parametri della funzione sono:        
%       a, b -> estremi dell'intervallo
%       n -> numero di ascisse da calcolare 
%
%   I valori di ritorno sono:
%       x -> il vettore di grandezza n contentente le ascisse di Chebyshev
%
x=cos((2*(0:n-1)+1)*pi/(2*n));
x=((a+b)+(b-a)*x)/2;
return 

function s = spline0(xi, fi, xq)
%   
%   I parametri della funzione sono:
%       xi -> vettore delle ascisse di interpolazione
%       fi -> vettore dei valori assunti dalla funzione da interpolare
%       xq -> punti in cui vogliamo conoscere i valori della spline
%
%   I valori di ritorno sono:
%       s -> vettore con i valori della spline nei punti xq 
%
%

n = length(xi)-1;
mi = coefficientispline(xi,fi); 
s = zeros(size(xq));
j = 1;
for i = 2:n+1
    hi = xi(i) - xi(i-1);
    ri = fi(i-1) - (hi^2)/6 * mi(i-1);
    qi = (fi(i) - fi(i-1)) / hi - hi/6 * (mi(i) - mi(i-1));
fun = @(x)(((x-xi(i-1))^3 *mi(i) + (xi(i)-x)^3 * mi(i-1))/...
    (6 * hi) + qi * (x-xi(i-1)) + ri);
    while xq(j) < xi(i)
    s(j) = feval(fun, xq(j));
    j = j+1;
    end
end
     return
end
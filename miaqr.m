function x = miaqr(QR, b)
%   
%    I parametri della funzione sono:
%       QR -> la matrice A fattorizzata QR tramite 
%             la funzione qrfat
%       b -> vettore dei termini noti
%
%    I valori di ritorno sono: 
%       x -> il vettore soluzione del sistema lineare
%
[m,n]=size(QR);
x=b(:);
for i=1:n
    v = [1; QR(i+1:m, i)];
    beta = 2/(v' * v);
    x(i:m) = x(i:m) - (beta * (v' * x(i:m)))*v;
end
x = x(1:n);
for i = n:-1:1
    if QR(i,i) == 0
        error('non risolvibile');
    end
    x(i)=x(i)/QR(i,i);
    if i>1
        x(1:i-1) = x(1:i-1) - x(i) * QR(1:i-1, i);
    end
end
end

        
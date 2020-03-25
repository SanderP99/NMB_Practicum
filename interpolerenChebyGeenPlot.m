f1 = @(x) cos(x);
f2 = @(x) 1./(25*x.^2+1);
f = @(x) x.^2;

N = 200;
% Equidistante punten
x_equi = zeros(1,N);
for i = 1:1:N
    x_equi(i) = -1 + (i-1) .* 2/(N-1);
end
x_equi(N) = 1;

% Nulpunten
x_nul = zeros(1,N);
for i = 1:1:N
    x_nul(i) = cos(pi*(2*i-1)/(2*N));
end

[c, kappa] = interpolate(x_equi, f2);
interpolant = evalCheb(c, x_equi);


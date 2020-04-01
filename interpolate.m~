function [c, kappa] = interpolate(x,f)

% n bepalen
n = length(x);

% B vector opstellen
B = f(x)';

% M opstellen
M = zeros(n);
j = (1:n);
for i = 1:1:n
    M(i,j) = cos((j-1) * acos(x(i)));
end

% Conditiegetal
kappa = cond(M);

% QR-factorisatie
[Q, R] = qr(M);
c = R \ transpose(Q) * B;
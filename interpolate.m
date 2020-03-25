function [c, kappa] = interpolate(x,f)

% n bepalen
n = length(x);

% B vector opstellen
B = zeros([n,1]);
for i = 1:1:n
    B(i) = f(x(i));
end

% M opstellen
M = zeros(n);
for i = 1:1:n
    for j = 1:1:n
        M(i,j) = cos((j-1) * acos(x(i)));
    end
end

% Conditiegetal
kappa = cond(M);

% QR-factorisatie
[Q, R] = qr(M);
c = R \ transpose(Q) * B;



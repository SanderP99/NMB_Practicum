function [c, kappa] = interpolate(x,f)

% n bepalen
n = length(x);

% B vector opstellen
B = f(x)';

% M opstellen
j = (1:n);
M = cos((j-1) .* acos(x'));

% Conditiegetal
kappa = cond(M);

% Stelsel oplossen
c = M \ B;
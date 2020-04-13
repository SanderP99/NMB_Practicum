function v = evalCheb(a,x)

% Lengte van de vectoren bepalen
n = length(a);

% Vector v invullen
j = (1:n);
v = sum(a .* cos((j-1) .* acos(x')),2)';
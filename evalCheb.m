function v = evalCheb(a,x)

% Lengte van de vectoren bepalen
n = length(a);
N = length(x);

% Vector v invullen
v = zeros(1,N);
j = (1:n);
for i = 1:1:N
    v(i) = sum(a(j) .* cos((j-1) .* acos(x(i))));    
end
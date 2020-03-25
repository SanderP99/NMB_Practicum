function v = evalCheb(a,x)

% Lengte van de vectoren bepalen
n = length(a);
N = length(x);


% Vector v invullen
v = zeros(1,N);
for i = 1:1:N % v loop
    z = x(i);
    v(i) = 0;
    for j = 1:1:n % a en T loop
        v(i) = v(i) + a(j) * cos((j-1) * acos(z));
    end
end
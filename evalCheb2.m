function v = evalCheb2(a,x)

n = size(a,2);
N = size(x,2);

% Bepalen van Chebyshev veeltermen tot graad N
syms z;
T{1} = 1;
T{2} = z;

if n > 2
    for i = 3:1:n
        T{i} = 2 * z * T(i-1) - T(i-2);
    end
end

% Vector v invullen
v = zeros(1,N);
for i = 1:1:N % v loop
    z = x(i);
    t = 0;
    for j = 1:1:n % a en T loop
        t = t + a(j)*T{j};
    end
    v(i) = subs(t);
end

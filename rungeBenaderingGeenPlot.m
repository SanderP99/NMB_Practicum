% Runge functie
f = @(x) 1./(25*x.^2+1);
hold on
plot(x,f(x))

% 200 equidistante punten
x = zeros(1,200);
for i = 1:1:200
    x(i) = -1 + 1/200 + 2/200*(i-1);
end

% Benaderingen in V_2 tot V_20 in stappen van 2
for j = 2:2:20
    a = approxCheby(f,j);
    v = evalCheb(a,x);
    plot(x,v)
end
hold off

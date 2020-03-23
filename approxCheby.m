function a = approxCheby(f,n)

% z vector maken
z = zeros(1,n);
for i = 1:1:n+1
    z(i) = cos((i-1) * pi / n);
end

% f evalueren
v = zeros(1,n);
for i = 1:1:n+1
    v(i) = f(z(i));
end

% DCT berekenen
w = fliplr(v(2:end-1));
v_even = [v w];
V = fft(v_even)/n;
V = real(V(1:n+1));
V = [V(1)/2 V(2:end)];

a = V;




function a = approxCheby(f,n)

% z vector maken
i = (1:n+1);
z = cos((i-1) * pi / n);

% f evalueren
v = f(z);

% DCT berekenen
w = fliplr(v(2:end-1));
v_even = [v w];
V = fft(v_even)/n;
V = real(V(1:n+1));
a = [V(1)/2 V(2:end)];
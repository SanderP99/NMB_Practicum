% Runge functie
f = @(x) 1./(25*x.^2+1);

% 200 equidistante punten
x = zeros(1,200);
for i = 1:1:200
    x(i) = -1 + 1/200 + 2/200*(i-1);
end

% maxima
maxima = zeros(1,100);
n = zeros(1,100);

% Benaderingen in V_2 tot V_20 in stappen van 2
for j = 2:2:100
    a = approxCheby(f,j);
    v = evalCheb(a,x);
    n(j) = j;
    for i = 1:1:200
        afstand = abs(v(i) - f(x(i)));
        if afstand > maxima(j)
            maxima(j) = afstand;
        end
    end
end

figure('Renderer', 'painters', 'Position', [10 10 900 600], 'PaperPositionMode', 'auto');
semilogy(n(2:2:100),maxima(2:2:100))
set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
legend({'$\max_{x\in [-1,1]}|y_n(x)-f(x)|$'}, 'interpreter', 'latex', 'location', 'northeast', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
xlabel('$n$', 'interpreter', 'latex')
ylabel('Maximaal residu', 'interpreter', 'latex')

print  ('-r500', '-depsc2', 'rungeFout.eps')

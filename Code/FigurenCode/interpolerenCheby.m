f1 = @(x) cos(x);
f2 = @(x) 1./(25*x.^2+1);
figure('Renderer', 'painters', 'Position', [10 10 1500 600], 'PaperPositionMode', 'auto');
set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
hold on
fplot(f2)

% Punten om te evalueren
x = linspace(-1,1,300);

for n = [50,100,200]
    N = n;
    % Equidistante punten
    x_equi = zeros(1,N);
    for i = 1:1:N
        x_equi(i) = -1 + (i-1) .* 2/(N-1);
    end
    x_equi(N) = 1;

    % Nulpunten
    x_nul = zeros(1,N);
    for i = 1:1:N
        x_nul(i) = cos(pi*(2*i-1)/(2*N));
    end

    [c, kappa] = interpolate(x_equi, f2);
    interpolant = evalCheb(c', x);

    plot(x, interpolant)
end
legend({'$f(x) = \frac{1}{25x^2+1}$','50', '100', '200'}, 'interpreter', 'latex', 'location', 'south', 'NumColumns', 3, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
hold off
axis([-1 1 0 1]);

print  ('-r500', '-depsc2', 'runge_equi_hoog.eps') 
f1 = @(x) cos(x);
f2 = @(x) 1./(25*x.^2+1);
figure('Renderer', 'painters', 'Position', [10 10 900 600], 'PaperPositionMode', 'auto');
set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')

%fplot(f1)

% Punten om te evalueren
x = zeros(1,300);
for i = 1:1:200
    x(i) = -1 + 1/200 + 2/200*(i-1);
end

maxima = zeros(1,200);
n_maxima = zeros(1,200);

for n = 1:1:200
    n_maxima(n) = n;
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
    maxFout = 0;
    for i = 1:1:200
        afstand = abs(interpolant(i) - f2(x(i)));
        if afstand > maxima(n)
            maxima(n) = afstand;
        end
    end
        
    
end
%legend({'Fout'}, 'interpreter', 'latex', 'location', 'south', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
semilogy(n_maxima, maxima)
set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
%legend({'Maximaal residu'}, 'interpreter', 'latex', 'location', 'northeast', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
xlabel('$n$', 'interpreter', 'latex')
ylabel('Maximaal residu', 'interpreter', 'latex')
%axis([-1 1 0 1]);

print  ('-r500', '-depsc2', 'runge_equi_fout.eps')
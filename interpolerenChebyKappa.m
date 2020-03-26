f1 = @(x) cos(x);
f2 = @(x) 1./(25*x.^2+1);
figure('Renderer', 'painters', 'Position', [10 10 900 600], 'PaperPositionMode', 'auto');
set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')

%fplot(f1)

% Punten om te evalueren
x = zeros(1,200);
for i = 1:1:200
    x(i) = -1 + 1/200 + 2/200*(i-1);
end

kappas = zeros(1,100);
n_kappa = zeros(1,100);

for n = 1:1:100
    n_kappa(n) = n;
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

    [c, kappa] = interpolate(x_nul, f1);
    interpolant = evalCheb(c, x);
    kappas(n) = kappa;
        
    
end
%legend({'Fout'}, 'interpreter', 'latex', 'location', 'south', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
plot(n_kappa, kappas)
set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
%legend({'Conditiegetal $M$'}, 'interpreter', 'latex', 'location', 'northeast', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
xlabel('$n$', 'interpreter', 'latex')
ylabel('Conditiegetal $M$', 'interpreter', 'latex')
%axis([-1 1 0 1]);

print  ('-r500', '-depsc2', 'cos_nul_kappa.eps')
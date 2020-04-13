f1 = @(x) cos(x);
f2 = @(x) 1./(25*x.^2+1);
figure('Renderer', 'painters', 'Position', [10 10 1400 600], 'PaperPositionMode', 'auto');
set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
hold on
tiledlayout(2,3)
%fplot(f1)

% Punten om te evalueren
x = linspace(-1,1,300);

for n = [15,100, 200]
    nexttile
    N = n;
    % Equidistante punten
    x_equi = linspace(-1,1,N);
    
    % Nulpunten
    x_nul = zeros(1,N);
    for i = 1:1:N
        x_nul(i) = cos(pi*(2*i-1)/(2*N));
    end

    [c, kappa] = interpolate(x_equi, f2);
    interpolant = evalCheb(c', x);
    
    difference = zeros(1,300);
    for i = 1:300
        difference(i) = interpolant(i) - f2(x(i));
    end
    hold on
    semilogy(x,difference);
    if N < 20
        semilogy(x_equi, zeros(size(x_equi)), 'o','MarkerSize',10)
    end
    hold off
    hline = refline(0, 0);
    hline.Color = 'k';
    ylabel('Residu', 'interpreter', 'latex')
    set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
legend({strcat('n=',' ',  num2str(N))}, 'interpreter', 'latex', 'location', 'north', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');

    
end

for n = [15,100,200]
    nexttile
    N = n;
    % Equidistante punten
    x_equi = linspace(-1,1,N);
    
    % Nulpunten
    x_nul = zeros(1,N);
    for i = 1:1:N
        x_nul(i) = cos(pi*(2*i-1)/(2*N));
    end

    [c, kappa] = interpolate(x_nul, f2);
    interpolant = evalCheb(c', x);
    
    difference = zeros(1,300);
    for i = 1:300
        difference(i) = interpolant(i) - f2(x(i));
    end
    hold on
    semilogy(x,difference);
    if N < 20
        semilogy(x_nul, zeros(size(x_nul)), 'o','MarkerSize',10)
    end
    hold off
    hline = refline(0, 0);
    hline.Color = 'k';
    ylabel('Residu', 'interpreter', 'latex')
    set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
    legend({strcat('n=',' ',  num2str(N))}, 'interpreter', 'latex', 'location', 'north', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');

    
end
%legend({'Fout'}, 'interpreter', 'latex', 'location', 'south', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
%set(gca, 'Units', 'normalized','FontUnits','points','FontWeight','normal','FontSize',14,'FontName','Times')
%legend({'100'}, 'interpreter', 'latex', 'location', 'southeast', 'NumColumns', 1, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
%ylabel('Fout $g - f$', 'interpreter', 'latex')
%axis([-1 1 0 8]);
hold off
print  ('-r500', '-depsc2', 'runge_heleFout.eps')
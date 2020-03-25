f = @(x) 1./(25*x.^2+1);
figure('Renderer', 'painters', 'Position', [10 10 1500 600], 'PaperPositionMode', 'auto');
colormap(jet)
hold on
plot(x,f(x))

x = zeros(1,200);
for i = 1:1:200
    x(i) = -1 + 1/200 + 2/200*(i-1);
end

for j = 2:2:20
    a = approxCheby(f,j);
    v = evalCheb(a,x);
    plot(x,v)
    axis([-1 1 -0.5 1.5]);
    w
end
legend({'$f(x) = \frac{1}{25x^2+1}$', '$V_2$','$V_4$', '$V_6$', '$V_8$', '$V_{10}$', '$V_{12}$', '$V_{14}$', '$V_{16}$', '$V_{18}$', '$V_{20}$'}, 'interpreter', 'latex', 'location', 'south', 'NumColumns', 3, 'FontSize', 20,'FontWeight', 'normal', 'FontName', 'Times');
hold off

print  ('-r500', '-depsc2', 'rungeBenadering.eps')
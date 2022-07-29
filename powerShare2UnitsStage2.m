function x = powerShare2UnitsStage2(xx)

options = optimoptions('fmincon');
options.Display = 'off';
options.Algorithm = 'sqp';

fun = @maxEff;

x = fmincon(fun,[0.01 0.01],[1 1],xx,[1 1],xx,[0 0],[1 1],[],options);

end

function y = maxEff(x)

Pnorm = [0 1];
eff1 = [0.8 0.2];
eff2 = [0.6 0.4];

y1 = interp1(Pnorm,eff1,x(1));
y2 = interp1(Pnorm,eff2,x(2));

y = x(1)/y1 + x(2)/y2;

end
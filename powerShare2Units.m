function x = powerShare2Units(xx)

options = optimoptions('fmincon');
options.Display = 'off';
options.Algorithm = 'sqp';

fun = @maxEff;

x = fmincon(fun,[0.01 0.01],[1 1],xx,[1 1],xx,[0 0],[1 1],[],options);

end

function y = maxEff(x)

Pnorm = 0:.01:1;

eff1 =[
    0.7847    0.7847    0.7747    0.7687    0.7640    0.7604    0.7573    0.7546,...
    0.7522    0.7501    0.7481    0.7462    0.7445    0.7428    0.7413    0.7398,...
    0.7384    0.7371    0.7358    0.7346    0.7335    0.7323    0.7312    0.7301,...
    0.7289    0.7279    0.7269    0.7260    0.7250    0.7241    0.7232    0.7223,...
    0.7215    0.7207    0.7199    0.7191    0.7183    0.7174    0.7165    0.7156,...
    0.7147    0.7138    0.7129    0.7120    0.7111    0.7103    0.7094    0.7085,...
    0.7076    0.7068    0.7059    0.7051    0.7043    0.7035    0.7027    0.7020,...
    0.7012    0.7004    0.6997    0.6989    0.6982    0.6974    0.6967    0.6960,...
    0.6953    0.6945    0.6938    0.6931    0.6924    0.6917    0.6910    0.6903,...
    0.6896    0.6889    0.6883    0.6876    0.6869    0.6862    0.6856    0.6849,...
    0.6843    0.6836    0.6830    0.6823    0.6817    0.6811    0.6804    0.6798,...
    0.6792    0.6786    0.6780    0.6773    0.6767    0.6761    0.6755    0.6749,...
    0.6744    0.6738    0.6732    0.6726    0.6720];

eff2 = [
    0.7678    0.7678    0.7556    0.7479    0.7423    0.7378    0.7340    0.7307,...
    0.7277    0.7250    0.7225    0.7202    0.7180    0.7160    0.7141    0.7123,...
    0.7105    0.7088    0.7072    0.7057    0.7042    0.7028    0.7013    0.6999,...
    0.6986    0.6973    0.6960    0.6948    0.6937    0.6925    0.6914    0.6904,...
    0.6893    0.6883    0.6873    0.6862    0.6850    0.6838    0.6826    0.6814,...
    0.6802    0.6790    0.6779    0.6767    0.6756    0.6744    0.6732    0.6721,...
    0.6710    0.6698    0.6687    0.6676    0.6664    0.6653    0.6642    0.6631,...
    0.6621    0.6610    0.6600    0.6590    0.6580    0.6570    0.6560    0.6551,...
    0.6541    0.6531    0.6521    0.6512    0.6502    0.6493    0.6483    0.6474,...
    0.6464    0.6455    0.6446    0.6436    0.6427    0.6418    0.6409    0.6400,...
    0.6391    0.6383    0.6374    0.6365    0.6356    0.6348    0.6339    0.6331,...
    0.6322    0.6314    0.6305    0.6297    0.6289    0.6280    0.6272    0.6264,...
    0.6256    0.6248    0.6240    0.6232    0.6225];

y1 = interp1(Pnorm,eff1,x(1));
y2 = interp1(Pnorm,eff2,x(2));

y = x(1)/y1 + x(2)/y2;

end
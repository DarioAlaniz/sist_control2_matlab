%motor 
function [X]=modmotor(t_etapa, xant, accion,Tl)
Laa=366e-6; J=5e-9;Ra=55.6;B=0;Ki=6.49e-3;Km=6.53e-3;
Va=accion;
h=1e-7;TL=Tl;
omega= xant(1);
wp= xant(2);
ia=xant(3);
theta = xant(4);
for ii=1:t_etapa/h
    wpp =(-wp*(Ra*J+Laa*B)-omega*(Ra*B+Ki*Km)+Va*Ki)/(J*Laa);
    iap=(-Ra*ia-Km*omega+Va)/Laa;
    wp=wp+h*wpp;
    wp=wp-((1/J)*TL);%torque
    ia=ia+iap*h;
    omega = omega + h*wp;
    thetap = omega; 
    theta = theta + h*thetap;
end
X=[omega,wp,ia,theta];
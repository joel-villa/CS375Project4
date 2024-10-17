% Joel Villarreal
% Parts of the following code were given in class
% Runge function and interpolation issues

%% (a) degree 10 polynomial, n = 10, interpolates 11 equally spaced nodes
clear;
clc;

n = 10;

a=-5;
b=5;

h = (b-a)/(n);
x = a:h:b;
y = 1./(1+x.^2);
a_coeff = Coef(n,x,y);
xval = -5:.1:5;
for i = 1 : length(xval)
    yval(i) = Eval(n,x,a_coeff,xval(i));
end

plot(x,y,'rx--');
hold on
plot(xval,yval,'bo');
plot(xval,1./(1+xval.^2),'ko');
legend('data points','P_1_0(x)','exact');
grid on
title('P_1_0(x), interpolating Runge function at 11 equally spaced nodes');

%% (b) degree 10 polynomial, interpolating 11 Cheby Shev Nodes
clear;
clc;

n = 10;

a=-5;
b=5;

x = ChebyShev(n, a, b);
y = 1./(1+x.^2);
a_coeff = Coef(n,x,y);
xval = -5:.1:5;
for i = 1 : length(xval)
    yval(i) = Eval(n,x,a_coeff,xval(i));
end

plot(x,y,'rx--');
hold on
plot(xval,yval,'bo');
plot(xval,1./(1+xval.^2),'ko');
legend('data points','G_1_0(x)','exact');
grid on
title('G_1_0(x), interpolating Runge function at 11 Cheby Shev Nodes');

%% (c) Comparing (a) and (b)
clear;
clc;

n = 10;

a=-5;
b=5;
xval = a:.1:b;


% P10(x)
h = (b-a)/(n);
x_P = a:h:b;
y = 1./(1+x_P.^2);
coeff_P = Coef(n,x_P,y);

% G10(x)
x_G = ChebyShev(n, a, b);
y = 1./(1+x_G.^2);
coeff_G = Coef(n,x_G,y);

for i = 1 : length(xval)
    yval_G(i) = Eval(n,x_G,coeff_G,xval(i));
    yval_P(i) = Eval(n,x_P,coeff_P,xval(i));
end

plot(xval,yval_P,'ro');
hold on
plot(xval,yval_G,'bo');
plot(xval,1./(1+xval.^2),'-x');
legend('P_1_0(x)','G_1_0(x)','exact');
grid on
title('G_1_0(x) vs. P_1_0(x)');

%% (d) G20(x), G40(x), G60(x)
clear;
clc;

n1 = 20;
n2 = 40;
n3 = 60;

a=-5;
b=5;

% n1 = 20, for G20(x)
x1 = ChebyShev(n1, a, b);
y1 = 1./(1+x1.^2);
coeff1 = Coef(n1,x1,y1);
% n2 = 40, for G40(x)
x2 = ChebyShev(n2, a, b);
y2 = 1./(1+x2.^2);
coeff2 = Coef(n2,x2,y2);
% n3 = 60, for G60(x)
x3 = ChebyShev(n3, a, b);
y3 = 1./(1+x3.^2);
coeff3 = Coef(n3,x3,y3);

xval = -5:.1:5;
for i = 1 : length(xval)
    yval1(i) = Eval(n1,x1,coeff1,xval(i));
    yval2(i) = Eval(n2,x2,coeff2,xval(i));
    yval3(i) = Eval(n3,x3,coeff3,xval(i));
end

plot(xval,1./(1+xval.^2),'k-');
hold on
plot(xval,yval1,'bo');
plot(xval,yval2,'ro');
plot(xval,yval3,'go');

axis([-5 5 -0.5 2]);
legend('exact','G_2_0(x)','G_4_0(x)', 'G_6_0(x)');
grid on
title('G_2_0(x) vs. G_4_0(x) vs. G_6_0(x)');

% NOTE: the following sections REQUIRE that this section ^ to have already
% been run
%% (d) (i) just G20
plot(xval,1./(1+xval.^2),'k-');
hold on
plot(xval,yval1,'bo');

axis([-5 5 -0.5 2]);
legend('exact','G_2_0(x)');
grid on
title('G_2_0(x)');
hold off

%% (d) (ii) just G40
plot(xval,1./(1+xval.^2),'k-');
hold on
plot(xval,yval2,'ro');

axis([-5 5 -0.5 2]);
legend('exact','G_4_0(x)');
grid on
title('G_4_0(x)');
hold off

%% (d) (iii) just G60
plot(xval,1./(1+xval.^2),'k-');
hold on
plot(xval,yval3,'go');

axis([-5 5 -0.5 2]);
legend('exact','G_6_0(x)');
grid on
title('G_6_0(x)');
hold off
clear; clc;
warning('off')

fprintf("Question-1\n");
p = @(x) 1;
q = @(x) 2;
r = @(x) cos(x);
y_sol = @(x) -0.1 * (sin(x) + 3 * cos(x));

N1 = 2;
N2 = 4;

a = 0;
b = pi / 2;

alpha = -0.3;
beta = -0.1;

% que1(a, b, str, N1, N2, var, p, q, r, y_sol, alpha, beta);
output_file();

fprintf("Question-2")
fprintf("\ni) Forward\n");
% 
% n1 = 10;  
% a1 = 1;
% b1 = 2;
% alpha1 = 0.5;
% beta1 = log(2);
% 
% p1 = @(x) -4 / x;
% q1 = @(x) - 2 / (x ^ 2);
% r1 = @(x) 2 * log(x) / (x ^ 2);
% y1 = @(x) (4 / x) - (2 / (x ^ 2)) + log(x) - 1.5;
% 
% 
% result2ifa = forward(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2ifb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 1);
% disp1(result2ifa);
% disp2(result2ifb);
% plot1(result2ifa, "Q2afor-yvst.png");
% plot2(result2ifa, "Q2afor-errorvst.png");
% plot3(result2ifb, "Q2afor-loglogn.png", 1);
% plot4(result2ifb, "Q2afor-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\ni) Backward\n");
% 
% result2iba = backward(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2ibb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 2);
% disp1(result2iba);
% disp2(result2ibb);
% plot1(result2iba, "Q2aback-yvst.png");
% plot2(result2iba, "Q2aback-errorvst.png");
% plot3(result2ibb, "Q2aback-loglogn.png", 1);
% plot4(result2ibb, "Q2aback-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\nparti) Central\n");
% 
% result2ica = central(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2icb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 3);
% disp1(result2ica);
% disp2(result2icb);
% plot1(result2ica, "Q2acent-yvst.png");
% plot2(result2ica, "Q2acent-errorvst.png");
% plot3(result2icb, "Q2acent-loglogn.png", 2);
% plot4(result2icb, "Q2acent-orderplot.png");
% 
% close(gcf);
% 
fprintf("--------------------------------------------------------------\n");

fprintf("\nii) Forward\n");
% 
% n1 = 10;  
% a1 = 0;
% b1 = 2;
% alpha1 = 0;
% beta1 = -4;
% 
% p1 = @(x) 2;
% q1 = @(x) -1;
% r1 = @(x) x * exp(x) - x;
% y1 = @(x) ((x ^ 3) * exp(x) / 6) - (x * exp(x) * 5 / 3) + 2 * exp(x) - x - 2;
% 
% 
% result2iifa = forward(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2iifb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 1);
% disp1(result2iifa);
% disp2(result2iifb);
% plot1(result2iifa, "Q2bfor-yvst.png");
% plot2(result2iifa, "Q2bfor-errorvst.png");
% plot3(result2iifb, "Q2bfor-loglogn.png", 1);
% plot4(result2iifb, "Q2bfor-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\nii) Backward\n");
% 
% result2iiba = backward(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2iibb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 2);
% disp1(result2iiba);
% disp2(result2iibb);
% plot1(result2iiba, "Q2bback-yvst.png");
% plot2(result2iiba, "Q2bback-errorvst.png");
% plot3(result2iibb, "Q2bback-loglogn.png", 1);
% plot4(result2iibb, "Q2bback-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\nii) Central\n");
% 
% result2iica = central(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2iicb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 3);
% disp1(result2iica);
% disp2(result2iicb);
% plot1(result2iica, "Q2bcent-yvst.png");
% plot2(result2iica, "Q2bcent-errorvst.png");
% plot3(result2iicb, "Q2bcent-loglogn.png", 2);
% plot4(result2iicb, "Q2bcent-orderplot.png");
% 
% close(gcf);

fprintf("--------------------------------------------------------------\n");

fprintf("\niii) Forward\n");

n1 = 10;  
a1 = 0;
b1 = pi / 2;
alpha1 = -0.1;
beta1 = 0.3;

p1 = @(x) 1;
q1 = @(x) 2;
r1 = @(x) cos(x);
y1 = @(x) -(sin(x) + 3 * cos(x)) / 10;


% result2iiifa = forward2(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2iiifb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 4);
% disp1(result2iiifa);
% disp2(result2iiifb);
% plot1(result2iiifa, "Q2cfor-yvst.png");
% plot2(result2iiifa, "Q2cfor-errorvst.png");
% plot3(result2iiifb, "Q2cfor-loglogn.png", 1);
% plot4(result2iiifb, "Q2cfor-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\niii) Backward\n");
% 
% result2iiiba = backward2(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2iiibb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 5);
% disp1(result2iiiba);
% disp2(result2iiibb);
% plot1(result2iiiba, "Q2cback-yvst.png");
% plot2(result2iiiba, "Q2cback-errorvst.png");
% plot3(result2iiibb, "Q2cback-loglogn.png", 1);
% plot4(result2iiibb, "Q2cback-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\niii) Central\n");
% 
% result2iiica = central2(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2iiicb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 6);
% disp1(result2iiica);
% disp2(result2iiicb);
% plot1(result2iiica, "Q2ccent-yvst.png");
% plot2(result2iiica, "Q2ccent-errorvst.png");
% plot3(result2iiicb, "Q2ccent-loglogn.png", 2);
% plot4(result2iiicb, "Q2ccent-orderplot.png");
% 
% close(gcf);

fprintf("--------------------------------------------------------------\n");

fprintf("\niv) Forward\n");

n1 = 10;  
a1 = -1;
b1 = 0;
alpha1 = -2;
beta1 = 1;

p1 = @(x) -x;
q1 = @(x) 2;
r1 = @(x) 2 + (2 + (x ^ 2)) * exp(x);
y1 = @(x) (x ^ 2) + x * exp(x);


% result2ivfa = forward2(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2ivfb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 4);
% disp1(result2ivfa);
% disp2(result2ivfb);
% plot1(result2ivfa, "Q2dfor-yvst.png");
% plot2(result2ivfa, "Q2dfor-errorvst.png");
% plot3(result2ivfb, "Q2dfor-loglogn.png", 1);
% plot4(result2ivfb, "Q2dfor-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\niv) Backward\n");
% 
% result2ivba = backward2(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2ivbb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 5);
% disp1(result2ivba);
% disp2(result2ivbb);
% plot1(result2ivba, "Q2dback-yvst.png");
% plot2(result2ivba, "Q2dback-errorvst.png");
% plot3(result2ivbb, "Q2dback-loglogn.png", 1);
% plot4(result2ivbb, "Q2dback-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\niv) Central\n");
% 
% result2ivca = central2(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2ivcb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 6);
% disp1(result2ivca);
% disp2(result2ivcb);
% plot1(result2ivca, "Q2dcent-yvst.png");
% plot2(result2ivca, "Q2dcent-errorvst.png");
% plot3(result2ivcb, "Q2dcent-loglogn.png", 2);
% plot4(result2ivcb, "Q2dcent-orderplot.png");
% 
% close(gcf);

fprintf("--------------------------------------------------------------\n");

fprintf("\nv) Forward\n");

n1 = 10;  
a1 = 0;
b1 = 1;
alpha1 = exp(1) - 3;
beta1 = 1 - (2 / exp(1));

p1 = @(x) -2;
q1 = @(x) -1;
r1 = @(x) x;
y1 = @(x) 2 * exp(-x) + (exp(1) - 2) * x * exp(-x) + x - 2;

% 
% result2vfa = forward3(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2vfb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 7);
% disp1(result2vfa);
% disp2(result2vfb);
% plot1(result2vfa, "Q2efor-yvst.png");
% plot2(result2vfa, "Q2efor-errorvst.png");
% plot3(result2vfb, "Q2efor-loglogn.png", 1);
% plot4(result2vfb, "Q2efor-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\nv) Backward\n");
% 
% result2vba = backward3(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2vbb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 8);
% disp1(result2vba);
% disp2(result2vbb);
% plot1(result2vba, "Q2eback-yvst.png");
% plot2(result2vba, "Q2eback-errorvst.png");
% plot3(result2vbb, "Q2eback-loglogn.png", 1);
% plot4(result2vbb, "Q2eback-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\nv) Central\n");
% 
% result2vca = central3(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2vcb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 9);
% disp1(result2vca);
% disp2(result2vcb);
% plot1(result2vca, "Q2ecent-yvst.png");
% plot2(result2vca, "Q2ecent-errorvst.png");
% plot3(result2vcb, "Q2ecent-loglogn.png", 2);
% plot4(result2vcb, "Q2ecent-orderplot.png");
% 
% close(gcf);

fprintf("--------------------------------------------------------------\n");

fprintf("\nvi) Forward\n");

n1 = 10;  
a1 = 0;
b1 = pi / 4;
alpha1 = sqrt(2);
beta1 = 2 - sqrt(2);

p1 = @(x) -cos(x);
q1 = @(x) -1;
r1 = @(x) (sqrt(2) - 1) * (cos(x) ^ 2) - sin(2 * x) / 2;
y1 = @(x) cos(x) + (sqrt(2) - 1) * sin(x);

% 
% result2vifa = forward3(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2vifb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 7);
% disp1(result2vifa);
% disp2(result2vifb);
% plot1(result2vifa, "Q2ffor-yvst.png");
% plot2(result2vifa, "Q2ffor-errorvst.png");
% plot3(result2vifb, "Q2ffor-loglogn.png", 1);
% plot4(result2vifb, "Q2ffor-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\nvi) Backward\n");
% 
% result2viba = backward3(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2vibb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 8);
% disp1(result2viba);
% disp2(result2vibb);
% plot1(result2viba, "Q2fback-yvst.png");
% plot2(result2viba, "Q2fback-errorvst.png");
% plot3(result2vibb, "Q2fback-loglogn.png", 1);
% plot4(result2vibb, "Q2fback-orderplot.png");
% 
% close(gcf);
% 
% fprintf("\nvi) Central\n");
% 
% result2vica = central3(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1);
% result2vicb = find_order(n1, a1, b1, alpha1, beta1, p1, q1, r1, y1, 9);
% disp1(result2vica);
% disp2(result2vicb);
% plot1(result2vica, "Q2fcent-yvst.png");
% plot2(result2vica, "Q2fcent-errorvst.png");
% plot3(result2vicb, "Q2fcent-loglogn.png", 2);
% plot4(result2vicb, "Q2fcent-orderplot.png");
% 
% close(gcf);




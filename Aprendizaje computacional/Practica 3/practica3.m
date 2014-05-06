clear all
close all
clc

%Calcular datos
N = 80; 
x = 4*(rand(1, N)-0.5);
[x, ind] = sort(x);
t = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)- 0.2*tanh(0.1*x - 0.5);
t = t + 0.2*std(t) * randn(size(t)); %Ruido
c = x(floor(1 + (N - 1) .* rand(1, 5)));
s = (max(c) - min(c)) / sqrt(2*length(c));

w = fbrfit(x, t, c, s);
h = fbrval(x, w, c, s);
hc = fbrval(c, w, c, s);

%dibujar
figure, plot(x, t, 'om'); hold on;
plot(x, h, 'b');
plot(c, hc, 'sr');
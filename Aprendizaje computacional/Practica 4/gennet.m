clear all
close all
clc
xn = load('wine_data.txt');
x=xn(:,2:end);
y=zeros(length(xn), 3);
y(find(x(:, 1) == 1),1)=1;
y(find(x(:, 1) == 2),2)=2;
y(find(x(:, 1) == 3),3)=3;
net = newff(minmax(x'), [14 3], {'tansig' 'logsig'}, 'trainlm');

net.trainParam.showWindow = 0;
net.trainParam.epochs = 100;
net.trainParam.goal = 0.01;

net = train(net,x', y'); 
save net;
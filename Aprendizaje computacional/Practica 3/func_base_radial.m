function W = func_base_radial()
	clear all, close all;
	NUMPOINTS=30;
	x = 4*(rand(1,NUMPOINTS)-0.5);
	x = sort(x);
	
	yok = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)-0.2*tanh(0.1*x - 0.5);
	RUIDO = 0.2*std(yok);
	yruido = RUIDO*randn(size(yok));
	y= yok + yruido;
	
	sigma=abs(x(1)-x(end))/NUMPOINTS;
	msigma=zeros(NUMPOINTS);
	for i=1:NUMPOINTS
		msigma(i,:)=normpdf(x,x(i),sigma);
	end
	w=inv(msigma)*y';
	
	plot(x,y,'ko'),hold on;
	h=w'*msigma;
	plot(x,h), hold on;
	plot(x,msigma,'g'), hold on;
	x2= -2:0.1:2;
	for i=1:length(x)
		phi_2(i,:)=normpdf(x2,x(i),sigma);
	end
	y2=w'*phi_2;
	plot(x2,y2,'r');
end

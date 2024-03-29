%Luis José Quintana Bolaño y Javier Osuna Herrera

NUMPOINTS=50;
MAX=15;
ITERA=100;
EGt=zeros(1,MAX);
EEt=zeros(1,MAX);
EGbt=zeros(1,MAX);
EEbt=zeros(1,MAX);
for i=1:ITERA
x = 4*(rand(1,NUMPOINTS)-0.5);
yok = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)- 0.2*tanh(0.1*x - 0.5);
RUIDO = 0.2*std(yok);
yruido = RUIDO*randn(size(yok));
y= yok + yruido;

xeg=4*(rand(1,NUMPOINTS)-0.5);
yegok=1.8*tanh(3.2*xeg + 0.8)- 2.5*tanh(2.1*xeg + 1.2)- 0.2*tanh(0.1*xeg - 0.5);
RUIDO= 0.2*std(yegok);
yegruido=RUIDO*randn(size(yegok));
yeg=yegok+yegruido;

EG=zeros(1,MAX);
EE=zeros(1,MAX);
EGb=zeros(1,MAX);
EEb=zeros(1,MAX);
for grado=2:MAX
	c = x(floor(1 + (NUMPOINTS - 1) .* rand(1, grado)));
	s = (max(c) - min(c)) / sqrt(2*length(c));
	p=polyfit(x,y,grado); 
	EE(grado)=sum((y-polyval(p,x)).^2)/length(y);
	EG(grado)=sum((yeg-polyval(p,xeg)).^2)/length(yeg);
	w = fbrfit(x, y, c, s);
	EEb(grado)=sum((y-fbrval(x, w, c, s)').^2)/length(y);
	EGb(grado)=sum((yeg-fbrval(xeg, w, c, s)').^2)/length(yeg);
end
EGt=EGt+EG;
EEt=EEt+EE;
EGbt=EGbt+EGb;
EEbt=EEbt+EEb;
end
EG=EGt/ITERA;EE=EEt/ITERA;EGb=EGbt/ITERA;EEb=EEbt/ITERA;
figure, plot(log(EG),'b');hold on; plot(log(EE),'r'); plot(log(EGb),'m'); plot(log(EEb),'g'); legend('EG','EE','EGb','EEb'); hold off;

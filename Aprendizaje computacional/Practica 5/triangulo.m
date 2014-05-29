clear all;
puntos = rands(2,5000)*50;
distancia=sum(puntos.^2);
a=2;
b=-4;
datos  = puntos(:,find(puntos(2,:)<(puntos(1,:)*a+b) & puntos(2,:)<(puntos(1,:)*-a-b)));

plot(datos(1,:),datos(2,:),'o');
pause
w=gridtop(6,6);
vecindad=linkdist(w);

W=som(datos,w,vecindad,50,0.2);
clase=zeros(1,length(datos));
for i=1:length(datos);
    [~,clase(i)]=min(dist(W', datos(:,i)));
end
close all;
colores=['ob'; 'or'; 'om'; 'og'; 'oy'];
j=0;
figure, plotsom(W',vecindad);hold on;
for i=1:length(clase)
	j=j+1;
		plot(datos(1,find(clase==i)),datos(2,find(clase==i)),colores(j,:));
	if(j==5)
		j=0;
	end
end

%plotpat(puntos,clase,'.');

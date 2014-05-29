clear all;
puntos = rands(2,5000)*50;
distancia=sum(puntos.^2);
datos  = puntos(:,find(distancia>400 & distancia<1600));

plot(datos(1,:),datos(2,:),'o');

w=gridtop(6,6);
vecindad=linkdist(w);

W=som(datos,w,vecindad,50,0.2);
clase=zeros(1,length(datos));
for i=1:length(datos);
    [~,clase(i)]=min(dist(W', datos(:,i)));
end

colores=['ob' 'or' 'om' 'og' 'oy'];
j=0;
figure;
for i=1:length(clase)
	j=j+1;
		plot(datos(1,find(clase==i)),datos(2,find(clase==i)),colores(j)); hold on;
	if(j==5)
		j=0;
	end
end

%plotpat(puntos,clase,'.');

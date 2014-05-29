puntos = rands(2,5000)*50;
dist=sum(puntos.^2);
datos  = puntos(:,find(dist>400 & dist<1600));

plot(datos(1,:),datos(2,:),'o');

w=gridtop(6,6);
vecindad=linkdist(w);

W=som(datos,w,vecindad,50,0.2);
clase=zeros(1,length(puntos));
for i=1:length(puntos);
	[~,clase(i)]=min(dist(W', puntos(:,i)));
end

colores=['ob' 'or' 'om' 'og' 'oy'];
for i=1:5:length(clase)
	for j=1:5
		plot(datos(1,find(clase==i+j)),datos(2,find(clase==i+j),colores(j))); hold on;
	end
end

plotpat(puntos,clase,'.');

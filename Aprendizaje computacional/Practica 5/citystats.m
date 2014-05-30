clear all;
load cities.mat
ratings=ratings';

%Cojemos salud y economia
ratings=ratings([3,9],:);
%size(ratings)
plo=0;
for ta=[2,3,4,6]
    plo=plo+1;
w=gridtop(ta,1);
vecindad=linkdist(w);
W=som(ratings,w,vecindad,50,0.2);

clase=zeros(1,length(ratings));
for i=1:length(ratings);
    [~,clase(i)]=min(dist(W', ratings(:,i)));
end

%close all;
%colores=['ob'; 'or'; 'om'; 'og'; 'oy'];
%j=0;
hold off;
subplot(2,2,plo)
plotsom(W',vecindad);hold on;
        plotpat(ratings,clase,'.')
for i=1:length(clase)
	%j=j+1;
	%	plot(ratings(1,find(clase==i)),ratings(2,find(clase==i)),colores(j,:));%hold on
	%if(j==5)
	%	j=0;
    %end
    %disp('Categori '); i
    if (~isempty(names(find(clase==i),:)))
        i
        names(find(clase==i),:)
    end
end
end

%plotpat(puntos,clase,'.');

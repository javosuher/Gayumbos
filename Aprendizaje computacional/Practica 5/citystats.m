clear all;
load cities.mat
ratings=ratings';
positions = hextop(6,6);

%Cojemos salud y economia
ratings=ratings([3,9],:);
%size(ratings)

w=gridtop(6,6);
vecindad=linkdist(w);
W=som(ratings,w,vecindad,50,0.2);

clase=zeros(1,length(ratings));
for i=1:length(ratings);
    [~,clase(i)]=min(dist(W', ratings(:,i)));
end

close all;
%colores=['ob'; 'or'; 'om'; 'og'; 'oy'];
%j=0;
figure, plotsom(W',vecindad);hold on;
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

%plotpat(puntos,clase,'.');

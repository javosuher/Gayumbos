function centroides=kmeans(x,n,c0);

if nargin==2,
   [~ numpat]=size(x);
   [~ indices]=sort(rand(1,numpat));
   indices=indices(1:n);
   centroides=x(:,indices);
else,
   centroides=c0;
end;

suma=1;
sumaant = 0;
contador=1;
while (sumaant ~= suma) & (contador<100),
   sumaant = suma;
   [ganadores,distancias]=mycenter(x,centroides);
   
   suma = sum(distancias);
   for i=1:n,
      centroides(:,i)=meanpat(myclass(x,ganadores,i));
   end;
   contador=contador+1
   pause(0.1);
end;


x=load('wine_data.txt');
k=5;
c1=x(find(x(:,1)==1),2:end);
c2=x(find(x(:,1)==2),2:end);
c3=x(find(x(:,1)==3),2:end);

for i=1:k
	[x1t,x1v,y1t,y1v] = crossval(

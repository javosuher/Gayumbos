
x=load('wine_data.txt');
k=5;
c1=x(find(x(:,1)==1),2:end);
c2=x(find(x(:,1)==2),2:end);
c3=x(find(x(:,1)==3),2:end);

y1=zeros(3,length(c1));
y2=zeros(3,length(c2));
y3=zeros(3,length(c3));
y1(:,1)=1;
y2(:,2)=2;
y3(:,3)=3;
for i=1:k
	[x1t,x1v,y1t,y1v] = crossval(c1,y1,k,i);
	[x2t,x2v,y2t,y2v] = crossval(c2,y2,k,i);
	[x3t,x3v,y3t,y3v] = crossval(c3,y3,k,i);
	
	%for i=3:10
	%	net=newff(minmax(x),[i 3],{'tansig' 'logsig'},'trainlm');
		net=newff(minmax(x),[i 5],{'tansig' 'logsig'},'trainlm');

		net.trainParam.showWindow=0;
		net.trainParam.epochs=300;
		net.trainParam.goal=0.01;

		net=train(net,[x1t;x2t;x3t],[y1t;y2t;y3t]);
		y=sim(net,[x1v;x2v;x3v]);
	%end;
	EG(i) = sum(([y1v;y2v;y3v]-y).^2)/length(y);
end;
error=mean(EG)


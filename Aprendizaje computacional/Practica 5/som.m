function W=som(entradas,W,vecindad,T,a0)
	N=size(entradas, 2);
	M=size(W,2);
     figure,
	for t=1:T
		a=a0*(1-t/T);
		for i=1:N
            %size(entradas(:,i))
            %size(W')
			[~,g]=min(dist(W',entradas(:,i)));
			for j=1:M
				inc=a*(entradas(:,i)-W(:,g));
				W(:,j)=	W(:,j)+(inc*((1/2)^vecindad(j,g)));
			end
        end
		plot(entradas(1,:),entradas(2,:),'.');
		hold on;
		plotsom(W',vecindad);
        hold off;
		pause(0.1);
		%hold off;
        
    end	
    close
end

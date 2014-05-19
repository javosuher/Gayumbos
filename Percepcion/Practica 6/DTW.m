function value=DTW(p, t)
	DTW=zeros(size(p,2),size(t,2));
	for i=2:size(p,2)
		DTW(i,1)=inf;
	end
	for j=2:size(t,2)
		DTW(1,j)=inf;
	DTW(1,1)=0;
	end
	
	for i=2:size(p,2)
		for j=2:size(t,2)
			dist=abs(p(i)-t(j));
			DTW(i,j)=dist+min([DTW(i-1,j) DTW(i,j-1) DTW(i-1,j-1)]);
		end
	end
	value=DTW(size(p,2),size(t,2));
end

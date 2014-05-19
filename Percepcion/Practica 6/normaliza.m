function p=normaliza(coef)
	p=(coef-mean(coef))./std(coef);
end

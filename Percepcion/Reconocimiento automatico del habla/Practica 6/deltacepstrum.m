function [coeficientes_delta] = deltacepstrum(cepstrum)
	[n_filas, n_columnas] = size(cepstrum);
	p = 3;
	mascara(1:p) = 0;
	mascara(p+1:p+n_columnas) = 1;
	mascara(p+n_columnas+1:p+n_columnas+p) = 0;

	lceps = [zeros(n_filas, p) cepstrum zeros(n_filas, p)];

	vector_p = -p:p;
	matriz_p = repmat(vector_p, n_filas, 1);

	contador = 1;
	for i=p+1:n_columnas+p
		ind = vector_p + i
		num = sum(lceps(:, ind).*matriz_p, 2);
		den = sum((mascara(1, ind).*vector_p).^2, 2);
		C(:, contador) = num./den;
		contador = contador + 1;
	end

	coeficientes_delta = C;

end

%Hay que hacer luego la concatenación de lceps y coeficientes_delta

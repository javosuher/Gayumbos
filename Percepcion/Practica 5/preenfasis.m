function senal = preenfasis(senal, a)
    tf = fft(senal);
    senal = filter(1 - a, 1, abs(tf));
end


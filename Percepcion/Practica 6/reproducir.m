function [] = reproducir(senal)
	if isunix
        soundsc(senal,8000);
    else 
    	wavplay(senal, 8000);
    end
end


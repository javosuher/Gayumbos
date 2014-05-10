function [] = reproducir(senal)
	if exist('OCTAVE_VERSION') ~= 0
		playaudio(senal, 8000);
	else
    	wavplay(senal, 8000);
    end
end


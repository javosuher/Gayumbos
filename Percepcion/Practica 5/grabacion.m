function senal = grabacion (t, Fs, Ch)
	if exist('OCTAVE_VERSION') ~= 0
    	senal = recordo(t, Fs)
    else
    	senal = wavrecord(t, Fs, Ch)
    end
end


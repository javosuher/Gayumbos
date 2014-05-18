function senal = grabacion (t, Fs, Ch)
	if exist('OCTAVE_VERSION') ~= 0
    	senal = recordo(t, Fs)
    else if isunix
        reco=audiorecorder(Fs, 16, Ch);
        recordblocking(reco,t/Fs);
        senal=getaudiodata(reco);
        else
        senal = wavrecord(t, Fs, Ch)   
    end
end


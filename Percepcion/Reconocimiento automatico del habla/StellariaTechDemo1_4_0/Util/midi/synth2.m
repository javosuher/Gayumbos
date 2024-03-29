%%
%% MIDI Synthesizer
%%
%% (c) 2007 Kenneth Adams Jr.
%% Georgia Institute of Technology, Atlanta, GA
%%
%% For CS 1371, Prof. Stallworth, C.
%%
%% A fully functional MIDI synthesizer, supporting 128 instruments and one
%% drum track.  It also supports the volume and expression MIDI
%% controllers.  
%%
%% Instrument samples for this synthesizer were extracted with
%% another MATLAB script from the Roland SoundSet DLS file packaged with
%% most versions of Windows located in %SYSTEM32%\drivers\gm.dls
function synth(midiFile)
    clc

    freq =22050;
    sndDir = 'D:\MATLAB\R2008a\userTools\midi\midi\sound\';
    
    runVis = false;
    fftSize = floor(freq * .05);


    fprintf('+------------------------------+\n');
    fprintf('|                              |\n');
    fprintf('|       MIDI Synthesizer       |\n');
    fprintf('|     c2007 Kenneth Adams      |\n');
    fprintf('|                              |\n');
    fprintf('+------------------------------+\n\n');

    % Read wav table - preparsed from dlsparser.m
    sndTbl = dlmread('sound.tbl', '\t');
    instr(129).note(1).root = 0;
    
    for (i = [1 : length(sndTbl)])
        r = sndTbl(i, :);
        if (r(2) == 0)
            % Melodic Instrument
            instr(r(1) + 1).note(end + 1).root = r(3);
            instr(r(1) + 1).note(end).low = r(4);
            instr(r(1) + 1).note(end).hi = r(5);
            instr(r(1) + 1).note(end).idx = r(6);
            instr(r(1) + 1).note(end).loopStart = r(7);
            instr(r(1) + 1).note(end).loopLen = r(8);
            instr(r(1) + 1).note(end).data = [];
        elseif (r(1) == 0)
            % Drum Kit
            instr(129).note(end + 1).root = r(4);
            instr(129).note(end).low = -1;
            instr(129).note(end).hi = -1;
            instr(129).note(end).idx = r(6);
            instr(129).note(end).loopStart = r(7);
            instr(129).note(end).loopLen = r(8);
            instr(129).note(end).data = [];
        end
    end

    fprintf('** Loading MIDI file: %s\n', midiFile);
    fh = fopen(midiFile, 'r');

    %% Read in header data
    midiId = fread(fh, 8, 'uint8');
    if (midiId(1 : 5) ~= [77; 84; 104; 100; 6])
        error('Invalid file header.')
    end

    in = fread(fh, 3, 'uint16', 'ieee-be');

    midiType = in(1);
    midiTracks = in(2);
    midiTime = in(3);

    if (midiTime > 32767)
        error('Unsupported time division.');
    end

    tempo = 120;
    song = zeros(300 * freq, 1);

    % Process each track.
    for (track = [1 : midiTracks])
        trackId = fread(fh, 4, 'uint8');

        % Verify that the file points to a valid track.
        if (trackId ~= [77; 84; 114; 107])
            error('Invalid track header.')
        end

        trackLen = fread(fh, 1, 'uint32', 'ieee-be');
        trackData = fread(fh, trackLen, 'uint8');
        trackPtr = 1;
        lastMsgType = 0;

        % fprintf('[TRACK] i=%d len=%d\n', track, trackLen);

        trackNotes = [];
        trackTime = 0;

        trackExpr = ones(1, 16);
        trackVol = ones(1, 16);
        trackPan = ones(1, 16) .* .5;

        instrMap = ones(1, 16);

        loadTimer = [0 0 0 0 0 0];

        while (trackPtr < trackLen)            
            if (etime(clock(), loadTimer) > 1)
                loadTimer = clock();
                fprintf('** Loading track %2d/%2d : %4.1f%%\n', track, midiTracks, ...
                    100 * trackPtr / trackLen);
            end

            msgTime = readVarLen();
            msgType = readTrack(1);

            % msgType should ALWAYS have high bit set, if not, the msgType
            % comes from the last message.  A bunch of MIDI files use this
            % as a form of compression.
            if (msgType < 128)
                msgType = lastMsgType;

                % msgType is actually the byte ahead of the type, easiest
                % way to handle this is to back up the read ptr.
                trackPtr = trackPtr - 1;
            end

            %% MetaEvents have status byte 0xFF.
            if (msgType == 255)
                msgMeta = readTrack(1);
                msgLen = readVarLen();
                msgData = readTrack(msgLen);

                switch (msgMeta)
                    case {1, 2, 3, 4, 5}
                        % Text information
                        % fprintf('*** Info: %s\n', char(msgData));
                    case 47
                        % End of track
                        break
                    case 81
                        % Tempo set
                        tempo = round(60000000 /  (2 ^ 16 * msgData(1) + ...
                            2 ^ 8 * msgData(2) + msgData(3)));
                end

                % fprintf('[METAMSG] type=%d len=%d\n', msgMeta, msgLen);
            else
                lastMsgType = msgType;
                msgChannel = mod(msgType, 16) + 1;
                msgType = floor(msgType / 16);
                trackTime = trackTime + msgTime / midiTime;

                if (msgType == 12 || msgType == 13)
                    msgParams = readTrack(1);
                    % fprintf('[MSG] dt=%d type=%d chan=%d p0=%d\n', ...
                    % msgTime, msgType, msgChannel, msgParams(1));
                else
                    msgParams = readTrack(2);
                    % fprintf('[MSG] dt=%d type=%d chan=%d p0=%d p1=%d\n', ...
                    % msgTime, msgType, msgChannel, msgParams(1), msgParams(2));
                end

                if (msgType == 8 || (msgType == 9 && msgParams(2) == 0))
                    % End the note on the same channel and note number.
                    for (i = [1 : length(trackNotes)])
                        if (trackNotes(i).channel == msgChannel && ...
                                trackNotes(i).note == msgParams(1))

                            noteStart = trackNotes(i).time;
                            vol = trackVol(msgChannel) * ...
                                trackExpr(msgChannel) * ...
                                trackNotes(i).note;
%                             volLeft = vol * (1 - trackPan(msgChannel));
%                             volRight = vol * trackPan(msgChannel);

                            %% Add note to song data.
                            if (msgChannel == 10)
                                if (msgParams(1) < 82)
                                    id = 129;
                                    addSample(inf, msgParams(1));
                                end
                            else
                                id = instrMap(msgChannel);
                                addSample(trackTime, msgParams(1));
                            end

                            trackNotes(i) = [];
                            break
                        end
                    end
                elseif (msgType == 9)
                    % Begin a note
                    i = 1 + length(trackNotes);
                    trackNotes(i).channel = msgChannel;
                    trackNotes(i).note = msgParams(1);
                    trackNotes(i).time = trackTime;
                    trackNotes(i).vol = msgParams(2);
                elseif (msgType == 11)
                    % MIDI Controller
                    if (msgParams(1) == 7)
                        trackVol(msgChannel) = msgParams(2) / 127;
                        % fprintf('[VOL] chan=%d vol=%d\n', msgChannel, msgParams(2));
                    elseif (msgParams(1) == 10)
                        trackPan(msgChannel) = msgParams(2) / 127;
                    elseif (msgParams(1) == 11)
                        trackExpr(msgChannel) = msgParams(2) / 127;
                        % fprintf('[EXPR] \n');
                    
                    end
                elseif (msgType == 12)
                    % Change the instrument map.
                    instrMap(msgChannel) = msgParams(1) + 1;
%                     fprintf('[MAP] chan=%d instr=%d\n', msgChannel, msgParams(1) + 1);
                end
            end
        end
    end

    % Remove blanks at end of song and normalize to +/- 1.0
    song(find(song ~= 0, 1, 'last') + 1: end) = [];
    song = song / (max(song) .* 2);
    fclose(fh);

    % Play the song.
    % TODO: Cache file as .wav ?
    clear instr;
    songTime = floor(length(song) / freq);
    fprintf('** Playing: %d m %d s\n', floor(songTime / 60), mod(songTime, 60)); 
    wavplay(song, freq, 'async');
    
    % Because wavplay in sync mode maxes CPU!
    pause(songTime);
    
    if (runVis)
        fprintf('** Starting visualizer...\n');
        df = 1 / songTime;
        fftPos = 0;

        visTimer = timer( ...
            'TimerFcn', @visCallback, ...
            'Period', round(1000 * fftSize / freq) / 1000, ...
            'ExecutionMode', 'fixedRate');
        
        visCallbackLock = false;
        start(visTimer);
        pause(songTime + 2);
        stop(visTimer);
        close all;
    end
    
    %% Get a variable length value from the track
    function val = readVarLen()
        val = 0;
        loop = true;
        
        while (loop)      
            val = val * 128 + mod(trackData(trackPtr), 128);
            loop = (trackData(trackPtr) > 127);
            trackPtr = trackPtr + 1;
        end
    end
    
    %% Get x bytes from the track.
    function val = readTrack(x)
%         if (trackPtr + x - 1 > length(trackData))
%             error('Track data read error.');
%         end
        val = trackData(trackPtr : trackPtr + x - 1);
        trackPtr = trackPtr + x;
    end

    %% Insert a sample into the song.
    function addSample(noteEnd, note)
        z = [];
        
        for (j = [1 : length(instr(id).note)])
            k = instr(id).note(j);
            if (k.root == note)
                z = k;

                if (isempty(z.data))
                    z.data = wavread([sndDir num2str(z.idx + 1) '.wav']);
                    instr(id).note(j) = z;
                end

                break;
            end
        end
        
        if (isempty(z))
            for (j = [1 : length(instr(id).note)])
                k = instr(id).note(j);
                if (k.low <= note & note <= k.hi)
                    z = k;

                    shift = (2 ^ (1 / 12)) ^ (note - z.root);

                    if (isempty(z.data))
                        z.data = wavread([sndDir num2str(z.idx + 1) '.wav']);
                    end
 
                    n = length(z.data);

                    z.root = note;
                    z.data = z.data(round(linspace(1, n, n / shift)));
                    z.loopStart = floor(z.loopStart / shift);
                    z.loopLen = floor(z.loopLen / shift);
                    z.low = -1;
                    z.hi = -1;

                    instr(id).note(end + 1) = z;

                    break;
                end
            end
        end

        % Happens if the note data wasn't found, shouldn't happen.
        if (~isstruct(z))
            return
        end
                
        % Adjust midi ticks to index in sound array.
        j = floor(1 + noteStart * 60 * freq / tempo);
        k = floor(1 + noteEnd * 60 * freq / tempo);
        
        z.data
        z.loopStart
        z.loopLen
        z
       
        if (z.loopStart > 0 & z.loopLen > 0)
            loopSnd = [];
            loopEnd = z.loopStart + z.loopLen - 1;
            
            % Repeat the looping section
            % There is a 2 second hard limit, in case of a "stuck note."
            % These notes actually are not stuck, they probably just don't
            % have a decay applied to it yet.
            while (length(loopSnd) < (k - j) && length(loopSnd) < 2 * freq)
%                  loopSnd = [loopSnd; z.data(z.loopStart : loopEnd, :)]; 
                loopSnd = [loopSnd; z.data(z.loopStart : loopEnd)];  
 
            end
            
            snd = [z.data(1 : z.loopStart); loopSnd; z.data(loopEnd : end)];
            
            % Apply decay for sustain portion of note.
            if (any(id == [1 : 16, 113 : 119, 129]))
                n = length(snd(z.loopStart : end));
                snd(z.loopStart : end) = snd(z.loopStart : end) .* ...
                    linspace(1, 0, n)' .^ 2;
            end
                
        else
            snd = z.data;
        end
        
        n = length(snd);
        
        if (n + j > length(song))
            song(n + j + 30 * freq, 1) = 0;
        end            

        % Combine song and sample
        song(j : n + j - 1, 1) = song(j : n + j - 1, 1) + vol .* snd;
    end

    function visCallback(varargin)
        fftPos = fftPos + 1;
        if (visCallbackLock)
            return
        end
        
        visCallbackLock = true;
        fftStart = fftPos * fftSize + 1;
        fftEnd = fftStart + fftSize - 1;
        
        if (fftEnd > length(song))
            return
        end
        
        y = abs(fft(song(fftStart : fftEnd)))';

        subplot(2, 1, 1);
        plot((1 : fftSize) .* df, y, '.');
        %         axis off
        axis([0, df * fftSize * .5, 0, 100]);
        %
        subplot(2, 1, 2);
        plot(song(fftStart : fftEnd), 'r')
        %         hold on
        %             plot([0 fftSize], [0 0], 'm');
        %         axis off
        axis([0, fftSize, -.5, .5]);

        visCallbackLock = false;
    end
end

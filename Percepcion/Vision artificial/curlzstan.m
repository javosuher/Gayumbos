function varargout = curlzstan(varargin)
% CURLZSTAN MATLAB code for curlzstan.fig
%      CURLZSTAN, by itself, creates a new CURLZSTAN or raises the existing
%      singleton*.
%
%      H = CURLZSTAN returns the handle to a new CURLZSTAN or the handle to
%      the existing singleton*.
%
%      CURLZSTAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CURLZSTAN.M with the given input arguments.
%
%      CURLZSTAN('Property','Value',...) creates a new CURLZSTAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before curlzstan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to curlzstan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help curlzstan

% Last Modified by GUIDE v2.5 30-Jun-2014 01:27:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @curlzstan_OpeningFcn, ...
                   'gui_OutputFcn',  @curlzstan_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before curlzstan is made visible.
function curlzstan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to curlzstan (see VARARGIN)

% Choose default command line output for curlzstan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes curlzstan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = curlzstan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%% DECLARACIONES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('shuffle');
load parametros.mat; load 'dias.mat'; load 'patrones.mat'; load 'imagenes.mat'; %cara(), poster(), sello(), booth, gameover, curlz, secuencia
handles.patron=patron;
handles.patron2=patron2;
handles.tiempo=tiempo;
handles.dias=dias;
handles.ndia=0;
handles.secuencia=secuencia;
handles.booth=booth;
handles.cara=cara;
handles.poster=poster;
handles.reloj=reloj;
handles.sello=sello;
handles.gameover=gameover;
handles.curlz=curlz;
handles.fecha=0;
handles.juego=booth;
liberados=0; pillado=false;

%%%%%%%%%%%%%%%%%%%%% MAIN LOOP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.text, 'Visible', 'off')
set(handles.text1, 'Visible', 'off')
secuencia_inicio(handles);
while ~pillado
    iniciar_juego(handles);
    handles=guidata(handles.output);
    set(handles.text,'String',handles.ndia);
    set(handles.text1, 'String', 'Pasaporte.')
    set(handles.text, 'Visible', 'on')
    %text(20,700,int2str(handles.ndia),'FontSize',200)
    pause(3);
    set(handles.text1, 'Visible', 'on')
    espera(handles);
    handles=guidata(handles.output);
    set(handles.text1, 'Visible', 'off')
    pillado=pasaporte(handles);
    if ~pillado
        set(handles.text1, 'String', 'Pasaporte.')
        pause(3);
        set(handles.text1, 'Visible', 'on')
        espera(handles);
        handles=guidata(handles.output);
        set(handles.text1, 'Visible', 'off')
        pillado=permiso(handles);
    end
    if ~pillado
        liberados=liberados +1;
        secuencia_juego(handles);
    end    
end
pause(2);
secuencia_final(handles);
set(handles.text, 'Visible', 'off')
set(handles.text1, 'String', 'Dioses! Que es eso?! Falsificaciones!! ')
set(handles.text1, 'Visible', 'on')
pause(4); 
set(handles.text1, 'String', ['Total rescatados: ' num2str(liberados)])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=secuencia_inicio(handles);
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(handles.secuencia);
    set(background, 'handlevisibility', 'off', 'visible', 'off');

function []=iniciar_juego(handles,hObject); 
    %fecha
    handles.ndia=handles.dias(randi(length(handles.dias)));
    handles.nsello=randi(numel(handles.sello));
    handles.ncara=randi(numel(handles.cara));
    
    dibuja(handles,handles.sello{handles.nsello},310,850);
    handles=guidata(handles.output);
    dibuja(handles,handles.poster{randi(numel(handles.poster))},248,30);
    handles=guidata(handles.output);
    dibuja(handles,colorea(handles.cara{handles.ncara}),67,94);
    handles=guidata(handles.output);
    dibuja(handles,handles.reloj{1},9,481);
    handles=guidata(handles.output);
    pause();
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(handles.juego); 
    set(background, 'handlevisibility', 'off', 'visible', 'off');
    guidata(handles.output, handles);

function []=espera(handles);
    for i=1:length(handles.reloj)
        dibuja(handles,handles.reloj{i},9,481);
        handles=guidata(handles.output);
        background = axes('unit', 'normalized', 'position', [0 0 1 1]);
        imagesc(handles.juego); 
        set(background, 'handlevisibility', 'off', 'visible', 'off');
        %text(20,700,int2str(handles.ndia),'FontSize',200);
        pause(handles.tiempo/5);
    end
    guidata(handles.output, handles);

function [pillado]=pasaporte(handles);
    captura=record();
    com=compacidad(captura);
    col=color(captura);
    captura2 = imresize(captura, size(handles.cara{1}));
    dibuja(handles,captura2,67,94);
    handles=guidata(handles.output);
    
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(handles.juego); 
    set(background, 'handlevisibility', 'off', 'visible', 'off');
    
    a=find(handles.patron(1,:)==col);
    [c,b]=min(abs(handles.patron(2,a)-com));
    
    if(c>1.5 || a(b)~= handles.ncara)
        pillado=true;
    end
    
function [pillado]=permiso(handles);
    captura=record();
    com=compacidad(captura);
    col=color(captura);
    captura2 = imresize(captura2, size(handles.cara{1}));
    dibuja(handles,captura,67,94);
    handles=guidata(handles.output);
    
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(handles.juego); 
    set(background, 'handlevisibility', 'off', 'visible', 'off');
    
    a=find(handles.patron(1,:)==col);
    [c,b]=min(abs(handles.patron(2,a)-com));
    
    if(c>1.5 || handles.patron2(a(b),:) ~= [handles.nsello; handles.ndia])
        pillado=true;
    end

function []=secuencia_juego(handles);
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(handles.secuencia);
    set(background, 'handlevisibility', 'off', 'visible', 'off');

function []=secuencia_final(handles);
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(handles.gameover);
    set(background, 'handlevisibility', 'off', 'visible', 'off');

function [] = dibuja(handles,a, x, y)
    handles.juego(x:x+size(a,1)-1,y:y+size(a,2)-1,:)=a;
    guidata(handles.output, handles);

function [final] = colorea(mask);
    ra=[(rand()*0.5)+0.5; (rand()*0.5)+0.5; (rand()*0.5)+0.5];
    rb = ra;
    rb(find(ra>=max(ra)))=ra(find(ra>=max(ra)))*0.75;
    rb(find(ra<=min(ra)))=ra(find(ra<=min(ra)))*1.25;
    for i=1:3
        final(:,:,i)=mask.*rb(i);
    end
    l=find(mask==255);
    final(l)=255*ra(1);
    final(l+(144*176))=255*ra(2);
    final(l+(144*176)*2)=255*ra(3);

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

% Last Modified by GUIDE v2.5 29-Jun-2014 21:16:15

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
load parametros.mat; load dias.mat; load('imagenes.mat'); %cara(), poster(), sello(), booth, gameover, curlz, secuencia
handles.dias=dias;
handles.secuencia=secuencia;
handles.booth=booth;
handles.cara=cara;
handles.poster=poster;
handles.sello=sello;
handles.gameover=gameover;
handles.curlz=curlz;
handles.fecha=0;
handles.juego=booth;
liberados=0; pillado=false;

%%%%%%%%%%%%%%%%%%%%% MAIN LOOP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
secuencia_inicio(handles);
while ~pillado
    handles.fecha=iniciar_juego(handles);
    set(handles.text0,'String',handles.fecha);
    espera(handles);
    pillado=pasaporte(handles);
    if ~pillado
        espera(handles);
        pillado=permiso(handles);
    end
    if ~pillado
        liberados=liberados +1;
        secuencia_juego(handles);
    end    
end
secuencia_final();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function []=secuencia_inicio(handles);
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(handles.secuencia);
    set(background, 'handlevisibility', 'off', 'visible', 'off');

function [fecha, sello, cara]=iniciar_juego(handles); 
    %fecha
    fecha=handles.dias(randi(length(handles.dias)));
    sello=randi(numel(handles.sello));
    cara=randi(numel(handles.cara));
    
    juego=dibuja(handles.sello{sello},handles.juego,310,850);
    juego=dibuja(colorea(handles.cara{cara}),juego,67,94);
    juego=dibuja(handles.poster{randi(numel(handles.poster))},juego,248,30);
    
    background = axes('unit', 'normalized', 'position', [0 0 1 1]);
    imagesc(juego); 
    set(background, 'handlevisibility', 'off', 'visible', 'off');   

function []=espera(handles);

function [pillado]=pasaporte(handles);

function [pillado]=permiso(handles);

function []=secuencia_juego(handles);

function []=secuencia_final(handles);

function [base] = dibuja(a, base, x, y)
    base(x:x+size(a,1)-1,y:y+size(a,2)-1,:)=a;

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

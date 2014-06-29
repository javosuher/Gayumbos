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

% Last Modified by GUIDE v2.5 29-Jun-2014 17:14:54

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

%%%%%%%%%%%%%%%%%%%%% MAIN LOOP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load parametros.mat; load dias.mat; load('imagenes.mat'); %cara(), poster(), sellos(), booth, gameover, curlz
liberados=0; pillado=false;
background = axes('unit', 'normalized', 'position', [0 0 1 1]);
secuencia_inicio(background);
while ~pillado
    iniciar_juego(background);
    espera(background);
    pillado=pasaporte(background);
    if ~pillado
        espera(background);
        pillado=permiso(background);
    end
    if ~pillado
        liberados=liberados +1;
        secuencia_juego(background);
    end    
end
secuencia_final();

function []=secuencia_inicio(background);
    

function []=iniciar_juego(background);

function []=espera(background);

function [pillado]=pasaporte(background);

function [pillado]=permiso(background);

function []=secuencia_juego(background);

function []=secuencia_final(background);


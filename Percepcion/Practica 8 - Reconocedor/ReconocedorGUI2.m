function varargout = ReconocedorGUI2(varargin)
% RECONOCEDORGUI2 MATLAB code for ReconocedorGUI2.fig
%      RECONOCEDORGUI2, by itself, creates a new RECONOCEDORGUI2 or raises the existing
%      singleton*.
%
%      H = RECONOCEDORGUI2 returns the handle to a new RECONOCEDORGUI2 or the handle to
%      the existing singleton*.
%
%      RECONOCEDORGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONOCEDORGUI2.M with the given input arguments.
%
%      RECONOCEDORGUI2('Property','Value',...) creates a new RECONOCEDORGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReconocedorGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReconocedorGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReconocedorGUI2

% Last Modified by GUIDE v2.5 19-May-2014 01:00:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReconocedorGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @ReconocedorGUI2_OutputFcn, ...
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


% --- Executes just before ReconocedorGUI2 is made visible.
function ReconocedorGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReconocedorGUI2 (see VARARGIN)

% Choose default command line output for ReconocedorGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ReconocedorGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ReconocedorGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
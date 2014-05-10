function varargout = Sumador(varargin)
% SUMADOR MATLAB code for Sumador.fig
%      SUMADOR, by itself, creates a new SUMADOR or raises the existing
%      singleton*.
%
%      H = SUMADOR returns the handle to a new SUMADOR or the handle to
%      the existing singleton*.
%
%      SUMADOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUMADOR.M with the given input arguments.
%
%      SUMADOR('Property','Value',...) creates a new SUMADOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sumador_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sumador_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sumador

% Last Modified by GUIDE v2.5 10-May-2014 19:32:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sumador_OpeningFcn, ...
                   'gui_OutputFcn',  @Sumador_OutputFcn, ...
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


% --- Executes just before Sumador is made visible.
function Sumador_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sumador (see VARARGIN)

%Colocar Imagen de fondo
%background = imread('glidder.png'); %Leer imagen
%axes(handles.background);  %Carga la imagen en background
%axis off;
%imshow(background);  %Presenta la imagen 
% Choose default command line output for Sumadora
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% Choose default command line output for Sumador

% UIWAIT makes Sumador wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sumador_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

NewStrVal=get(hObject,'String'); %Almacenar valor ingresado
NewVal = str2double(NewStrVal);  %Transformar a formato double
handles.edit1=NewVal;  %Almacenar en puntero
guidata(hObject,handles);  %Salvar datos de la aplicación


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

NewStrVal=get(hObject,'String'); %Almacenar valor ingresado
NewVal = str2double(NewStrVal);  %Transformar a formato double
handles.edit2=NewVal;  %Almacenar en puntero
guidata(hObject,handles);  %Salvar datos de la aplicación


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A = handles.edit1;
B = handles.edit2;
ANSWER = A + B;
set(handles.text2, 'String', ANSWER);

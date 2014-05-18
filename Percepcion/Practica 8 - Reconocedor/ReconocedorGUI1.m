function varargout = ReconocedorGUI1(varargin)
% RECONOCEDORGUI1 MATLAB code for ReconocedorGUI1.fig
%      RECONOCEDORGUI1, by itself, creates a new RECONOCEDORGUI1 or raises the existing
%      singleton*.
%
%      H = RECONOCEDORGUI1 returns the handle to a new RECONOCEDORGUI1 or the handle to
%      the existing singleton*.
%
%      RECONOCEDORGUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONOCEDORGUI1.M with the given input arguments.
%
%      RECONOCEDORGUI1('Property','Value',...) creates a new RECONOCEDORGUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReconocedorGUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReconocedorGUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReconocedorGUI1

% Last Modified by GUIDE v2.5 18-May-2014 13:04:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReconocedorGUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @ReconocedorGUI1_OutputFcn, ...
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


% --- Executes just before ReconocedorGUI1 is made visible.
function ReconocedorGUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReconocedorGUI1 (see VARARGIN)

% Choose default command line output for ReconocedorGUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ReconocedorGUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clc




% --- Outputs from this function are returned to the command line.
function varargout = ReconocedorGUI1_OutputFcn(hObject, eventdata, handles) 
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

NewStrVal = get(hObject, 'String'); %Almacenar valor ingresado
NewVal = str2double(NewStrVal); %Transformar a formato double
handles.edit1 = NewVal; %Almacenar en puntero
guidata(hObject,handles); %Salvar datos de la aplicación


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

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.edit2 = NewVal;
guidata(hObject,handles);


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

t = handles.edit1;
Fs = handles.edit2;
senal = grabacion(t * Fs, Fs, 1);
handles.senal = senal;
guidata(hObject, handles);
plot(senal)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

reproducir(handles.senal);

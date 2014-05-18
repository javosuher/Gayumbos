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

% Last Modified by GUIDE v2.5 18-May-2014 23:15:02

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
axes(handles.axes2);
[x,map] = imread('glidder.png','png');
image(x), colormap(map), axis off, hold on

x=0:pi./525:3.*2.*pi;
handles.Hamming = sin(x);
handles.Hanning = cos(x);
handles.Rectwin = tan(x);
handles.ventana = handles.Hamming;
axes(handles.axes1);
plot(x, handles.ventana);
guidata(hObject,handles);





% --- Outputs from this function are returned to the command line.
function varargout = ReconocedorGUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double

NewStrVal = get(hObject, 'String'); %Almacenar valor ingresado
NewVal = str2double(NewStrVal); %Transformar a formato double
handles.t = NewVal; %Almacenar en puntero
guidata(hObject,handles); %Salvar datos de la aplicación


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fs_Callback(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs as text
%        str2double(get(hObject,'String')) returns contents of Fs as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.Fs = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function n_muestras_Callback(hObject, eventdata, handles)
% hObject    handle to n_muestras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_muestras as text
%        str2double(get(hObject,'String')) returns contents of n_muestras as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.n_muestras = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function n_muestras_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_muestras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.a = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function despl_Callback(hObject, eventdata, handles)
% hObject    handle to despl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of despl as text
%        str2double(get(hObject,'String')) returns contents of despl as a double

NewStrVal = get(hObject,'String');
NewVal = str2double(NewStrVal);
handles.despl = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function despl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to despl (see GCBO)
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

t = handles.t;
Fs = handles.Fs;
senal = grabacion(t * Fs, Fs, 1);
handles.senal = senal;
guidata(hObject, handles);
axes(handles.axes1);
plot(senal)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

reproducir(handles.senal);


% --- Executes on selection change in ventana.
function ventana_Callback(hObject, eventdata, handles)
% hObject    handle to ventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ventana contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ventana

x=0:pi./525:3.*2.*pi;
val=get(hObject,'Value');
str=get(hObject,'String');
axes(handles.axes1);
switch str{val}
    case 'Hanning'
        handles.ventana=handles.Hanning;
        plot(x, handles.ventana);
    case 'Hamming'
        handles.ventana=handles.Hamming;
        plot(x, handles.ventana);
    case 'Rectwin'
        handles.ventana=handles.Rectwin;
        plot(x, handles.ventana);
end


% --- Executes during object creation, after setting all properties.
function ventana_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: ventana controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

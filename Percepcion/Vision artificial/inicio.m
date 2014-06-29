function varargout = inicio(varargin)
% INICIO MATLAB code for inicio.fig
%      INICIO, by itself, creates a new INICIO or raises the existing
%      singleton*.
%
%      H = INICIO returns the handle to a new INICIO or the handle to
%      the existing singleton*.
%
%      INICIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INICIO.M with the given input arguments.
%
%      INICIO('Property','Value',...) creates a new INICIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before inicio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to inicio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help inicio

% Last Modified by GUIDE v2.5 28-Jun-2014 12:23:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @inicio_OpeningFcn, ...
                   'gui_OutputFcn',  @inicio_OutputFcn, ...
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


% --- Executes just before inicio is made visible.
function inicio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to inicio (see VARARGIN)

% Choose default command line output for inicio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes inicio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = inicio_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Iniciamos camara
vid = videoinput('winvideo', 1, 'YUY2_176x144');
vid.FramesPerTrigger = 1;
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'manual');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.preview);
preview(vid, hImage);
handles.vid = vid;

% Cargamos imagenes
axes(handles.visual);
if(exist('imagenes', 'dir') ~= 0)
    files = dir(fullfile(pwd, 'imagenes', '*.png'));
    for x = 1 : length(files)
        handles.images{x} = imread(fullfile(pwd,'imagenes',files(x).name));
    end
    set(handles.listboxImages, 'string', {files.name});
    index = get(handles.listboxImages, 'value');
    imshow(handles.images{index});   
end

% Cargamos Caras
axes(handles.photosPersonajes);
files = dir(fullfile(pwd, 'caras', '*.png'));
for x = 1 : length(files)
    handles.imagesPhotos{x} = imread(fullfile(pwd,'caras',files(x).name));
end
set(handles.listboxPhotos, 'string', {files.name});
index = get(handles.listboxPhotos, 'value');
imshow(handles.imagesPhotos{index}); 

% Inicialización de parámetros
handles.editBrillo = 0;
handles.contraste = 0;

% Cargamos los nombres
if exist('nombres.mat')
    load('nombres.mat');
    handles.names = nombres;
    set(handles.listboxNames, 'string', {handles.names});
else
    handles.names = 'empty';
end

% Cargamos los días
if exist('dias.mat')
    load('dias.mat');
    handles.days = dias;
    set(handles.listboxDays, 'string', {handles.days});
else
    handles.days = NaN;
end

guidata(hObject,handles);



% --- Executes on button press in pushPreview.
function pushPreview_Callback(hObject, eventdata, handles)
% hObject    handle to pushPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.visual);
image = getsnapshot(handles.vid);

% Añadimos los ajustes
image = imadd(image, handles.editBrillo);
if handles.contraste == 1
    image = histeq(rgb2gray(image));
end

if(exist('imagenes', 'dir') == 0)
    mkdir('imagenes')
end
files = dir(fullfile(pwd, 'imagenes', '*.png'));
cd imagenes;
horas = clock;
nombre = [date '-' int2str(horas(4)) '-' int2str(horas(5)) '-' int2str(horas(6))];
imwrite(image, [nombre '.png']', 'png');
% imwrite(image, ['imagen' int2str(length(files)+1) '.png']', 'png');
cd ..
files = dir(fullfile(pwd, 'imagenes', '*.png'));
for x = 1 : length(files)
    handles.images{x} = imread(fullfile(pwd,'imagenes',files(x).name));
end
set(handles.listboxImages, 'string', {files.name});
guidata(hObject,handles); 

% --- Executes on button press in pushDelete.
function pushDelete_Callback(hObject, eventdata, handles)
% hObject    handle to pushDelete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(exist('imagenes', 'dir') ~= 0)
    index = get(handles.listboxImages, 'value');
    contents = get(handles.listboxImages, 'string');
    files = dir(fullfile(pwd, 'imagenes', '*.png'));
    cd imagenes
    delete(files(index).name);
    cd ..
    contents(index) = [];
    value = index - 1;
    if value < 1 
        value = 1;
    end
    set(handles.listboxImages, 'String', contents, 'Value', value);
    
    % Actualizar
    files = dir(fullfile(pwd, 'imagenes', '*.png'));
    for x = 1 : length(files)
        handles.images{x} = imread(fullfile(pwd,'imagenes',files(x).name));
    end
    set(handles.listboxImages, 'string', {files.name});

    guidata(hObject, handles);
end

% --- Executes on button press in pushPatterns.
function pushPatterns_Callback(hObject, eventdata, handles)
% hObject    handle to pushPatterns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on selection change in listboxImages.
function listboxImages_Callback(hObject, eventdata, handles)
% hObject    handle to listboxImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxImages contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxImages

axes(handles.visual);
index = get(handles.listboxImages, 'value');
imshow(handles.images{index});
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function listboxImages_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listboxPhotos.
function listboxPhotos_Callback(hObject, eventdata, handles)
% hObject    handle to listboxPhotos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxPhotos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxPhotos

axes(handles.photosPersonajes);
index = get(handles.listboxPhotos, 'value');
imshow(handles.imagesPhotos{index});
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function listboxPhotos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxPhotos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBrillo_Callback(hObject, eventdata, handles)
% hObject    handle to editBrillo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBrillo as text
%        str2double(get(hObject,'String')) returns contents of editBrillo as a double

NewStrVal = get(hObject, 'String');
NewVal = str2double(NewStrVal);
handles.editBrillo = NewVal;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function editBrillo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBrillo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popContraste.
function popContraste_Callback(hObject, eventdata, handles)
% hObject    handle to popContraste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popContraste contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popContraste

val = get(hObject, 'Value');
str = get(hObject, 'String');
switch str{val}
    case 'No'
        handles.contraste = 0;
    case 'Si'
        handles.contraste = 1;
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function popContraste_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popContraste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushSave.
function pushSave_Callback(hObject, eventdata, handles)
% hObject    handle to pushSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

brillo = handles.editBrillo;
contraste = handles.contraste;
save('parametros.mat', 'brillo', 'contraste');


% --- Executes on selection change in listboxNames.
function listboxNames_Callback(hObject, eventdata, handles)
% hObject    handle to listboxNames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxNames contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxNames


% --- Executes during object creation, after setting all properties.
function listboxNames_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxNames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNames_Callback(hObject, eventdata, handles)
% hObject    handle to editNames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNames as text
%        str2double(get(hObject,'String')) returns contents of editNames as a double

NewStrVal = get(hObject, 'String');
if strcmp(handles.names, 'empty')
    handles.names = NewStrVal;
else
    handles.names = strvcat(handles.names, NewStrVal);
end
set(handles.listboxNames, 'string', {handles.names});
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function editNames_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushDeleteNombres.
function pushDeleteNombres_Callback(hObject, eventdata, handles)
% hObject    handle to pushDeleteNombres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if strcmp(handles.names, 'empty') == 0
    index = get(handles.listboxNames, 'value');
    contents = get(handles.listboxNames, 'string');
    handles.names(index, :) = [];
    contents(index) = [];
    value = index - 1;
    if value < 1 
        value = 1;
    end
    set(handles.listboxNames, 'String', contents, 'Value', value);
    guidata(hObject, handles);
end


% --- Executes on button press in pushSavesNames.
function pushSavesNames_Callback(hObject, eventdata, handles)
% hObject    handle to pushSavesNames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

nombres = handles.names;
save('nombres.mat', 'nombres');


% --- Executes on selection change in listboxDays.
function listboxDays_Callback(hObject, eventdata, handles)
% hObject    handle to listboxDays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxDays contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxDays


% --- Executes during object creation, after setting all properties.
function listboxDays_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxDays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDays_Callback(hObject, eventdata, handles)
% hObject    handle to editDays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDays as text
%        str2double(get(hObject,'String')) returns contents of editDays as a double

NewStrVal = get(hObject, 'String');
NewVal = str2double(NewStrVal);
if isnan(handles.days) == 1
    handles.days = NewVal;
else
    handles.days = [handles.days; NewVal];
end
set(handles.listboxDays, 'string', {handles.days});
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function editDays_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushDeleteDays.
function pushDeleteDays_Callback(hObject, eventdata, handles)
% hObject    handle to pushDeleteDays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isnan(handles.days) ~= 1
    index = get(handles.listboxDays, 'value');
    contents = get(handles.listboxDays, 'string');
    handles.days(index, :) = [];
    contents(index) = [];
    value = index - 1;
    if value < 1 
        value = 1;
    end
    set(handles.listboxDays, 'String', contents, 'Value', value);
    guidata(hObject, handles);
end

% --- Executes on button press in pushSaveDays.
function pushSaveDays_Callback(hObject, eventdata, handles)
% hObject    handle to pushSaveDays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dias = handles.days;
save('dias.mat', 'dias');

function varargout = deteccion_bordes(varargin)
% DETECCION_BORDES MATLAB code for deteccion_bordes.fig
%      DETECCION_BORDES, by itself, creates a new DETECCION_BORDES or raises the existing
%      singleton*.
%
%      H = DETECCION_BORDES returns the handle to a new DETECCION_BORDES or the handle to
%      the existing singleton*.
%
%      DETECCION_BORDES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECCION_BORDES.M with the given input arguments.
%
%      DETECCION_BORDES('Property','Value',...) creates a new DETECCION_BORDES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before deteccion_bordes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to deteccion_bordes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help deteccion_bordes

% Last Modified by GUIDE v2.5 16-May-2019 13:02:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
 
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deteccion_bordes_OpeningFcn, ...
                   'gui_OutputFcn',  @deteccion_bordes_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
    
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    

else
    gui_mainfcn(gui_State, varargin{:});
   %movegui(deteccion_bordes,'center');
end
% End initialization code - DO NOT EDIT


% --- Executes just before deteccion_bordes is made visible.
function deteccion_bordes_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to deteccion_bordes (see VARARGIN)

% Choose default command line output for deteccion_bordes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes deteccion_bordes wait for user response (see UIRESUME)
% uiwait(handles.figBordes);


% --- Outputs from this function are returned to the command line.
function varargout = deteccion_bordes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnPasaAltas.
function btnPasaAltas_Callback(hObject, eventdata, handles)
A=imread('Lennsa.png');
axes(handles.axOriginal);
imshow(A); 
axes(handles.axGrises);
imageA=rgb2gray(A);
imshow(imageA); 

fftA = fft2(double(imageA));

A_fft_mag=abs(fftA);
A_fft_fase=angle(fftA);

magA = 100*log(1+abs(fftshift(fftA)));
phaseA = angle(fftshift(fftA));

[r,c] = size(fftA);
EE = zeros(r,c);

a = r/10;
b = c/10;

for m=round(((r-1)/2)-a):round(((r-1)/2)+(a+1))
    for n=round(((c-1)/2)-b):round(((c-1)/2)+(b+1))
        EE(m,n)=1;
    end
end

mask_lowpass = EE;

mask_highpass = 1 - EE;

EEe = EE;
aa = r/3;
bb = c/3;
for mm=round(((r-1)/2)-aa):round(((r-1)/2)+(aa+1))
    for nn=round(((c-1)/2)-bb):round(((c-1)/2)+(bb+1))
        EEe(mm,nn)=1;
    end
end

for mm=round(((r-1)/2)-a):round(((r-1)/2)+(a+1))
    for nn=round(((c-1)/2)-b):round(((c-1)/2)+(b+1))
        EEe(mm,nn)=0;
    end
end
% Filtro pasa bandas
mask_Bandas = EEe;
% Filtro supresor de bandas
mask_SBandas = 1 - EEe;
popup_sel_index2 = get(handles.ppFiltro, 'Value');
switch popup_sel_index2
    case 2
        Filtro = mask_highpass;

    case 3
        Filtro = mask_lowpass;
    case 4
        Filtro = mask_Bandas;
    case 5
        Filtro = mask_SBandas;
end

magA_filtro = magA.*(Filtro);
phaseA_filtro = phaseA.*(Filtro);
axes(handles.axMagnitud);
imagesc(magA_filtro), colormap gray;
axes(handles.axFase);
imagesc(phaseA_filtro), colormap gray;


ifftAmag = ifftshift(magA_filtro);
ifftAang = ifftshift(phaseA_filtro);

fftC = ifftAmag.*exp(i*ifftAang);

imageC = ifft2(fftC);

cmin = min(min(abs(imageC)));
cmax = max(max(abs(imageC)));
axes(handles.axFiltro);
imagesc(abs(imageC), [cmin cmax])
% --- Executes during object creation, after setting all properties.
function figBordes_CreateFcn(hObject, eventdata, handles)


% --- Executes on button press in btnCargarImagen.
function btnCargarImagen_Callback(hObject, eventdata, handles)


% --- Executes on selection change in ppFiltro.
function ppFiltro_Callback(hObject, eventdata, handles)
% hObject    handle to ppFiltro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ppFiltro contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ppFiltro


% --- Executes during object creation, after setting all properties.
function ppFiltro_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppFiltro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnRegresar.
function btnRegresar_Callback(hObject, eventdata, handles)
close(deteccion_bordes)
EjemplosFourier

% --- Executes on button press in btnCargar.
function btnCargar_Callback(hObject, eventdata, handles)

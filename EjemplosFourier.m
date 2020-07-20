function varargout = EjemplosFourier(varargin)
% EJEMPLOSFOURIER MATLAB code for EjemplosFourier.fig
%      EJEMPLOSFOURIER, by itself, creates a new EJEMPLOSFOURIER or raises the existing
%      singleton*.
%
%      H = EJEMPLOSFOURIER returns the handle to a new EJEMPLOSFOURIER or the handle to
%      the existing singleton*.
%
%      EJEMPLOSFOURIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EJEMPLOSFOURIER.M with the given input arguments.
%
%      EJEMPLOSFOURIER('Property','Value',...) creates a new EJEMPLOSFOURIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EjemplosFourier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EjemplosFourier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EjemplosFourier

% Last Modified by GUIDE v2.5 10-Jun-2019 17:14:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EjemplosFourier_OpeningFcn, ...
                   'gui_OutputFcn',  @EjemplosFourier_OutputFcn, ...
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


% --- Executes just before EjemplosFourier is made visible.
function EjemplosFourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EjemplosFourier (see VARARGIN)

% Choose default command line output for EjemplosFourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EjemplosFourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EjemplosFourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnFiltroImagen.
function btnFiltroImagen_Callback(hObject, eventdata, handles)
close(EjemplosFourier)
deteccion_bordes
% hObject    handle to btnFiltroImagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnFiltroAudio.
function btnFiltroAudio_Callback(hObject, eventdata, handles)
% hObject    handle to btnFiltroAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btmArmonico.
function btmArmonico_Callback(hObject, eventdata, handles)

t=-1:0.01:1;
mul=4/pi;
w0=pi;
figure();

n=1;
primer_armonico=(1/n)*sin(n*w0*t);

plot(t,primer_armonico,'r','LineWidth',2);
title("Armonicos")
hold on;

n=2;
segundo_armonico=(1/n)*sin(n*w0*t);
hold on;
plot(t,segundo_armonico,'g','LineWidth',2);

n=3;
tercer_armonico=(1/n)*sin(n*w0*t);
hold on;
a3 = plot(t,tercer_armonico,'g','LineWidth',2);

n=5;
quinto_armonico=(1/n)*sin(n*w0*t);
plot(t,quinto_armonico,'c','LineWidth',2);
hold on;
f_t=mul*(segundo_armonico + primer_armonico + tercer_armonico + quinto_armonico);

 
plot(t, f_t,'b','LineWidth',2);
legend("Primer Armonico", "Segundo Armonico", "Tercer Armonico", "Quinto Armonico", "Suma de los Armonicos")
grid on;


% --- Executes on button press in btnRegresar.
function btnRegresar_Callback(hObject, eventdata, handles)
close(EjemplosFourier)
list


% --- Executes on button press in btnEspectro.
function btnEspectro_Callback(hObject, eventdata, handles)
p=1;
lim_sup_w=70;
lim_inf_w=-70;
 figure;
for T=2:20:500
    w0=2*pi/T;
    n_inf=lim_inf_w/w0;
    n_sup=lim_sup_w/w0;
    n=n_inf:n_sup;
    w=n*w0;
    cte=p/T;
    num=sin(n*w0*(p/2));
    den=n*w0*(p/2);
    Cn=(cte)*(num./den);
    h = stem(w,Cn);
    %set(h(1),'MarkerFaceColor','blue');
    grid on;
    title('Espectro de Frecuencia Discreta');
    xlabel('w=n*w0');
    ylabel('Cn');
    pause(0.5);
    %drawnow;
end



% --- Executes on button press in btnEspectroAmplitud.
function btnEspectroAmplitud_Callback(hObject, eventdata, handles)
n=-30:1:30;
prim=(1./(abs(n)*pi));
second=(1-(-1).^n);
Cn=prim.*second;
figure;
h = stem(n,Cn);
set(h(1),'MarkerFaceColor','blue');
grid on;
title('Espectro de Frecuencia Discreta');
xlabel('n');
ylabel('|Cn|');


% --- Executes during object creation, after setting all properties.
function btnFiltroAudio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnFiltroAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

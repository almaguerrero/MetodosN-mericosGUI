function varargout = list(varargin)
% LIST MATLAB code for list.fig
%      LIST, by itself, creates a new LIST or raises the existing
%      singleton*.
%
%      H = LIST returns the handle to a new LIST or the handle to
%      the existing singleton*.
%
%      LIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIST.M with the given input arguments.
%
%      LIST('Property','Value',...) creates a new LIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before list_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to list_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help list

% Last Modified by GUIDE v2.5 16-May-2019 12:26:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @list_OpeningFcn, ...
                   'gui_OutputFcn',  @list_OutputFcn, ...
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


% --- Executes just before list is made visible.
function list_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to list (see VARARGIN)

% Choose default command line output for list
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes list wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = list_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnFourier.
function btnFourier_Callback(hObject, eventdata, handles)
close(list);
EjemplosFourier


% --- Executes on button press in btnRegresion.
function btnRegresion_Callback(hObject, eventdata, handles)
close(list);
untitled


% --- Executes on button press in btnRaices.
function btnRaices_Callback(hObject, eventdata, handles)
close(list)
GUI_Newton_Raphson


% --- Executes on button press in btnInterpolacion.
function btnInterpolacion_Callback(hObject, eventdata, handles)
close(list)
Interpolaciones

% --- Executes on button press in btnSegmentaria.
function btnSegmentaria_Callback(hObject, eventdata, handles)
% hObject    handle to btnSegmentaria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnRegresar.
function btnRegresar_Callback(hObject, eventdata, handles)
close(list);
main;

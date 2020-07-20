function varargout = Regresiones(varargin)
% REGRESIONES MATLAB code for Regresiones.fig
%      REGRESIONES, by itself, creates a new REGRESIONES or raises the existing
%      singleton*.
%
%      H = REGRESIONES returns the handle to a new REGRESIONES or the handle to
%      the existing singleton*.
%
%      REGRESIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGRESIONES.M with the given input arguments.
%
%      REGRESIONES('Property','Value',...) creates a new REGRESIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Regresiones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Regresiones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Regresiones

% Last Modified by GUIDE v2.5 16-May-2019 10:48:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Regresiones_OpeningFcn, ...
                   'gui_OutputFcn',  @Regresiones_OutputFcn, ...
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


% --- Executes just before Regresiones is made visible.
function Regresiones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Regresiones (see VARARGIN)

% Choose default command line output for Regresiones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Regresiones wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Regresiones_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnLineal.
function btnLineal_Callback(hObject, eventdata, handles)
% hObject    handle to btnLineal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnPolinomial.
function btnPolinomial_Callback(hObject, eventdata, handles)
% hObject    handle to btnPolinomial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnCuadratica.
function btnCuadratica_Callback(hObject, eventdata, handles)
% hObject    handle to btnCuadratica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

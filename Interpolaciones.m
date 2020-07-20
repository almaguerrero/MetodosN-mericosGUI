function varargout = Interpolaciones(varargin)
% INTERPOLACIONES MATLAB code for Interpolaciones.fig
%      INTERPOLACIONES, by itself, creates a new INTERPOLACIONES or raises the existing
%      singleton*.
%
%      H = INTERPOLACIONES returns the handle to a new INTERPOLACIONES or the handle to
%      the existing singleton*.
%
%      INTERPOLACIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERPOLACIONES.M with the given input arguments.
%
%      INTERPOLACIONES('Property','Value',...) creates a new INTERPOLACIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interpolaciones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interpolaciones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interpolaciones

% Last Modified by GUIDE v2.5 30-May-2019 15:05:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interpolaciones_OpeningFcn, ...
                   'gui_OutputFcn',  @Interpolaciones_OutputFcn, ...
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


% --- Executes just before Interpolaciones is made visible.
function Interpolaciones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interpolaciones (see VARARGIN)

% Choose default command line output for Interpolaciones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interpolaciones wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interpolaciones_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnCuadratica.
function btnCuadratica_Callback(hObject, eventdata, handles)
buttons_list = [handles.rbLineal, handles.btnCubica];
set(buttons_list, 'Value', 0);    %turns them all off
cla
x0=1;
        x1=4;
        x2=6;
        f_x0=log(x0);
        f_x1=log(x1);
        f_x2=log(x2);

        x=2;

        b0=f_x0;
        f_x1_x0=(f_x1-f_x0)/(x1-x0);
        b1=f_x1_x0;
        f_x2_x1=(f_x2-f_x1)/(x2-x1);
        f_x2_x1_x0=(f_x2_x1-f_x1_x0)/(x2-x0);
        b2=f_x2_x1_x0;
        f2_x=b0+(b1*(x-x0))+(b2*(x-x0)*(x-x1));

        a0 = b0 - b1*x0 + b2*x0*x1;
        a1 = b1 - b2*x0 - b2*x1;
        a2 = b2;

        x_ref=1:0.01:6;

        f_est=a0+a1*x_ref+a2*x_ref.^2;
        f_ref=log(x_ref);

%         figure;
        plot(x_ref,f_ref,'r','LineWidth',2);
        hold on;

        plot(x0,f_x0,'bo','LineWidth',2);
        plot(x1,f_x1,'bo','LineWidth',2);
        plot(x2,f_x2,'bo','LineWidth',2);
        plot(x,f2_x,'co','LineWidth',2);
        plot(x_ref,f_est,'c','LineWidth',2);


% --- Executes on button press in btnCubica.
function btnCubica_Callback(hObject, eventdata, handles)
buttons_list = [handles.rbLineal, handles.btnCuadratica];
set(buttons_list, 'Value', 0);    %turns them all off
cla
x0=1;
        x1=4;
        x2=5;
        x3=6;
        f_x0=log(x0);
        f_x1=log(x1);
        f_x2=log(x2);
        f_x3=log(x3);

        x=2;

        b0=f_x0;
        f_x1_x0=(f_x1-f_x0)/(x1-x0);
        b1=f_x1_x0; 
        f_x2_x1=(f_x2-f_x1)/(x2-x1);
        f_x2_x1_x0=(f_x2_x1-f_x1_x0)/(x2-x0);
        b2=f_x2_x1_x0; 
        f_x3_x2=(f_x3-f_x2)/(x3-x2);
        f_x2_x1_x0= (f_x2_x1-f_x1_x0)/(x2-x0);
        f_x3_x2_x1 = (f_x3_x2-f_x2_x1)/(x3-x1);
        f_x3_x2_x1_x0=(f_x3_x2_x1-f_x2_x1_x0)/(x3-x0);
        b3=f_x3_x2_x1_x0; 

        f3_x=b0+(b1*(x-x0))+(b2*(x-x0)*(x-x1))+(b3*(x-x0)*(x-x1)*(x-x2));

        a0 = b0 - b1*x0 + b2*x0*x1 - b3*x0*x1*x2;
        a1 = b1 - b2*x0 - b2*x1 + b3*x0*x1 + b3*x1*x2 + b3*x0*x2;
        a2 = b2 - b3*x1 - b3*x0 - b3*x2;
        a3 = b3;

        x_ref=1:0.01:6;

        f_est=a0+a1*x_ref+a2*x_ref.^2 + a3*x_ref.^3;
        f_ref=log(x_ref);
%         figure
        plot(x_ref,f_ref,'r','LineWidth',2);
        hold on;

        plot(x0,f_x0,'bo','LineWidth',2);
        plot(x1,f_x1,'bo','LineWidth',2);
        plot(x2,f_x2,'bo','LineWidth',2);
        plot(x3,f_x3,'bo','LineWidth',2);
        plot(x,f3_x,'co','LineWidth',2);
        plot(x_ref,f_est,'c','LineWidth',2);
        
function rbLineal_Callback(hObject, eventdata, handles)
buttons_list = [handles.btnCuadratica, handles.btnCubica];
set(buttons_list, 'Value', 0);    %turns them all off
cla
x0=1;
        f_x0=log(x0);
        %x1=2;

        x=2;
        x_ref=1:0.01:6;
        f_ref=log(x_ref);

        f1_ver = log(x);

        plot(x_ref,f_ref,'r');
        hold on;

        for i=3:6
            f_x1=log(i);
            f1_x=f_x0+((f_x1-f_x0)/(i-x0))*(x-x0);


            X=[x0 i];
            Y=[f_x0 f_x1];
            line(X,Y,'Color', [0 0 1])

            plot(x0,f_x0,'b+');
            plot(i,f_x1,'b+');
            plot(x,f1_x,'co');
            plot(x,f1_ver,'ro')
        end




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in btnValores.
function btnValores_Callback(hObject, eventdata, handles)
% hObject    handle to btnValores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnRegresar.
function btnRegresar_Callback(hObject, eventdata, handles)
close(Interpolaciones)
list

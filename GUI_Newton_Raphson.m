function varargout = GUI_Newton_Raphson(varargin)
% Last Modified by GUIDE v2.5 05-Jun-2019 15:24:27
    
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Newton_Raphson_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Newton_Raphson_OutputFcn, ...
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


% --- Executes just before GUI_Newton_Raphson is made visible.
function GUI_Newton_Raphson_OpeningFcn(hObject, eventdata, handles, varargin)
%% Inicialización
handles.spoint=str2double(get(handles.edit5,'String'));
handles.funcion='exp(-x)-x';
handles.output = hObject;
handles.metodo=1;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_Newton_Raphson_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox1
if(get(hObject,'Value')==1.0)
    set(handles.edit2,'Enable','on');
    set(handles.popupmenu1,'Enable','off');
    if(handles.metodo==3)
        set(handles.edit9,'Enable','on');
    end
else
    set(handles.edit2,'Enable','off');
    set(handles.popupmenu1,'Enable','on');
    set(handles.edit9,'Enable','off');
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
str = get(hObject, 'String');
val = get(hObject,'Value');
handles.funcion=str{val};
if(handles.metodo==3 &&  strcmp(handles.funcion,'sin(10*x)+cos(3*x)+1'))
    msgbox('This function can not be solved with Fixed Point')
    set(hObject,'Value',1);
    handles.funcion=str{1};
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
% --- Executes during object creation, after setting all properties.


function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%  See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
%% Get Parameters
spoint=str2double(get(handles.edit5,'String'));
srange=str2num(get(handles.edit8,'String'))
imax=str2num(get(handles.edit3,'String'));
error=str2double(get(handles.edit4,'String'));

if(get(handles.checkbox2,'Value')==1.0)
    xmin=spoint-10;
    xmax=spoint+10;
else
    xmin=str2double(get(handles.edit6,'String'));
    xmax=str2double(get(handles.edit7,'String'));
end

if(get(handles.checkbox1,'Value')==1.0)
str=get(handles.edit2,'String');
else
str=(handles.funcion);
end

syms x
funcion=sym(str);

%% Call Method
if(handles.metodo==1)
    % Newton Raphson (Mario Allberto)
    [xn,fxn,ea,i] = newton_raphson(funcion,spoint,imax,error);
    % Set Results
    set(handles.text2,'String',['Error relativo: ',num2str(ea(length(ea)))])
    set(handles.text3,'String',['Iteraciones: ',num2str(i)])
    set(handles.text4,'String',['Raiz aproximada :',num2str(xn)])
    set(handles.text5,'String',['f(x): ',num2str(fxn)])
    axes(handles.axes3)
    plot(abs(ea),'-ro')
    grid on
    xlabel('Iteraciones')
    ylabel('Error (%)')
elseif (handles.metodo==2)
    %Secante (Julio Alberto)
    [xn,ea,i] = MetodoSecante(handles.funcion,srange,error);
    fxn=double(subs(funcion,xn));
    % Set Results
    set(handles.text2,'String',['Relative Error: ',num2str(ea(length(ea)))])
    set(handles.text3,'String',['Iteraciones: ',num2str(i)])
    set(handles.text4,'String',['Error aproximado: ',num2str(xn)])
    set(handles.text5,'String',['f(x): ',num2str(fxn)])
    axes(handles.axes3)
    plot(abs(ea),'-ro')
    grid on
    xlabel('Iterations')
    ylabel('Error (%)')
elseif (handles.metodo==3)
   
    if(get(handles.checkbox1,'Value')==1.0)
    funcion2=get(handles.edit9,'String');
    else
        if(get(handles.popupmenu1,'Value')==1)
            funcion2='exp(-x)';
        else
            funcion2='1^(1/10)';
        end
    end
    [xn,eak, ea, i ]= Puntofijo(str,funcion2,spoint,error,imax);
    fxn=double(subs(funcion,xn));
    set(handles.text2,'String',['Error relativo: ',num2str(eak)])
    set(handles.text3,'String',['Iteraciones: ',num2str(i)])
    set(handles.text4,'String',['Raíz aproximada: ',num2str(xn)])
    set(handles.text5,'String',['f(x): ',num2str(fxn)])
    axes(handles.axes3)
    plot(ea,'-ro')
    grid on
    xlabel('Iterations')
    ylabel('Error (%)')
elseif (handles.metodo==4)
    %False Position (Ricardo Dominguez)
    disp('FALSA POSICION')
    [xn, i, ea] = falsa_posicion(funcion,srange(1),srange(2),error);
    fxn=0;
    set(handles.text2,'String',['Relative Error: ',num2str(ea(length(ea)))])
    set(handles.text3,'String',['Iterations: ',num2str(i)])
    set(handles.text4,'String',['Aproximated Root: ',num2str(xn)])
    set(handles.text5,'String',['f(x): ',num2str(fxn)])
    axes(handles.axes3)
    plot(ea,'-ro')
    grid on
    xlabel('Iteraciones')
    ylabel('Error (%)')
else
    [xn,i]= BusquedaIncremental(funcion,srange(1),srange(1),error,imax);
    fxn=double(subs(funcion,xn));
    if(fxn>=1 && i<=imax)
        msgbox(['Try reducing interval search(error) or increase Number of Iterations. f(x)= ', num2str(fxn)])
        set(handles.text3,'String',['Iterations: ',num2str(i)])
        set(handles.text4,'String',['Aproximated Root: ',num2str(xn)])
        set(handles.text5,'String',['f(x): ',num2str(fxn)])
    %elseif(fxn>=1 && i==imax)
     %   msgbox('Try other interval. Number of iterations exceeded')
    else
        set(handles.text3,'String',['Iteraciones: ',num2str(i)])
        set(handles.text4,'String',['Aproximated Root: ',num2str(xn)])
        set(handles.text5,'String',['f(x): ',num2str(fxn)])
    end
end
%% Ploting
xi=xmin:(xmax-xmin)/1000:xmax;
f_x=double(subs(funcion,xi));
axes(handles.axes2)
plot(xi,f_x,xn,fxn,'o')
grid on
ylabel('f(x)')
xlabel('x')
legend('Function','Root')


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox2
if(get(hObject,'Value')==1.0)
    set(handles.edit6,'Enable','off');
    set(handles.edit7,'Enable','off');
else
    set(handles.edit6,'Enable','on');
    set(handles.edit7,'Enable','on');
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

spoint=str2double(get(handles.edit5,'String'));

if(get(handles.checkbox2,'Value')==1.0)
    xmin=spoint-10;
    xmax=spoint+10;
else
    xmin=str2double(get(handles.edit6,'String'));
    xmax=str2double(get(handles.edit7,'String'));
end
if(get(handles.checkbox1,'Value')==1.0)
str=get(handles.edit2,'String');
else
str=(handles.funcion);
end
syms x
funcion=sym(str);
xi=xmin:(xmax-xmin)/1000:xmax;
f_x=double(subs(funcion,xi));
axes(handles.axes2)
plot(xi,f_x)
ylabel('f(x)')
xlabel('x')
grid on


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
val = get(hObject,'Value');
handles.metodo=val;
if (val==4 || val==5 || val==2)
    set(handles.edit8,'Enable','on')
    set(handles.edit5,'Enable','off')
    set(handles.edit9,'Enable','off')
else
    set(handles.edit8,'Enable','off')
    set(handles.edit5,'Enable','on')
    set(handles.edit9,'Enable','off')
    if(val ==3 && get(handles.checkbox1,'Value')==1.0)
        set(handles.edit9,'Enable','on')
    end
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
msgbox('Write the function in terms of variable x. For Fixed Point method it is also necessary the function with x isolated (see default example)')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
msgbox('For opened methods it is necessary only one starting point (but Secant Method ). Closed methods require a intervale')


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.popupmenu2,'Value');

switch val
    case 1
        text='This opened method developed by Newton and Raphson was based on  a graphical method that needs to compute the derivate of the function, coming up with the following equation: x(n+1)=x(n)-f(x(n))/f´(x(n))';
    case 2
        text='This opened method, likely to false position, avoids computng the derivate and it requires an intervale';
    case 3
        text='This is a simple opened method but it requires to isolate the variable for the computation of the root';
    case 4
        text='This is a closed method and it requieres an interval similar to bisection';
    case 5
        text='This closed method can find all roots in the intervale but it requieres many iterations with an increment (set this in the error box)';
end
msgbox(text)



function pushbutton7_Callback(hObject, eventdata, handles)
msgbox('Numerical Methods for Finding Roots by: Mario Alberto Olivares; Julio Ramirez Montanez; Ricardo Dominguez Guevara; Gendry Alfonso Francia; Miguel Moncada Malagon')


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(GUI_Newton_Raphson);
VentanaPrincipal

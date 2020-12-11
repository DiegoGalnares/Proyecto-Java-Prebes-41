function varargout = multivariable(varargin)
% MULTIVARIABLE MATLAB code for multivariable.fig
%      MULTIVARIABLE, by itself, creates a new MULTIVARIABLE or raises the existing
%      singleton*.
%
%      H = MULTIVARIABLE returns the handle to a new MULTIVARIABLE or the handle to
%      the existing singleton*.
%
%      MULTIVARIABLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTIVARIABLE.M with the given input arguments.
%
%      MULTIVARIABLE('Property','Value',...) creates a new MULTIVARIABLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before multivariable_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to multivariable_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help multivariable

% Last Modified by GUIDE v2.5 11-Dec-2020 02:51:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @multivariable_OpeningFcn, ...
                   'gui_OutputFcn',  @multivariable_OutputFcn, ...
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


% --- Executes just before multivariable is made visible.
function multivariable_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to multivariable (see VARARGIN)

% Choose default command line output for multivariable
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes multivariable wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = multivariable_OutputFcn(hObject, eventdata, handles) 
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 %LEER TABLA
 data=readtable('Copy.csv');
 %ASIGNAR X & Y
 y=data{:,9}; %calificacion 
 x1=data{:,2}; %GRE
 x2=data{:,3}; %TOEFL
 x3=data{:,7}; %CGPA
 
 [n,d]=size(y);
 xMat=[ones(n,1) x1 x2 x3];
 [beta, sigma,E,V]= mvregress(xMat,y);

 gre=get(handles.edit1, 'String');
 toefl=get(handles.edit2, 'String');
 cgpa=get(handles.edit3, 'String');
 pos=get(handles.edit6,'String');
 prob=get(handles.edit7,'String');
 a=str2num(gre);
 b=str2num(toefl);
 c=str2num(cgpa);
 d=str2num(pos);
 e=str2num(prob);
 
 if (isempty(gre)==0)
     if (isempty(toefl)==0)
         if (isempty(cgpa)==0)
             if (a<=340 & a>=0)
                 if (e<=1 & e>=0)
                     if (b<=120 & b>=0)
                         if (c<=10 & c>=0)
                            
                            xMat2=[1 a b c];
                            aux=xMat2*beta;
                            hold on;
                            axes(handles.axes1);
                            plot(aux,e);
                            
                            xlabel('Resultados');
                            ylabel('Posibilidad de ser admitido');
                            title('Regresion Lineal');
                            
                            %AGREGAR/MODIFICAR VALORES
                            data{d,2}=a;
                            data{d,3}=b;
                            data{d,7}=c;
                            data{d,9}=e;
                            write(data,'Copy2.csv');
                         end
                     end
                 end
             end
         end
     end
 end
 return
 



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


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

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%LEER TABLA
 data=readtable('Copy.csv');
 %ASIGNAR X & Y
 y=data{:,9}; %calificacion 
 x1=data{:,2}; %GRE
 x2=data{:,3}; %TOEFL
 x3=data{:,7}; %CGPA
 
 [n,d]=size(y);
 xMat=[ones(n,1) x1 x2 x3];
 [beta, sigma,E,V]= mvregress(xMat,y);
 axes(handles.axes1)
 plot(xMat,y);
 
 xlabel('Resultados');
 ylabel('Posibilidad de ser admitido');
 title('Regresion Lineal');
 grid on;

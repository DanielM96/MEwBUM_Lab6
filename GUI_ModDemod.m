function varargout = GUI_ModDemod(varargin)
% GUI_MODDEMOD MATLAB code for GUI_ModDemod.fig
%      GUI_MODDEMOD, by itself, creates a new GUI_MODDEMOD or raises the existing
%      singleton*.
%
%      H = GUI_MODDEMOD returns the handle to a new GUI_MODDEMOD or the handle to
%      the existing singleton*.
%
%      GUI_MODDEMOD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MODDEMOD.M with the given input arguments.
%
%      GUI_MODDEMOD('Property','Value',...) creates a new GUI_MODDEMOD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ModDemod_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ModDemod_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ModDemod

% Last Modified by GUIDE v2.5 15-Nov-2018 20:34:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_ModDemod_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_ModDemod_OutputFcn, ...
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


% --- Executes just before GUI_ModDemod is made visible.
function GUI_ModDemod_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ModDemod (see VARARGIN)

% Choose default command line output for GUI_ModDemod
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_ModDemod wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ModDemod_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
evalin('base','clear; clc');

global modType carrierType modulation;
modType = 1;
carrierType = 1;
modulation = 1;

% --- Executes on button press in pushbutton1_exit.
function pushbutton1_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);

% --- Executes on selection change in popupmenu1_mod.
function popupmenu1_mod_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1_mod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1_mod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1_mod
global modType;
modType = get(hObject,'Value');

contents = cellstr(get(hObject,'String'));
statusBar = sprintf('Typ sygna³u modulowanego: %s.',contents{modType});
set(handles.text1_status,'String',statusBar);

% --- Executes during object creation, after setting all properties.
function popupmenu1_mod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1_mod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2_carrier.
function popupmenu2_carrier_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2_carrier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2_carrier contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2_carrier
global carrierType;
carrierType = get(hObject,'Value');

contents = cellstr(get(hObject,'String'));
statusBar = sprintf('Typ sygna³u moduluj¹cego: %s.',contents{carrierType});
set(handles.text1_status,'String',statusBar);

% --- Executes during object creation, after setting all properties.
function popupmenu2_carrier_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2_carrier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3_modulation.
function popupmenu3_modulation_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3_modulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3_modulation contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3_modulation
global modulation;
modulation = get(hObject,'Value');

contents = cellstr(get(hObject,'String'));
statusBar = sprintf('Rodzaj modulacji: %s.',contents{modulation});
set(handles.text1_status,'String',statusBar);

% --- Executes during object creation, after setting all properties.
function popupmenu3_modulation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3_modulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2_generate.
function pushbutton2_generate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global modType carrierType modulation Fs;
Fs = 250;
% czêstotliwoœæ sygna³u modulowanego
fc = 30;
% czêstotliwoœæ sygna³u moduluj¹cego
f = 15;
T = 3;
t = 1/Fs:1/Fs:T;

tic;

statusBar = sprintf('Generowanie sygna³u modulowanego...');
set(handles.text1_status,'String',statusBar);
% moduluj¹cy
switch modType
    case 1 % D
        x = sin(2*pi*f*t);
        
    case 2 % R
        x = rand(1,length(t));
end

pause(0.1);

statusBar = sprintf('Generowanie sygna³u moduluj¹cego...');
set(handles.text1_status,'String',statusBar);
% modulowany
switch carrierType
    case 1 % D
        c = sin(2*pi*fc*t);
    case 2 % R
        c = rand(1,length(t));
end

pause(0.1);

statusBar = sprintf('Modulacja sygna³u...');
set(handles.text1_status,'String',statusBar);
% mod
switch modulation
    case 1 % AM
        modSignal = (1+0.8*x).*c;
%         modSignal = ammod(x,fc,Fs);
        
    case 2 % FM
        modSignal = fmmod(x,fc,Fs,pi/2);
        
    case 3 % PM
        modSignal = pmmod(x,fc,Fs,pi/2);
end

pause(0.1);

statusBar = sprintf('Demodulacja sygna³u...');
set(handles.text1_status,'String',statusBar);
% demod

% demodSignal = hilbert(modSignal);
% env = abs(demodSignal);

switch modulation
    case 1
        demodSignal = amdemod(modSignal,fc,Fs);
    case 2
        demodSignal = fmdemod(modSignal,fc,Fs,pi/2);
    case 3
        demodSignal = pmdemod(modSignal,fc,Fs,pi/2);
end

pause(0.1);

statusBar = sprintf('Generowanie wykresów...');
set(handles.text1_status,'String',statusBar);

axes(handles.axes1_mod_tv);
plot(t,modSignal);
title('Przebieg czasowy sygna³u zmodulowanego');
xlabel('Czas [s]');
ylabel('Amplituda');
zoom on;

n = length(modSignal);
mod_fft = fft(modSignal);
mod_fft = abs(mod_fft);
mod_fft = mod_fft(1:n/2+1);
mod_fft = mod_fft/(n/2);
df = 1/T;
f = 0:df:Fs/2;

axes(handles.axes2_mod_spectre);
plot(f,mod_fft);
title('Widmo sygna³u zmodulowanego');
xlabel('Czêstotliwoœæ [Hz]');
ylabel('Amplituda');
xlim([ 0 f(end) ]);
zoom on;

axes(handles.axes3_demod_tv);
plot(t,demodSignal);
title('Przebieg czasowy sygna³u po demodulacji');
xlabel('Czas [s]');
ylabel('Amplituda');
zoom on;

axes(handles.axes4_demod_spectre);
demod_fft = fft(demodSignal);
demod_fft = abs(demod_fft);
demod_fft = demod_fft(1:n/2+1);
demod_fft = demod_fft/(n/2);
plot(f,demod_fft);
title('Widmo sygna³u po demodulacji');
xlabel('Czêstotliwoœæ [Hz]');
ylabel('Amplituda');
xlim([ 0 f(end) ]);
zoom on;

genTime = toc;

statusBar = sprintf('Operacje zakoñczone (%.2f s).',genTime);
set(handles.text1_status,'String',statusBar);


% --- Executes on button press in pushbutton3_info.
function pushbutton3_info_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global modType carrierType;
str_car1 = 'Sygna³ modulowany (noœny): 2*sin(2*pi*15*t)';
str_car2 = 'Sygna³ modulowany (noœny): rand(1,length(t))';
str_mod1 = 'Sygna³ moduluj¹cy: 2*sin(2*pi*30*t)';
str_mod2 = 'Sygna³ moduluj¹cy: rand(1,length(t))';
str_t = 'Wektor czasu: t = 1/Fs:1/Fs:3';
str_fs = 'Czêstotliwoœæ próbkowania sygna³u: Fs = 250 Hz';

if modType == 1
    str_mod = str_mod1;
else
    str_mod = str_mod2;
end

if carrierType == 1
    str_car = str_car1;
else
    str_car = str_car2;
end

msgbox({ 'Parametry sygna³u: ','',...
    str_fs,str_t,str_mod,str_car },'Parametry sygna³u','help');

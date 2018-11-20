function varargout = GUI_Demodulation(varargin)
% GUI_DEMODULATION MATLAB code for GUI_Demodulation.fig
%      GUI_DEMODULATION, by itself, creates a new GUI_DEMODULATION or raises the existing
%      singleton*.
%
%      H = GUI_DEMODULATION returns the handle to a new GUI_DEMODULATION or the handle to
%      the existing singleton*.
%
%      GUI_DEMODULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_DEMODULATION.M with the given input arguments.
%
%      GUI_DEMODULATION('Property','Value',...) creates a new GUI_DEMODULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Demodulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Demodulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Demodulation

% Last Modified by GUIDE v2.5 13-Nov-2018 18:56:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Demodulation_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Demodulation_OutputFcn, ...
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


% --- Executes just before GUI_Demodulation is made visible.
function GUI_Demodulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Demodulation (see VARARGIN)

% Choose default command line output for GUI_Demodulation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Demodulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);
evalin('base','clear; clc');
global selectedData dataLUT Fs;
selectedData = 1;

% dane
dataLUT = { 'saw.mat' 'plate1.mat' 'plate2.mat' 'custom.mat' };
Fs = 25000;


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Demodulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1_exit.
function pushbutton1_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);

% --- Executes on selection change in popupmenu1_data.
function popupmenu1_data_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1_data contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1_data
global selectedData;
selectedData = get(hObject,'Value');

contents = cellstr(get(hObject,'String'));
statusBar = sprintf('Wybrany pomiar: %s.',contents{get(hObject,'Value')});
set(handles.text1_status,'String',statusBar);

% --- Executes during object creation, after setting all properties.
function popupmenu1_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2_load.
function pushbutton2_load_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global selectedData dataLUT Fs;

tic;
inputData = load(dataLUT{selectedData});
inputData = inputData.x;
loadTime = toc;

statusBar = sprintf('Wczytywanie zakoñczone (%.2f s).',loadTime);
set(handles.text1_status,'String',statusBar);

pause(0.5);
statusBar = sprintf('Generowanie wykresów...');
set(handles.text1_status,'String',statusBar);

%% wykresy
% wektor czasu
timeEnd = length(inputData)/Fs;
t = 1/Fs:1/Fs:timeEnd;

pause(0.05);
tic;
% przebieg czasowy
axes(handles.axes1_timeview);
plot(t,inputData);
title('Przebieg czasowy');
xlabel('Czas [s]');
ylabel('Amplituda');
xlim([ 0 timeEnd ]);
zoom on;

% FFT
N = length(inputData);
df = Fs/N;
f = 0:df:Fs/2;
in_fft = fft(inputData);
in_fft = abs(in_fft);
in_fft = in_fft(1:N/2+1);
in_fft = in_fft/(N/2);

axes(handles.axes2_spectre);
plot(f,in_fft);
title('Widmo sygna³u');
xlabel('Czêstotliwoœæ [Hz]');
ylabel('Amplituda');
zoom on;

axes(handles.axes3_spectrogram);
spectrogram(inputData,20000,10000,20000,Fs);
zoom on;

axes(handles.axes4_demod);
% tu bêdzie wykres zdemodulowanego sygna³u

% filtr górnoprzepustowy
hipassDesign = fdesign.highpass('n,fst,ast',4,50/(Fs/2),55);
hipass = design(hipassDesign,'cheby2');
filteredInput = filter(hipass,inputData);

% prostowanie
filteredInput = abs(filteredInput);

% filtr dolnoprzepustowy
lowpassDesign = fdesign.lowpass('n,fst,ast',4,8000/(Fs/2),55);
lowpass = design(lowpassDesign,'cheby2');
demodInput = filter(lowpass,filteredInput);

demod_fft = fft(demodInput);
demod_fft = abs(demod_fft);
demod_fft = demod_fft(1:N/2+1);
demod_fft = demod_fft/(N/2);

for i = 1:6
    demod_fft(i) = 0;
end

plot(f,demod_fft);
title('Widmo sygna³u po demodulacji');
xlabel('Czêstotliwoœæ [Hz]');
ylabel('Amplituda');

genTime = toc;

statusBar = sprintf('Wygenerowano wykresy (%.2f s).',genTime);
set(handles.text1_status,'String',statusBar);


% --------------------------------------------------------------------
function Menu_Help_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Matlab_Callback(hObject, eventdata, handles)
% hObject    handle to Help_Matlab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
doc;

% --------------------------------------------------------------------
function Help_About_Callback(hObject, eventdata, handles)
% hObject    handle to Help_About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({ 'GUI_Demodulation','','Funkcje: ','',...
    '- wczytywanie danych pomiarowych,',...
    '- wyznaczanie widma i spektrogramu,',...
    '- demodulacja sygna³u,',...
    '- wyznaczanie czêstotliwoœci wzbudzania.' },...
    'GUI_FanAndSaw - informacje','help');
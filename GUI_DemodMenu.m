function varargout = GUI_DemodMenu(varargin)
% GUI_DEMODMENU MATLAB code for GUI_DemodMenu.fig
%      GUI_DEMODMENU, by itself, creates a new GUI_DEMODMENU or raises the existing
%      singleton*.
%
%      H = GUI_DEMODMENU returns the handle to a new GUI_DEMODMENU or the handle to
%      the existing singleton*.
%
%      GUI_DEMODMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_DEMODMENU.M with the given input arguments.
%
%      GUI_DEMODMENU('Property','Value',...) creates a new GUI_DEMODMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_DemodMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_DemodMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_DemodMenu

% Last Modified by GUIDE v2.5 15-Nov-2018 20:38:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_DemodMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_DemodMenu_OutputFcn, ...
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


% --- Executes just before GUI_DemodMenu is made visible.
function GUI_DemodMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_DemodMenu (see VARARGIN)

% Choose default command line output for GUI_DemodMenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_DemodMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_DemodMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
evalin('base','clear; clc');

% --- Executes on button press in pushbutton1_generated.
function pushbutton1_generated_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_generated (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GUI_ModDemod;

% --- Executes on button press in pushbutton2_data.
function pushbutton2_data_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GUI_Demodulation;

% --- Executes on button press in pushbutton3_exit.
function pushbutton3_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);
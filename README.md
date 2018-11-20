# MEwBUM_Lab6
Metody eksperymentalne w badaniach układów mechatronicznych - Matlab GUI - Lab6

Laboratorium nr 6 - demodulacja sygnału

# Zawartość

___convCsv2Mat.m___

Funkcja konwertująca pliki w formacie CSV do plików w formacie MAT (por. https://github.com/DanielM96/MEwBUM_Lab3, https://github.com/DanielM96/MEwBUM_Lab5).

___csvimport.m___

Funkcja importująca dane z plików w formacie CSV. Wykorzystana bezpośrednio w _convCsv2Mat.m_.

___GUI_DemodMenu___

Menu główne z dostępnymi opcjami: _Generowane sygnały, Zarejestrowane sygnały, Wyjście._

___GUI_Demodulation___

Moduł pozwalający na demodulację zarejestrowanych sygnałów. Wykorzystuje on metodę klasyczną: HP -> Prostowanie -> LP.

___GUI_ModDemod___

Moduł pozwalający na modulację AM, FM i PM oraz demodulację generowanych sygnałów. Wykorzystuje wbudowane funkcje _amdemod, fmdemod, pmdemod._

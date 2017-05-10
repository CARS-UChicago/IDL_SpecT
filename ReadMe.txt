********************************************************************************
============   SpecT (Version 1 beta)   ============
        An IDL GUI for Temperature Measurement 

================  Guoyin Shen  ==================
            Center for Advanced Radiation Sources 
                           University of Chicago  
                 Email: shen@cars.uchicago.edu 
             ---------------------- 1/26/2005 -------------------------

*******************************************************************************
WHAT IS SpecT?

SpecT (pronounced as “Spek Tee”) is an IDL GUI. It controls/calculates 
temperature by fitting the Planck radiation law to thermal 
radiation signals. The radiation data can be from extisting file(s) 
or by launching new measurements. The version 1.0 only controls "WinSpec" 
from Roper Scientific (Princeton Instrument). 

SpecT is provided AS IS without any warranty. The package is modified 
from a working system at GSECARS sector at the Advanced Photon Source, 
and has been used at other sectors at Advanced Photon Source.  
Permission to use. Your comments and suggestions are welcome. 
For new users, please send Guoyin Shen (shen@cars.uchicago.edu) an 
email, so that your name can be in the list for future upgrades.



LOAD PARAMETERS 

!!! As the main control interface appears, the first step is to click 
the "Setup Parameters" button. !!!

For temperature calculation, initial parameters must be loaded 
first. By clicking the “Setup Parameters” button or from the menu 
(Preferences>Setup StecT Parameters), some initial values will be 
loaded.  

EDIT PARAMETERS

Determine setup modes by selecting four DROPLIST widgets. 
Drop-list choices:
   Detector side
      Single: One detector collects radiation from one side;
      Both: One detector collects radiation from both sides;
      Upstream: The upstream side (Note: EPICS mode turns on);
      Downstream: The downstream side (Note: EPICS mode turns on).

   Emissivity
      Wavelength Independent: Emissivity does not change with wavelength;
      Wavelength Dependent: Emissivity changes with wavelength. Only linear
                            change with wavelength is included in this 
                            software with the formular shown.
   Collection Mode
      Pinhole Mode: A pinhole is used at the entrance of a spectrometer;
                    Returns only one temperature;
      Slit Mode: A slit is used at the entrance of a spectrometer.
                 Returns a temperature array.
   EPICS Control
      Yes: Allows EPICS control (make sure PV names are set);
      No: No EPICS control.

For the standard lamp data, the version 1.0 only supports the polynomial 
fit up to the 4th power.

APPLY PARAMETERS

Buttons "Apply", "Apply and Save", or "Save as Default" will apply
the shown parameters to temperature controls and calculations.
The Button "Cancel" does not apply nor save parameters.

DIRECTORIES

Directories can be preset using the menu (Preferences>Specify Directories).
Directories are divided into three major types.
   SpecT directory: Default C:\IDL\Temperature\ or use preferences for a location;
   Data directory: no default;
   Calibration directory: no default.
Directories are 'remembered' if "Load files" or "Load standard" are used.

DISPLAY

Two IDL draw windows are used for display. Each window can display Planck 
radiation fit, temperature profile, raw spectra, and intensity profile. 
If pinhile mode is used, there will be no profile to display. These options 
   are then left blanck.
If only one side (Single, Upstream, Downstream) is used, the left window
is used for radiation fit and temperature; while the right side window is used 
for raw spectra and intensity.

MULTI-FILES CALCULATION

This software allows temperature calculations from a series of saved files. 
Simply load (by clicking "Load a file" button) one of the files to be calculated. Delete 
the increment number and the extension (".spe"). Input numbers in the areas
of "First" and "last" (just beside the DROPLIST widget of single vs multi).
Start calculating by pressing the button "Calculate T". 

SAVE
Print

For saving and printing, just use the menu (File>Save.....).

One tip to remember:
If any error(s) occurs, type "retall" in the command line in the IDL window that 
started the "SpecT".

********************************************************************************
 
 





 
           
  



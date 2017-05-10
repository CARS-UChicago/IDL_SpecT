HEADER
; IDL Visual Widget Builder Resource file. Version 1
; Generated on:	01/26/2005 16:32.16
VERSION 1
END

Base_Main BASE 5 5 758 642
TLB
CAPTION "SpecT v1.b"
XPAD = 3
YPAD = 3
SPACE = 3
BEGIN
  WID_BASE_0_MBAR MENUBAR 0 0 0 0
  BEGIN
    w_menu_file PUSHBUTTON 0 0 0 0
    VALUE "File"
    MENU
    BEGIN
      W_MENU_1 PUSHBUTTON 0 0 0 0
      VALUE "Measure Temperature..."
      ONACTIVATE "OnMeasureT"
      END
      MENU_LoadSpec PUSHBUTTON 0 0 0 0
      VALUE "Load a Spectrum"
      SEPARATOR
      ONACTIVATE "OnLoadSpec"
      END
      MENU_LoadStand PUSHBUTTON 0 0 0 0
      VALUE "Load a Standard"
      ONACTIVATE "OnLoadStand"
      END
      MENU_CalcT PUSHBUTTON 0 0 0 0
      VALUE "Temperature Calculation"
      MENU
      SEPARATOR
      BEGIN
        MENU_CalcTsingle PUSHBUTTON 0 0 0 0
        VALUE "Single File"
        ONACTIVATE "OnCalcTSingle"
        END
        MENU_CalcTMulti PUSHBUTTON 0 0 0 0
        VALUE "Multi Files"
        ONACTIVATE "OnCalcTMulti"
        END
      END
      MENU_Save PUSHBUTTON 0 0 0 0
      VALUE "Save Temperature"
      SEPARATOR
      ONACTIVATE "OnSaveT"
      END
      MENU_SaveAs PUSHBUTTON 0 0 0 0
      VALUE "Save Temperature As..."
      ONACTIVATE "OnSaveTAs"
      END
      MENU_SavePlanck PUSHBUTTON 0 0 0 0
      VALUE "Save PlanckData As..."
      ONACTIVATE "OnSavePlanckAs"
      END
      W_MENU_Print PUSHBUTTON 0 0 0 0
      VALUE "Print"
      MENU
      SEPARATOR
      BEGIN
        MENU_PrintTemperature PUSHBUTTON 0 0 0 0
        VALUE "Temperature"
        ONACTIVATE "OnPrintT"
        END
        MENU_PrintPlanckFit PUSHBUTTON 0 0 0 0
        VALUE "Planck Fit"
        ONACTIVATE "OnPrintPlanck"
        END
      END
      W_MENU_Exit PUSHBUTTON 0 0 0 0
      VALUE "Exit"
      SEPARATOR
      ONACTIVATE "OnExit"
      END
    END
    W_MENU_Edit PUSHBUTTON 0 0 0 0
    VALUE "Edit"
    MENU
    BEGIN
      MENU_Cut PUSHBUTTON 0 0 0 0
      VALUE "Cut"
      GRAYED
      END
      MENU_Copy PUSHBUTTON 0 0 0 0
      VALUE "Copy"
      GRAYED
      END
      MENU_Paste PUSHBUTTON 0 0 0 0
      VALUE "Paste"
      GRAYED
      END
    END
    W_MENU_14 PUSHBUTTON 0 0 0 0
    VALUE "Data"
    MENU
    BEGIN
      MENU_FileInformation PUSHBUTTON 0 0 0 0
      VALUE "File Information"
      ONACTIVATE "OnFileinfo"
      END
      MENU_FitInfor PUSHBUTTON 0 0 0 0
      VALUE "Fitting Information"
      ONACTIVATE "OnFittingInfo"
      END
      MENU_PlotPlanckFit PUSHBUTTON 0 0 0 0
      VALUE "Plot Planck Fit"
      SEPARATOR
      ONACTIVATE "OnPlotPlanck"
      END
      MENU_PlotTProfile PUSHBUTTON 0 0 0 0
      VALUE "Plot Temperature Profile"
      ONACTIVATE "OnPlotT"
      END
      MENU_PlotRawData PUSHBUTTON 0 0 0 0
      VALUE "Plot Raw Data"
      SEPARATOR
      ONACTIVATE "OnPlotRaw"
      END
      MENU_PlotIntProfile PUSHBUTTON 0 0 0 0
      VALUE "Plot Intensity Profile"
      ONACTIVATE "OnPlotInt"
      END
    END
    W_MENU_Pref PUSHBUTTON 0 0 0 0
    VALUE "Preferences"
    MENU
    BEGIN
      MENU_RunTParam PUSHBUTTON 0 0 0 0
      VALUE "Setup SpecT Parameters ..."
      SEPARATOR
      ONACTIVATE "OnRunTParam"
      END
      W_MENU_0 PUSHBUTTON 0 0 0 0
      VALUE "Load Default Parameters..."
      ONACTIVATE "OnLoadDefault"
      END
      MENU_EPICSpv PUSHBUTTON 0 0 0 0
      VALUE "Setup EPICS PV names..."
      SEPARATOR
      ONACTIVATE "OnEPICSpv"
      END
      MENU_dir PUSHBUTTON 0 0 0 0
      VALUE "Specify Directories"
      SEPARATOR
      ONACTIVATE "OnDir"
      END
    END
    W_MENU_help PUSHBUTTON 0 0 0 0
    VALUE "Help"
    MENU
    BEGIN
      MENU_AboutRunT PUSHBUTTON 0 0 0 0
      VALUE "About SpecT"
      ONACTIVATE "OnAbout"
      END
      MENU_ReadMe PUSHBUTTON 0 0 0 0
      VALUE "ReadMe"
      SEPARATOR
      ONACTIVATE "OnReadMe"
      END
      MENU_OnLineHelp PUSHBUTTON 0 0 0 0
      VALUE "Help On Line"
      GRAYED
      ONACTIVATE "OnHelpOnLine"
      END
    END
  END
  TEXT_StandFile TEXT 109 104 429 23
  EDITABLE
  WIDTH = 20
  HEIGHT = 1
  END
  TEXT_Display TEXT 541 20 203 203
  FRAME = 1
  SCROLL
  NUMITEMS = 1
  ITEM ""
  EDITABLE
  WRAP
  WIDTH = 20
  HEIGHT = 1
  END
  TEXT_File TEXT 96 76 442 23
  EDITABLE
  WIDTH = 20
  HEIGHT = 1
  END
  Button_RunT PUSHBUTTON 19 19 363 49
  VALUE "Run_T ......"
  FRAME = 1
  ALIGNCENTER
  NORELEASE
  ONACTIVATE "OnRunT"
  END
  DROPLIST_FileToDo DROPLIST 133 201 108 21
  NUMITEMS = 3
  ITEM "Single file"
  ITEM "Multi files"
  ITEM ""
  ONSELECT "OnSelectFile"
  END
  BUTTON_CalT PUSHBUTTON 20 201 108 23
  VALUE "Calculate T"
  ALIGNCENTER
  ONACTIVATE "OnCalcT_B"
  END
  BUTTON_LoadStand PUSHBUTTON 20 105 87 23
  VALUE "Load a Standard"
  ALIGNCENTER
  ONACTIVATE "OnLoadStand_B"
  END
  BUTTON_LoadFile PUSHBUTTON 20 76 73 23
  VALUE "Load a File"
  ALIGNCENTER
  ONACTIVATE "OnLoadFile_B"
  END
  DROPLIST_CCDtime DROPLIST 384 46 101 24
  CAPTION "CCDTime"
  NUMITEMS = 15
  ITEM "1.0"
  ITEM "0.02"
  ITEM "0.05"
  ITEM "0.1"
  ITEM "0.2"
  ITEM "0.5"
  ITEM "1.0"
  ITEM "2.0"
  ITEM "5.0"
  ITEM "10.0"
  ITEM "20.0"
  ITEM "30.0"
  ITEM "60.0"
  ITEM "120.0"
  ITEM "300.0"
  ONSELECT "OnSelectCCDTime"
  END
  DROPLIST_RunMode DROPLIST 417 19 68 27
  NUMITEMS = 12
  ITEM "Passive"
  ITEM "1.0"
  ITEM "2.0"
  ITEM "3.0"
  ITEM "4.0"
  ITEM "5.0"
  ITEM "10.0"
  ITEM "15.0"
  ITEM "30.0"
  ITEM "60.0"
  ITEM "120.0"
  ITEM "300.0"
  ONSELECT "OnSelectRunMode"
  END
  WID_LABEL_0 LABEL 485 50 20 18
  VALUE "Sec"
  ALIGNLEFT
  END
  BaseParam BASE 22 232 686 353
  FRAME = 1
  UNMAP
  XPAD = 3
  YPAD = 3
  SPACE = 3
  CAPTION "IDL"
  BEGIN
    BaseEmis BASE 4 216 233 67
    FRAME = 1
    ALIGNRIGHT
    XPAD = 3
    YPAD = 3
    SPACE = 5
    CAPTION "IDL"
    BEGIN
      Emis1_TEXT TEXT 124 24 103 20
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      Emis_CenterText TEXT 125 1 103 20
      NUMITEMS = 1
      ITEM "750"
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_1 LABEL 1 5 0 0
      VALUE "Central Wavelength (nm)"
      ALIGNLEFT
      END
      WID_LABEL_3 LABEL 2 27 0 0
      VALUE "Emis1"
      ALIGNLEFT
      END
      WID_LABEL_4 LABEL 21 50 0 0
      VALUE "Emis=Emis0*[1+Emis1*(Lambda-750)]"
      ALIGNLEFT
      END
    END
    Emis_DROPLIST DROPLIST 3 193 202 23
    CAPTION "Emissivity"
    NUMITEMS = 2
    ITEM "Wavelength Independent"
    ITEM "Wavelength Dependent"
    ONSELECT "OnSelectEmis"
    END
    BaseRunTParam BASE 4 28 232 154
    FRAME = 1
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "IDL"
    BEGIN
      TEXT_StartWav TEXT 122 3 103 20
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_EndWav TEXT 122 29 103 20
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_Bin TEXT 122 102 103 20
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_5 LABEL 3 105 0 0
      VALUE "Binning"
      ALIGNLEFT
      END
      WID_LABEL_7 LABEL 3 7 0 0
      VALUE "Start Wavelength (nm)"
      ALIGNLEFT
      END
      WID_LABEL_8 LABEL 4 31 0 0
      VALUE "End Wavelength (nm)"
      ALIGNLEFT
      END
      TEXT_StartRow TEXT 122 53 103 21
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_NumRow TEXT 122 78 103 21
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_6 LABEL 3 59 0 0
      VALUE "Start Row"
      ALIGNLEFT
      END
      WID_LABEL_9 LABEL 3 81 88 18
      VALUE "Number of Rows"
      ALIGNLEFT
      END
      TEXT_Average TEXT 122 129 103 20
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_15 LABEL 3 130 0 0
      VALUE "Points for averaging"
      ALIGNLEFT
      END
    END
    RunT_DROPLIST DROPLIST 5 4 183 22
    CAPTION "Detector Side"
    NUMITEMS = 4
    ITEM "Single"
    ITEM "Both"
    ITEM "Upstream"
    ITEM "Downstream"
    ONSELECT "OnSelectSide"
    END
    BaseRunTParamBoth BASE 241 28 232 132
    FRAME = 1
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "IDL"
    BEGIN
      TEXT_StartRow_0 TEXT 124 26 103 21
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_NumRow_0 TEXT 124 50 103 21
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_Bin_0 TEXT 124 75 103 20
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_10 LABEL 5 78 0 0
      VALUE "Binning"
      ALIGNLEFT
      END
      WID_LABEL_11 LABEL 5 54 88 18
      VALUE "Number of Rows"
      ALIGNLEFT
      END
      WID_LABEL_12 LABEL 5 32 0 0
      VALUE "Start Row"
      ALIGNLEFT
      END
      WID_LABEL_13 LABEL 5 7 0 0
      VALUE "SIDE-2 Parameters"
      ALIGNLEFT
      END
      TEXT_Average_0 TEXT 124 102 103 20
      NUMITEMS = 1
      ITEM ""
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_16 LABEL 4 104 0 0
      VALUE "Points for averaging"
      ALIGNLEFT
      END
    END
    BUTTON_ParamOK PUSHBUTTON 247 309 62 29
    VALUE "Apply"
    ALIGNCENTER
    ONACTIVATE "OnApplyParam"
    END
    BUTTON_ParamSave PUSHBUTTON 333 309 107 29
    VALUE "Apply and Save"
    ALIGNCENTER
    ONACTIVATE "OnSaveParam"
    END
    BUTTON_ParamExit PUSHBUTTON 588 309 59 29
    VALUE "Cancel"
    ALIGNCENTER
    ONACTIVATE "OnExitParam"
    END
    DROPLIST_mode DROPLIST 3 302 190 23
    CAPTION "Collection Mode"
    NUMITEMS = 2
    ITEM "Pinhole Mode"
    ITEM "Slit Mode"
    ONSELECT "OnSelectMode"
    END
    BASE_Planck BASE 477 28 175 132
    FRAME = 1
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "IDL"
    BEGIN
      WID_LABEL_17 LABEL 130 30 16 18
      VALUE "nm"
      ALIGNLEFT
      END
      WID_LABEL_18 LABEL 130 54 28 18
      VALUE "nm^2"
      ALIGNLEFT
      END
      WID_LABEL_19 LABEL 130 78 29 18
      VALUE "nm^3"
      ALIGNLEFT
      END
      WID_LABEL_20 LABEL 130 105 29 18
      VALUE "nm^4"
      ALIGNLEFT
      END
      WID_LABEL_21 LABEL 130 6 31 18
      VALUE "const."
      ALIGNLEFT
      END
      TEXT_st_0 TEXT 0 2 0 0
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_st_1 TEXT 0 27 0 0
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_st_2 TEXT 0 52 0 0
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_st_3 TEXT 0 78 0 0
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      TEXT_st_4 TEXT 0 104 0 0
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
    END
    WID_LABEL_14 LABEL 477 11 0 0
    VALUE "Standard Lamp Data"
    ALIGNLEFT
    END
    BUTTON_default PUSHBUTTON 459 309 109 29
    VALUE "Save as Default"
    ALIGNCENTER
    ONACTIVATE "OnDefault"
    END
    DROPLIST_epics DROPLIST 245 183 0 0
    CAPTION "EPICS"
    NUMITEMS = 2
    ITEM "No"
    ITEM "Yes"
    ONSELECT "OnEpics"
    END
    BASE_epics BASE 331 183 321 108
    FRAME = 1
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "IDL"
    BEGIN
      TEXT_downMT TEXT 128 79 188 22
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      LABEL_downMT LABEL 1 81 109 17
      VALUE "Downstream Measure"
      ALIGNLEFT
      END
      TEXT_downT TEXT 128 53 188 22
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      LABEL_downT LABEL 1 56 155 18
      VALUE "Downstream Temperature"
      ALIGNLEFT
      END
      TEXT_upMT TEXT 128 26 188 22
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      LABEL_UpMT LABEL 1 28 97 17
      VALUE "Upstream Measure"
      ALIGNLEFT
      END
      TEXT_upt TEXT 128 2 188 22
      GRAYED
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      LABEL_upT LABEL 1 4 110 17
      VALUE "Upstream Temperature"
      ALIGNLEFT
      END
    END
    WID_LABEL_2 LABEL 300 206 29 18
    VALUE "If Yes"
    ALIGNLEFT
    END
    WID_LABEL_24 LABEL 259 222 69 18
    VALUE "Set PV names"
    ALIGNLEFT
    END
    BUTTON_standchange PUSHBUTTON 581 5 53 21
    VALUE "Change..."
    ALIGNCENTER
    ONACTIVATE "OnStandChange"
    END
  END
  BaseDraw BASE 19 235 726 326
  XPAD = 3
  YPAD = 3
  SPACE = 3
  CAPTION "IDL"
  BEGIN
    DRAW_1 DRAW 371 2 351 317
    END
    DRAW_0 DRAW 1 2 351 317
    END
  END
  BUTTON_RunTParam PUSHBUTTON 19 153 174 31
  VALUE "Setup Parameters  ..."
  ALIGNCENTER
  ONACTIVATE "OnParamSetup"
  END
  TEXT_side TEXT 273 159 103 24
  WIDTH = 20
  HEIGHT = 1
  END
  TEXT_mode TEXT 196 159 75 24
  WIDTH = 20
  HEIGHT = 1
  END
  TEXT_emis TEXT 378 159 159 24
  WIDTH = 20
  HEIGHT = 1
  END
  LABEL_stand_0 LABEL 110 128 427 21
  VALUE "Display the second standard file"
  ALIGNLEFT
  GRAYED
  END
  WID_LABEL_22 LABEL 253 203 21 18
  VALUE "First"
  ALIGNLEFT
  END
  TEXT_firstfile TEXT 275 202 35 20
  GRAYED
  NUMITEMS = 1
  ITEM "1"
  EDITABLE
  WIDTH = 20
  HEIGHT = 1
  END
  WID_LABEL_23 LABEL 334 205 23 18
  VALUE "Last"
  ALIGNLEFT
  END
  TEXT_lastfile TEXT 357 201 37 20
  GRAYED
  NUMITEMS = 2
  ITEM "1"
  ITEM ""
  EDITABLE
  WIDTH = 20
  HEIGHT = 1
  END
  BUTTON_TimeT PUSHBUTTON 279 563 93 26
  VALUE "T vs Time"
  ALIGNCENTER
  GRAYED
  ONACTIVATE "OnTimeT"
  END
  BASE_dir BASE 89 267 571 132
  FRAME = 1
  UNMAP
  XPAD = 3
  YPAD = 3
  SPACE = 3
  CAPTION "IDL"
  BEGIN
    TEXT_SpecTpath TEXT 109 6 457 25
    NUMITEMS = 1
    ITEM "C:\IDL\SpecT"
    EDITABLE
    WIDTH = 20
    HEIGHT = 1
    END
    BUTTON_defDir PUSHBUTTON 10 5 96 27
    VALUE "SpecT Path"
    ALIGNCENTER
    ONACTIVATE "OnSpecTdir"
    END
    BUTTON_DataDir PUSHBUTTON 9 38 96 27
    VALUE "Data Path"
    ALIGNCENTER
    ONACTIVATE "OnDataDir"
    END
    BUTTON_StandDir PUSHBUTTON 10 70 96 27
    VALUE "Standard Path"
    ALIGNCENTER
    ONACTIVATE "OnStandDir"
    END
    TEXT_StandPath TEXT 109 71 457 25
    EDITABLE
    WIDTH = 20
    HEIGHT = 1
    END
    TEXT_DataPath TEXT 109 41 457 25
    EDITABLE
    WIDTH = 20
    HEIGHT = 1
    END
    BUTTON_OKDir PUSHBUTTON 191 101 171 24
    VALUE "OK"
    ALIGNCENTER
    ONACTIVATE "OnOKDir"
    END
    BUTTON_CancelDir PUSHBUTTON 379 101 171 24
    VALUE "Cancel"
    ALIGNCENTER
    ONACTIVATE "OnCancelDir"
    END
  END
  DROPLIST_Side1 DROPLIST 57 563 157 21
  CAPTION "Plot"
  NUMITEMS = 4
  ITEM "Planck Fit"
  ITEM "T Profile"
  ITEM "Spectra"
  ITEM "Intensity Profile"
  ONSELECT "OnSide1"
  END
  DROPLIST_Side2 DROPLIST 431 563 153 21
  CAPTION "Plot"
  NUMITEMS = 4
  ITEM "Spectra"
  ITEM "Intensity Profile"
  ITEM "Planck Fit"
  ITEM "T Profile"
  ONSELECT "OnSide2"
  END
  LABEL_Side1 LABEL 20 567 38 20
  VALUE "Side 1"
  ALIGNLEFT
  END
  LABEL_Side2 LABEL 392 568 38 18
  VALUE "Side 2"
  ALIGNLEFT
  END
  BASE_timer BASE 662 568 80 20
  UNMAP
  TIMEREVENT "OnTimer"
  XPAD = 3
  YPAD = 3
  SPACE = 3
  CAPTION "IDL"
  BEGIN
  END
  BUTTON_reset PUSHBUTTON 465 199 69 26
  VALUE "Reset EPICS"
  ALIGNCENTER
  ONACTIVATE "OnResetEpics"
  END
END

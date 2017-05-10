; 
; IDL Widget Interface Procedures. This Code is automatically 
;     generated and should not be modified.

; 
; Generated on:	09/06/2005 15:25.10
; 
pro Base_Main_event, Event

  wTarget = (widget_info(Event.id,/NAME) eq 'TREE' ?  $
      widget_info(Event.id, /tree_root) : event.id)


  wWidget =  Event.top

  case wTarget of

    Widget_Info(wWidget, FIND_BY_UNAME='W_MENU_1'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnMeasureT, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_LoadSpec'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnLoadSpec, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_LoadStand'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnLoadStand, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_CalcTsingle'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnCalcTSingle, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_CalcTMulti'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnCalcTMulti, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_Save'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnSaveT, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_SaveAs'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnSaveTAs, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_SavePlanck'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnSavePlanckAs, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_PrintTemperature'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnPrintT, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_PrintPlanckFit'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnPrintPlanck, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='W_MENU_Exit'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnExit, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_FileInformation'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnFileinfo, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_FitInfor'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnFittingInfo, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_PlotPlanckFit'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnPlotPlanck, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_PlotTProfile'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnPlotT, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_PlotRawData'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnPlotRaw, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_PlotIntProfile'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnPlotInt, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_RunTParam'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnRunTParam, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='W_MENU_0'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnLoadDefault, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_EPICSpv'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnEPICSpv, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_dir'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnDir, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_AboutRunT'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnAbout, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_ReadMe'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnReadMe, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='MENU_OnLineHelp'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnHelpOnLine, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='Button_RunT'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnRunT, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='DROPLIST_FileToDo'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSelectFile, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_CalT'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnCalcT_B, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_LoadStand'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnLoadStand_B, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_LoadFile'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnLoadFile_B, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='DROPLIST_CCDtime'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSelectCCDTime, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='DROPLIST_RunMode'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSelectRunMode, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='Emis_DROPLIST'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSelectEmis, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='RunT_DROPLIST'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSelectSide, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_ParamOK'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnApplyParam, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_ParamSave'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnSaveParam, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_ParamExit'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnExitParam, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='DROPLIST_mode'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSelectMode, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_default'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnDefault, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='DROPLIST_epics'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnEpics, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_standchange'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnStandChange, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_RunTParam'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnParamSetup, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_TimeT'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnTimeT, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_defDir'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnSpecTdir, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_DataDir'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnDataDir, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_StandDir'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnStandDir, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_OKDir'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnOKDir, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_CancelDir'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnCancelDir, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='DROPLIST_Side1'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSide1, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='DROPLIST_Side2'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_DROPLIST' )then $
        OnSide2, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BASE_timer'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_TIMER' )then $
        OnTimer, Event
    end
    Widget_Info(wWidget, FIND_BY_UNAME='BUTTON_reset'): begin
      if( Tag_Names(Event, /STRUCTURE_NAME) eq 'WIDGET_BUTTON' )then $
        OnResetEpics, Event
    end
    else:
  endcase

end

pro Base_Main, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_

  Resolve_Routine, 'SpecT_eventcb',/COMPILE_FULL_FILE  ; Load event callback routines
  
  Base_Main = Widget_Base( GROUP_LEADER=wGroup, UNAME='Base_Main'  $
      ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=758 ,SCR_YSIZE=642  $
      ,TITLE='SpecT v1.b' ,SPACE=3 ,XPAD=3 ,YPAD=3  $
      ,MBAR=WID_BASE_0_MBAR)

  
  w_menu_file = Widget_Button(WID_BASE_0_MBAR, UNAME='w_menu_file'  $
      ,/MENU ,VALUE='File')

  
  W_MENU_1 = Widget_Button(w_menu_file, UNAME='W_MENU_1'  $
      ,VALUE='Measure Temperature...')

  
  MENU_LoadSpec = Widget_Button(w_menu_file, UNAME='MENU_LoadSpec'  $
      ,/SEPARATOR ,VALUE='Load a Spectrum')

  
  MENU_LoadStand = Widget_Button(w_menu_file, UNAME='MENU_LoadStand'  $
      ,VALUE='Load a Standard')

  
  MENU_CalcT = Widget_Button(w_menu_file, UNAME='MENU_CalcT' ,/MENU  $
      ,/SEPARATOR ,VALUE='Temperature Calculation')

  
  MENU_CalcTsingle = Widget_Button(MENU_CalcT,  $
      UNAME='MENU_CalcTsingle' ,VALUE='Single File')

  
  MENU_CalcTMulti = Widget_Button(MENU_CalcT, UNAME='MENU_CalcTMulti'  $
      ,VALUE='Multi Files')

  
  MENU_Save = Widget_Button(w_menu_file, UNAME='MENU_Save'  $
      ,/SEPARATOR ,VALUE='Save Temperature')

  
  MENU_SaveAs = Widget_Button(w_menu_file, UNAME='MENU_SaveAs'  $
      ,VALUE='Save Temperature As...')

  
  MENU_SavePlanck = Widget_Button(w_menu_file,  $
      UNAME='MENU_SavePlanck' ,VALUE='Save PlanckData As...')

  
  W_MENU_Print = Widget_Button(w_menu_file, UNAME='W_MENU_Print'  $
      ,/MENU ,/SEPARATOR ,VALUE='Print')

  
  MENU_PrintTemperature = Widget_Button(W_MENU_Print,  $
      UNAME='MENU_PrintTemperature' ,VALUE='Temperature')

  
  MENU_PrintPlanckFit = Widget_Button(W_MENU_Print,  $
      UNAME='MENU_PrintPlanckFit' ,VALUE='Planck Fit')

  
  W_MENU_Exit = Widget_Button(w_menu_file, UNAME='W_MENU_Exit'  $
      ,/SEPARATOR ,VALUE='Exit')

  
  W_MENU_Edit = Widget_Button(WID_BASE_0_MBAR, UNAME='W_MENU_Edit'  $
      ,/MENU ,VALUE='Edit')

  
  MENU_Cut = Widget_Button(W_MENU_Edit, UNAME='MENU_Cut' ,SENSITIVE=0  $
      ,VALUE='Cut')

  
  MENU_Copy = Widget_Button(W_MENU_Edit, UNAME='MENU_Copy'  $
      ,SENSITIVE=0 ,VALUE='Copy')

  
  MENU_Paste = Widget_Button(W_MENU_Edit, UNAME='MENU_Paste'  $
      ,SENSITIVE=0 ,VALUE='Paste')

  
  W_MENU_14 = Widget_Button(WID_BASE_0_MBAR, UNAME='W_MENU_14' ,/MENU  $
      ,VALUE='Data')

  
  MENU_FileInformation = Widget_Button(W_MENU_14,  $
      UNAME='MENU_FileInformation' ,VALUE='File Information')

  
  MENU_FitInfor = Widget_Button(W_MENU_14, UNAME='MENU_FitInfor'  $
      ,VALUE='Fitting Information')

  
  MENU_PlotPlanckFit = Widget_Button(W_MENU_14,  $
      UNAME='MENU_PlotPlanckFit' ,/SEPARATOR ,VALUE='Plot Planck'+ $
      ' Fit')

  
  MENU_PlotTProfile = Widget_Button(W_MENU_14,  $
      UNAME='MENU_PlotTProfile' ,VALUE='Plot Temperature Profile')

  
  MENU_PlotRawData = Widget_Button(W_MENU_14,  $
      UNAME='MENU_PlotRawData' ,/SEPARATOR ,VALUE='Plot Raw Data')

  
  MENU_PlotIntProfile = Widget_Button(W_MENU_14,  $
      UNAME='MENU_PlotIntProfile' ,VALUE='Plot Intensity Profile')

  
  W_MENU_Pref = Widget_Button(WID_BASE_0_MBAR, UNAME='W_MENU_Pref'  $
      ,/MENU ,VALUE='Preferences')

  
  MENU_RunTParam = Widget_Button(W_MENU_Pref, UNAME='MENU_RunTParam'  $
      ,/SEPARATOR ,VALUE='Setup SpecT Parameters ...')

  
  W_MENU_0 = Widget_Button(W_MENU_Pref, UNAME='W_MENU_0' ,VALUE='Load'+ $
      ' Default Parameters...')

  
  MENU_EPICSpv = Widget_Button(W_MENU_Pref, UNAME='MENU_EPICSpv'  $
      ,/SEPARATOR ,VALUE='Setup EPICS PV names...')

  
  MENU_dir = Widget_Button(W_MENU_Pref, UNAME='MENU_dir' ,/SEPARATOR  $
      ,VALUE='Specify Directories')

  
  W_MENU_help = Widget_Button(WID_BASE_0_MBAR, UNAME='W_MENU_help'  $
      ,/MENU ,VALUE='Help')

  
  MENU_AboutRunT = Widget_Button(W_MENU_help, UNAME='MENU_AboutRunT'  $
      ,VALUE='About SpecT')

  
  MENU_ReadMe = Widget_Button(W_MENU_help, UNAME='MENU_ReadMe'  $
      ,/SEPARATOR ,VALUE='ReadMe')

  
  MENU_OnLineHelp = Widget_Button(W_MENU_help,  $
      UNAME='MENU_OnLineHelp' ,SENSITIVE=0 ,VALUE='Help On Line')

  
  TEXT_StandFile = Widget_Text(Base_Main, UNAME='TEXT_StandFile'  $
      ,XOFFSET=109 ,YOFFSET=104 ,SCR_XSIZE=429 ,SCR_YSIZE=23  $
      ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  TEXT_Display = Widget_Text(Base_Main, UNAME='TEXT_Display' ,FRAME=1  $
      ,XOFFSET=541 ,YOFFSET=20 ,SCR_XSIZE=203 ,SCR_YSIZE=203 ,/SCROLL  $
      ,/EDITABLE ,/WRAP ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  TEXT_File = Widget_Text(Base_Main, UNAME='TEXT_File' ,XOFFSET=96  $
      ,YOFFSET=76 ,SCR_XSIZE=442 ,SCR_YSIZE=23 ,/EDITABLE ,XSIZE=20  $
      ,YSIZE=1)

  
  Button_RunT = Widget_Button(Base_Main, UNAME='Button_RunT' ,FRAME=1  $
      ,XOFFSET=19 ,YOFFSET=19 ,SCR_XSIZE=363 ,SCR_YSIZE=49  $
      ,/ALIGN_CENTER ,/NO_RELEASE ,VALUE='Run_T ......')

  
  DROPLIST_FileToDo = Widget_Droplist(Base_Main,  $
      UNAME='DROPLIST_FileToDo' ,XOFFSET=133 ,YOFFSET=201  $
      ,SCR_XSIZE=108 ,SCR_YSIZE=21 ,VALUE=[ 'Single file', 'Multi'+ $
      ' files', '' ])

  
  BUTTON_CalT = Widget_Button(Base_Main, UNAME='BUTTON_CalT'  $
      ,XOFFSET=20 ,YOFFSET=201 ,SCR_XSIZE=108 ,SCR_YSIZE=23  $
      ,/ALIGN_CENTER ,VALUE='Calculate T')

  
  BUTTON_LoadStand = Widget_Button(Base_Main,  $
      UNAME='BUTTON_LoadStand' ,XOFFSET=20 ,YOFFSET=105 ,SCR_XSIZE=87  $
      ,SCR_YSIZE=23 ,/ALIGN_CENTER ,VALUE='Load a Standard')

  
  BUTTON_LoadFile = Widget_Button(Base_Main, UNAME='BUTTON_LoadFile'  $
      ,XOFFSET=20 ,YOFFSET=76 ,SCR_XSIZE=73 ,SCR_YSIZE=23  $
      ,/ALIGN_CENTER ,VALUE='Load a File')

  
  DROPLIST_CCDtime = Widget_Droplist(Base_Main,  $
      UNAME='DROPLIST_CCDtime' ,XOFFSET=384 ,YOFFSET=46  $
      ,SCR_XSIZE=101 ,SCR_YSIZE=24 ,TITLE='CCDTime' ,VALUE=[ '1.0',  $
      '0.02', '0.05', '0.1', '0.2', '0.5', '1.0', '2.0', '5.0',  $
      '10.0', '20.0', '30.0', '60.0', '120.0', '300.0' ])

  
  DROPLIST_RunMode = Widget_Droplist(Base_Main,  $
      UNAME='DROPLIST_RunMode' ,XOFFSET=417 ,YOFFSET=19 ,SCR_XSIZE=68  $
      ,SCR_YSIZE=27 ,VALUE=[ 'Passive', '1.0', '2.0', '3.0', '4.0',  $
      '5.0', '10.0', '15.0', '30.0', '60.0', '120.0', '300.0' ])

  
  WID_LABEL_0 = Widget_Label(Base_Main, UNAME='WID_LABEL_0'  $
      ,XOFFSET=485 ,YOFFSET=50 ,SCR_XSIZE=20 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='Sec')

  
  BaseParam = Widget_Base(Base_Main, UNAME='BaseParam' ,FRAME=1  $
      ,XOFFSET=22 ,YOFFSET=232 ,SCR_XSIZE=686 ,SCR_YSIZE=353 ,MAP=0  $
      ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  BaseEmis = Widget_Base(BaseParam, UNAME='BaseEmis' ,FRAME=1  $
      ,XOFFSET=4 ,YOFFSET=216 ,SCR_XSIZE=233 ,SCR_YSIZE=67  $
      ,/ALIGN_RIGHT ,TITLE='IDL' ,SPACE=5 ,XPAD=3 ,YPAD=3)

  
  Emis1_TEXT = Widget_Text(BaseEmis, UNAME='Emis1_TEXT' ,XOFFSET=124  $
      ,YOFFSET=24 ,SCR_XSIZE=103 ,SCR_YSIZE=20 ,/EDITABLE ,VALUE=[ ''  $
      ] ,XSIZE=20 ,YSIZE=1)

  
  Emis_CenterText = Widget_Text(BaseEmis, UNAME='Emis_CenterText'  $
      ,XOFFSET=125 ,YOFFSET=1 ,SCR_XSIZE=103 ,SCR_YSIZE=20 ,VALUE=[  $
      '750' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_1 = Widget_Label(BaseEmis, UNAME='WID_LABEL_1' ,XOFFSET=1  $
      ,YOFFSET=5 ,/ALIGN_LEFT ,VALUE='Central Wavelength (nm)')

  
  WID_LABEL_3 = Widget_Label(BaseEmis, UNAME='WID_LABEL_3' ,XOFFSET=2  $
      ,YOFFSET=27 ,/ALIGN_LEFT ,VALUE='Emis1')

  
  WID_LABEL_4 = Widget_Label(BaseEmis, UNAME='WID_LABEL_4'  $
      ,XOFFSET=21 ,YOFFSET=50 ,/ALIGN_LEFT  $
      ,VALUE='Emis=Emis0*[1+Emis1*(Lambda-750)]')

  
  Emis_DROPLIST = Widget_Droplist(BaseParam, UNAME='Emis_DROPLIST'  $
      ,XOFFSET=3 ,YOFFSET=193 ,SCR_XSIZE=202 ,SCR_YSIZE=23  $
      ,TITLE='Emissivity' ,VALUE=[ 'Wavelength Independent',  $
      'Wavelength Dependent' ])

  
  BaseRunTParam = Widget_Base(BaseParam, UNAME='BaseRunTParam'  $
      ,FRAME=1 ,XOFFSET=4 ,YOFFSET=28 ,SCR_XSIZE=232 ,SCR_YSIZE=154  $
      ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  TEXT_StartWav = Widget_Text(BaseRunTParam, UNAME='TEXT_StartWav'  $
      ,XOFFSET=122 ,YOFFSET=3 ,SCR_XSIZE=103 ,SCR_YSIZE=20 ,/EDITABLE  $
      ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  TEXT_EndWav = Widget_Text(BaseRunTParam, UNAME='TEXT_EndWav'  $
      ,XOFFSET=122 ,YOFFSET=29 ,SCR_XSIZE=103 ,SCR_YSIZE=20  $
      ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  TEXT_Bin = Widget_Text(BaseRunTParam, UNAME='TEXT_Bin' ,XOFFSET=122  $
      ,YOFFSET=102 ,SCR_XSIZE=103 ,SCR_YSIZE=20 ,/EDITABLE ,VALUE=[  $
      '' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_5 = Widget_Label(BaseRunTParam, UNAME='WID_LABEL_5'  $
      ,XOFFSET=3 ,YOFFSET=105 ,/ALIGN_LEFT ,VALUE='Binning')

  
  WID_LABEL_7 = Widget_Label(BaseRunTParam, UNAME='WID_LABEL_7'  $
      ,XOFFSET=3 ,YOFFSET=7 ,/ALIGN_LEFT ,VALUE='Start Wavelength'+ $
      ' (nm)')

  
  WID_LABEL_8 = Widget_Label(BaseRunTParam, UNAME='WID_LABEL_8'  $
      ,XOFFSET=4 ,YOFFSET=31 ,/ALIGN_LEFT ,VALUE='End Wavelength'+ $
      ' (nm)')

  
  TEXT_StartRow = Widget_Text(BaseRunTParam, UNAME='TEXT_StartRow'  $
      ,XOFFSET=122 ,YOFFSET=53 ,SCR_XSIZE=103 ,SCR_YSIZE=21  $
      ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  TEXT_NumRow = Widget_Text(BaseRunTParam, UNAME='TEXT_NumRow'  $
      ,XOFFSET=122 ,YOFFSET=78 ,SCR_XSIZE=103 ,SCR_YSIZE=21  $
      ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_6 = Widget_Label(BaseRunTParam, UNAME='WID_LABEL_6'  $
      ,XOFFSET=3 ,YOFFSET=59 ,/ALIGN_LEFT ,VALUE='Start Row')

  
  WID_LABEL_9 = Widget_Label(BaseRunTParam, UNAME='WID_LABEL_9'  $
      ,XOFFSET=3 ,YOFFSET=81 ,SCR_XSIZE=88 ,SCR_YSIZE=18 ,/ALIGN_LEFT  $
      ,VALUE='Number of Rows')

  
  TEXT_Average = Widget_Text(BaseRunTParam, UNAME='TEXT_Average'  $
      ,XOFFSET=122 ,YOFFSET=129 ,SCR_XSIZE=103 ,SCR_YSIZE=20  $
      ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_15 = Widget_Label(BaseRunTParam, UNAME='WID_LABEL_15'  $
      ,XOFFSET=3 ,YOFFSET=130 ,/ALIGN_LEFT ,VALUE='Points for'+ $
      ' averaging')

  
  RunT_DROPLIST = Widget_Droplist(BaseParam, UNAME='RunT_DROPLIST'  $
      ,XOFFSET=5 ,YOFFSET=4 ,SCR_XSIZE=183 ,SCR_YSIZE=22  $
      ,TITLE='Detector Side' ,VALUE=[ 'Single', 'Both', 'Upstream',  $
      'Downstream' ])

  
  BaseRunTParamBoth = Widget_Base(BaseParam,  $
      UNAME='BaseRunTParamBoth' ,FRAME=1 ,XOFFSET=241 ,YOFFSET=28  $
      ,SCR_XSIZE=232 ,SCR_YSIZE=132 ,TITLE='IDL' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)

  
  TEXT_StartRow_0 = Widget_Text(BaseRunTParamBoth,  $
      UNAME='TEXT_StartRow_0' ,XOFFSET=124 ,YOFFSET=26 ,SCR_XSIZE=103  $
      ,SCR_YSIZE=21 ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  TEXT_NumRow_0 = Widget_Text(BaseRunTParamBoth,  $
      UNAME='TEXT_NumRow_0' ,XOFFSET=124 ,YOFFSET=50 ,SCR_XSIZE=103  $
      ,SCR_YSIZE=21 ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  TEXT_Bin_0 = Widget_Text(BaseRunTParamBoth, UNAME='TEXT_Bin_0'  $
      ,XOFFSET=124 ,YOFFSET=75 ,SCR_XSIZE=103 ,SCR_YSIZE=20  $
      ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_10 = Widget_Label(BaseRunTParamBoth, UNAME='WID_LABEL_10'  $
      ,XOFFSET=5 ,YOFFSET=78 ,/ALIGN_LEFT ,VALUE='Binning')

  
  WID_LABEL_11 = Widget_Label(BaseRunTParamBoth, UNAME='WID_LABEL_11'  $
      ,XOFFSET=5 ,YOFFSET=54 ,SCR_XSIZE=88 ,SCR_YSIZE=18 ,/ALIGN_LEFT  $
      ,VALUE='Number of Rows')

  
  WID_LABEL_12 = Widget_Label(BaseRunTParamBoth, UNAME='WID_LABEL_12'  $
      ,XOFFSET=5 ,YOFFSET=32 ,/ALIGN_LEFT ,VALUE='Start Row')

  
  WID_LABEL_13 = Widget_Label(BaseRunTParamBoth, UNAME='WID_LABEL_13'  $
      ,XOFFSET=5 ,YOFFSET=7 ,/ALIGN_LEFT ,VALUE='SIDE-2 Parameters')

  
  TEXT_Average_0 = Widget_Text(BaseRunTParamBoth,  $
      UNAME='TEXT_Average_0' ,XOFFSET=124 ,YOFFSET=102 ,SCR_XSIZE=103  $
      ,SCR_YSIZE=20 ,/EDITABLE ,VALUE=[ '' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_16 = Widget_Label(BaseRunTParamBoth, UNAME='WID_LABEL_16'  $
      ,XOFFSET=4 ,YOFFSET=104 ,/ALIGN_LEFT ,VALUE='Points for'+ $
      ' averaging')

  
  BUTTON_ParamOK = Widget_Button(BaseParam, UNAME='BUTTON_ParamOK'  $
      ,XOFFSET=247 ,YOFFSET=309 ,SCR_XSIZE=62 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Apply')

  
  BUTTON_ParamSave = Widget_Button(BaseParam,  $
      UNAME='BUTTON_ParamSave' ,XOFFSET=333 ,YOFFSET=309  $
      ,SCR_XSIZE=107 ,SCR_YSIZE=29 ,/ALIGN_CENTER ,VALUE='Apply and'+ $
      ' Save')

  
  BUTTON_ParamExit = Widget_Button(BaseParam,  $
      UNAME='BUTTON_ParamExit' ,XOFFSET=588 ,YOFFSET=309  $
      ,SCR_XSIZE=59 ,SCR_YSIZE=29 ,/ALIGN_CENTER ,VALUE='Cancel')

  
  DROPLIST_mode = Widget_Droplist(BaseParam, UNAME='DROPLIST_mode'  $
      ,XOFFSET=3 ,YOFFSET=302 ,SCR_XSIZE=190 ,SCR_YSIZE=23  $
      ,TITLE='Collection Mode' ,VALUE=[ 'Pinhole Mode', 'Slit Mode'  $
      ])

  
  BASE_Planck = Widget_Base(BaseParam, UNAME='BASE_Planck' ,FRAME=1  $
      ,XOFFSET=477 ,YOFFSET=28 ,SCR_XSIZE=175 ,SCR_YSIZE=132  $
      ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  WID_LABEL_17 = Widget_Label(BASE_Planck, UNAME='WID_LABEL_17'  $
      ,XOFFSET=130 ,YOFFSET=30 ,SCR_XSIZE=16 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='nm')

  
  WID_LABEL_18 = Widget_Label(BASE_Planck, UNAME='WID_LABEL_18'  $
      ,XOFFSET=130 ,YOFFSET=54 ,SCR_XSIZE=28 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='nm^2')

  
  WID_LABEL_19 = Widget_Label(BASE_Planck, UNAME='WID_LABEL_19'  $
      ,XOFFSET=130 ,YOFFSET=78 ,SCR_XSIZE=29 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='nm^3')

  
  WID_LABEL_20 = Widget_Label(BASE_Planck, UNAME='WID_LABEL_20'  $
      ,XOFFSET=130 ,YOFFSET=105 ,SCR_XSIZE=29 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='nm^4')

  
  WID_LABEL_21 = Widget_Label(BASE_Planck, UNAME='WID_LABEL_21'  $
      ,XOFFSET=130 ,YOFFSET=6 ,SCR_XSIZE=31 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='const.')

  
  TEXT_st_0 = Widget_Text(BASE_Planck, UNAME='TEXT_st_0' ,YOFFSET=2  $
      ,SENSITIVE=0 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  TEXT_st_1 = Widget_Text(BASE_Planck, UNAME='TEXT_st_1' ,YOFFSET=27  $
      ,SENSITIVE=0 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  TEXT_st_2 = Widget_Text(BASE_Planck, UNAME='TEXT_st_2' ,YOFFSET=52  $
      ,SENSITIVE=0 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  TEXT_st_3 = Widget_Text(BASE_Planck, UNAME='TEXT_st_3' ,YOFFSET=78  $
      ,SENSITIVE=0 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  TEXT_st_4 = Widget_Text(BASE_Planck, UNAME='TEXT_st_4' ,YOFFSET=104  $
      ,SENSITIVE=0 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_14 = Widget_Label(BaseParam, UNAME='WID_LABEL_14'  $
      ,XOFFSET=477 ,YOFFSET=11 ,/ALIGN_LEFT ,VALUE='Standard Lamp'+ $
      ' Data')

  
  BUTTON_default = Widget_Button(BaseParam, UNAME='BUTTON_default'  $
      ,XOFFSET=459 ,YOFFSET=309 ,SCR_XSIZE=109 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Save as Default')

  
  DROPLIST_epics = Widget_Droplist(BaseParam, UNAME='DROPLIST_epics'  $
      ,XOFFSET=245 ,YOFFSET=183 ,TITLE='EPICS' ,VALUE=[ 'No', 'Yes'  $
      ])

  
  BASE_epics = Widget_Base(BaseParam, UNAME='BASE_epics' ,FRAME=1  $
      ,XOFFSET=331 ,YOFFSET=183 ,SCR_XSIZE=321 ,SCR_YSIZE=108  $
      ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  TEXT_downMT = Widget_Text(BASE_epics, UNAME='TEXT_downMT'  $
      ,XOFFSET=128 ,YOFFSET=79 ,SCR_XSIZE=188 ,SCR_YSIZE=22  $
      ,SENSITIVE=0 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  LABEL_downMT = Widget_Label(BASE_epics, UNAME='LABEL_downMT'  $
      ,XOFFSET=1 ,YOFFSET=81 ,SCR_XSIZE=109 ,SCR_YSIZE=17  $
      ,/ALIGN_LEFT ,VALUE='Downstream Measure')

  
  TEXT_downT = Widget_Text(BASE_epics, UNAME='TEXT_downT'  $
      ,XOFFSET=128 ,YOFFSET=53 ,SCR_XSIZE=188 ,SCR_YSIZE=22  $
      ,SENSITIVE=0 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  LABEL_downT = Widget_Label(BASE_epics, UNAME='LABEL_downT'  $
      ,XOFFSET=1 ,YOFFSET=56 ,SCR_XSIZE=155 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='Downstream Temperature')

  
  TEXT_upMT = Widget_Text(BASE_epics, UNAME='TEXT_upMT' ,XOFFSET=128  $
      ,YOFFSET=26 ,SCR_XSIZE=188 ,SCR_YSIZE=22 ,SENSITIVE=0  $
      ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  LABEL_UpMT = Widget_Label(BASE_epics, UNAME='LABEL_UpMT' ,XOFFSET=1  $
      ,YOFFSET=28 ,SCR_XSIZE=97 ,SCR_YSIZE=17 ,/ALIGN_LEFT  $
      ,VALUE='Upstream Measure')

  
  TEXT_upt = Widget_Text(BASE_epics, UNAME='TEXT_upt' ,XOFFSET=128  $
      ,YOFFSET=2 ,SCR_XSIZE=188 ,SCR_YSIZE=22 ,SENSITIVE=0 ,/EDITABLE  $
      ,XSIZE=20 ,YSIZE=1)

  
  LABEL_upT = Widget_Label(BASE_epics, UNAME='LABEL_upT' ,XOFFSET=1  $
      ,YOFFSET=4 ,SCR_XSIZE=110 ,SCR_YSIZE=17 ,/ALIGN_LEFT  $
      ,VALUE='Upstream Temperature')

  
  WID_LABEL_2 = Widget_Label(BaseParam, UNAME='WID_LABEL_2'  $
      ,XOFFSET=300 ,YOFFSET=206 ,SCR_XSIZE=29 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='If Yes')

  
  WID_LABEL_24 = Widget_Label(BaseParam, UNAME='WID_LABEL_24'  $
      ,XOFFSET=259 ,YOFFSET=222 ,SCR_XSIZE=69 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='Set PV names')

  
  BUTTON_standchange = Widget_Button(BaseParam,  $
      UNAME='BUTTON_standchange' ,XOFFSET=581 ,YOFFSET=5  $
      ,SCR_XSIZE=53 ,SCR_YSIZE=21 ,/ALIGN_CENTER ,VALUE='Change...')

  
  BaseDraw = Widget_Base(Base_Main, UNAME='BaseDraw' ,XOFFSET=19  $
      ,YOFFSET=235 ,SCR_XSIZE=726 ,SCR_YSIZE=326 ,TITLE='IDL'  $
      ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  DRAW_1 = Widget_Draw(BaseDraw, UNAME='DRAW_1' ,XOFFSET=371  $
      ,YOFFSET=2 ,SCR_XSIZE=351 ,SCR_YSIZE=317)

  
  DRAW_0 = Widget_Draw(BaseDraw, UNAME='DRAW_0' ,XOFFSET=1 ,YOFFSET=2  $
      ,SCR_XSIZE=351 ,SCR_YSIZE=317)

  
  BUTTON_RunTParam = Widget_Button(Base_Main,  $
      UNAME='BUTTON_RunTParam' ,XOFFSET=19 ,YOFFSET=153  $
      ,SCR_XSIZE=174 ,SCR_YSIZE=31 ,/ALIGN_CENTER ,VALUE='Setup'+ $
      ' Parameters  ...')

  
  TEXT_side = Widget_Text(Base_Main, UNAME='TEXT_side' ,XOFFSET=273  $
      ,YOFFSET=159 ,SCR_XSIZE=103 ,SCR_YSIZE=24 ,XSIZE=20 ,YSIZE=1)

  
  TEXT_mode = Widget_Text(Base_Main, UNAME='TEXT_mode' ,XOFFSET=196  $
      ,YOFFSET=159 ,SCR_XSIZE=75 ,SCR_YSIZE=24 ,XSIZE=20 ,YSIZE=1)

  
  TEXT_emis = Widget_Text(Base_Main, UNAME='TEXT_emis' ,XOFFSET=378  $
      ,YOFFSET=159 ,SCR_XSIZE=159 ,SCR_YSIZE=24 ,XSIZE=20 ,YSIZE=1)

  
  LABEL_stand_0 = Widget_Label(Base_Main, UNAME='LABEL_stand_0'  $
      ,XOFFSET=110 ,YOFFSET=128 ,SCR_XSIZE=427 ,SCR_YSIZE=21  $
      ,SENSITIVE=0 ,/ALIGN_LEFT ,VALUE='Display the second standard'+ $
      ' file')

  
  WID_LABEL_22 = Widget_Label(Base_Main, UNAME='WID_LABEL_22'  $
      ,XOFFSET=253 ,YOFFSET=203 ,SCR_XSIZE=21 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='First')

  
  TEXT_firstfile = Widget_Text(Base_Main, UNAME='TEXT_firstfile'  $
      ,XOFFSET=275 ,YOFFSET=202 ,SCR_XSIZE=35 ,SCR_YSIZE=20  $
      ,SENSITIVE=0 ,/EDITABLE ,VALUE=[ '1' ] ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_23 = Widget_Label(Base_Main, UNAME='WID_LABEL_23'  $
      ,XOFFSET=334 ,YOFFSET=205 ,SCR_XSIZE=23 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='Last')

  
  TEXT_lastfile = Widget_Text(Base_Main, UNAME='TEXT_lastfile'  $
      ,XOFFSET=357 ,YOFFSET=201 ,SCR_XSIZE=37 ,SCR_YSIZE=20  $
      ,SENSITIVE=0 ,/EDITABLE ,VALUE=[ '1', '' ] ,XSIZE=20 ,YSIZE=1)

  
  BUTTON_TimeT = Widget_Button(Base_Main, UNAME='BUTTON_TimeT'  $
      ,XOFFSET=279 ,YOFFSET=563 ,SCR_XSIZE=93 ,SCR_YSIZE=26  $
      ,SENSITIVE=0 ,/ALIGN_CENTER ,VALUE='T vs Time')

  
  BASE_dir = Widget_Base(Base_Main, UNAME='BASE_dir' ,FRAME=1  $
      ,XOFFSET=89 ,YOFFSET=267 ,SCR_XSIZE=571 ,SCR_YSIZE=132 ,MAP=0  $
      ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  TEXT_SpecTpath = Widget_Text(BASE_dir, UNAME='TEXT_SpecTpath'  $
      ,XOFFSET=109 ,YOFFSET=6 ,SCR_XSIZE=457 ,SCR_YSIZE=25 ,/EDITABLE  $
      ,VALUE=[ 'C:\IDL\SpecT' ] ,XSIZE=20 ,YSIZE=1)

  
  BUTTON_defDir = Widget_Button(BASE_dir, UNAME='BUTTON_defDir'  $
      ,XOFFSET=10 ,YOFFSET=5 ,SCR_XSIZE=96 ,SCR_YSIZE=27  $
      ,/ALIGN_CENTER ,VALUE='SpecT Path')

  
  BUTTON_DataDir = Widget_Button(BASE_dir, UNAME='BUTTON_DataDir'  $
      ,XOFFSET=9 ,YOFFSET=38 ,SCR_XSIZE=96 ,SCR_YSIZE=27  $
      ,/ALIGN_CENTER ,VALUE='Data Path')

  
  BUTTON_StandDir = Widget_Button(BASE_dir, UNAME='BUTTON_StandDir'  $
      ,XOFFSET=10 ,YOFFSET=70 ,SCR_XSIZE=96 ,SCR_YSIZE=27  $
      ,/ALIGN_CENTER ,VALUE='Standard Path')

  
  TEXT_StandPath = Widget_Text(BASE_dir, UNAME='TEXT_StandPath'  $
      ,XOFFSET=109 ,YOFFSET=71 ,SCR_XSIZE=457 ,SCR_YSIZE=25  $
      ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  TEXT_DataPath = Widget_Text(BASE_dir, UNAME='TEXT_DataPath'  $
      ,XOFFSET=109 ,YOFFSET=41 ,SCR_XSIZE=457 ,SCR_YSIZE=25  $
      ,/EDITABLE ,XSIZE=20 ,YSIZE=1)

  
  BUTTON_OKDir = Widget_Button(BASE_dir, UNAME='BUTTON_OKDir'  $
      ,XOFFSET=191 ,YOFFSET=101 ,SCR_XSIZE=171 ,SCR_YSIZE=24  $
      ,/ALIGN_CENTER ,VALUE='OK')

  
  BUTTON_CancelDir = Widget_Button(BASE_dir, UNAME='BUTTON_CancelDir'  $
      ,XOFFSET=379 ,YOFFSET=101 ,SCR_XSIZE=171 ,SCR_YSIZE=24  $
      ,/ALIGN_CENTER ,VALUE='Cancel')

  
  DROPLIST_Side1 = Widget_Droplist(Base_Main, UNAME='DROPLIST_Side1'  $
      ,XOFFSET=57 ,YOFFSET=563 ,SCR_XSIZE=157 ,SCR_YSIZE=21  $
      ,TITLE='Plot' ,VALUE=[ 'Planck Fit', 'T Profile', 'Spectra',  $
      'Intensity Profile' ])

  
  DROPLIST_Side2 = Widget_Droplist(Base_Main, UNAME='DROPLIST_Side2'  $
      ,XOFFSET=431 ,YOFFSET=563 ,SCR_XSIZE=153 ,SCR_YSIZE=21  $
      ,TITLE='Plot' ,VALUE=[ 'Spectra', 'Intensity Profile', 'Planck'+ $
      ' Fit', 'T Profile' ])

  
  LABEL_Side1 = Widget_Label(Base_Main, UNAME='LABEL_Side1'  $
      ,XOFFSET=20 ,YOFFSET=567 ,SCR_XSIZE=38 ,SCR_YSIZE=20  $
      ,/ALIGN_LEFT ,VALUE='Side 1')

  
  LABEL_Side2 = Widget_Label(Base_Main, UNAME='LABEL_Side2'  $
      ,XOFFSET=392 ,YOFFSET=568 ,SCR_XSIZE=38 ,SCR_YSIZE=18  $
      ,/ALIGN_LEFT ,VALUE='Side 2')

  
  BASE_timer = Widget_Base(Base_Main, UNAME='BASE_timer' ,XOFFSET=662  $
      ,YOFFSET=568 ,SCR_XSIZE=80 ,SCR_YSIZE=20 ,MAP=0 ,TITLE='IDL'  $
      ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  BUTTON_reset = Widget_Button(Base_Main, UNAME='BUTTON_reset'  $
      ,XOFFSET=465 ,YOFFSET=199 ,SCR_XSIZE=69 ,SCR_YSIZE=26  $
      ,/ALIGN_CENTER ,VALUE='Reset EPICS')

  Widget_Control, /REALIZE, Base_Main

  XManager, 'Base_Main', Base_Main, /NO_BLOCK  

end
; 
; Empty stub procedure used for autoloading.
; 
pro SpecT, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
  Base_Main, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
end

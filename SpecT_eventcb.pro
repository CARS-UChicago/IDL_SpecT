;
; IDL Event Callback Procedures
; SpectroTv1_eventcb
;
; Generated on: 02/18/2004 14:15.14
; SpecT-v1.1    1/26/2005
; Place the function "read_file" in the beginning.
; Only "Planck" fitting is performed. No more "Wien" fitting.


function read_file, file, str=str
    if n_elements(str) eq 0 then str=0

    common defaultdir, defdir
    cd, defdir

    if n_elements(file) eq 0 then file=dialog_pickfile()

    openr, lun, file, /get_lun
    i=0
    if str ne 0 then x1=''
    while eof(lun) ne 1 do begin
       readf, lun, x1
       i=i+1
    endwhile
    free_lun, lun
    print, i, '      ', file
    if str eq 0 then data=fltarr(i)
    if str ne 0 then data=strarr(i)
    openr, lun, file, /get_lun
    j=0
    while eof(lun) ne 1 do begin
       readf, lun, x1
       data(j)=x1
       j=j+1
    endwhile
    ;x=fltarr(i)
    ;y=fltarr(i)
    ;z=fltarr(i)
    ;transread, lun, x, count=count
    ;print, count
    free_lun, lun
    ;print, fileout
    return, data
end

pro OnRunTParam, pfile=pfile, epicsfile=epicsfile, reload=reload, Event
    COMMON defaultdir

    ;Specify the directory
    idTEXT_SpecTPath=Widget_Info(Event.top,find_by_uname='TEXT_SpecTpath')
    idTEXT_DataPath=Widget_Info(Event.top,find_by_uname='TEXT_DataPath')
    idTEXT_StandPath=Widget_Info(Event.top,find_by_uname='TEXT_StandPath')
    widget_control, idTEXT_SpecTPath, get_value=spectdir
    spectdir=string(spectdir)

    if n_elements(pfile) eq 0 then pfile='RunTParam.TXT'

    ;print, 'tttttttttttttttttttttttttttttttttt', spectdir
    print, pfile
;    defdir='p:\IDL\temperature\spect-v1b'
    defdir='c:\IDL\spect'
    ; cd, defdir
    ;cd, CURRENT=defdir
    print, spectdir
    if spectdir ne '' then begin
        ;OnDir, event

        pathtest=file_test(filepath(pfile, root_dir=spectdir))
        if pathtest eq 0 then begin
           if pfile eq 'RunTParam.txt' then begin
                ttt=dialog_message('Invalid SpecT directory: Browse and load a file named RUNTPARAM.TXT', /information)
                pfile=dialog_pickfile(/read, filter=['*.txt'])
                defdir=strmid(pfile, 0, strpos(pfile,'\',/reverse_search))
            endif else begin
                ttt=dialog_message('Invalid SpecT directory: Browse and load a file named RUNTPARAM.INI', /information)
                pfile=dialog_pickfile(/read, filter=['*.ini'])
                defdir=strmid(pfile, 0, strpos(pfile,'\',/reverse_search))
            endelse
        endif else begin
           defdir=spectdir
        endelse
    endif else begin

        pathtest=file_test(filepath(pfile, root_dir=defdir))
        if pathtest eq 0 then begin
           if pfile eq 'RunTParam.txt' then begin
                ttt=dialog_message('Invalid SpecT directory: Browse and load a file named RUNTPARAM.TXT', /information)
                pfile=dialog_pickfile(/read, filter=['*.txt'])
                defdir=strmid(pfile, 0, strpos(pfile,'\',/reverse_search))
            endif else begin
                ttt=dialog_message('Invalid SpecT directory: Browse and load a file named RUNTPARAM.INI', /information)
                pfile=dialog_pickfile(/read, filter=['*.ini'])
                defdir=strmid(pfile, 0, strpos(pfile,'\',/reverse_search))
            endelse
        endif
    endelse

    cd, defdir


    if n_elements(epicsfile) eq 0 then epicsfile='epicsParam.txt'
    ;print, pfile


    if n_elements(reload) eq 0 then reload=0
    ;Display parameter window
    idBaseParam=Widget_Info(Event.top,find_by_uname='BaseParam')
    Widget_Control, idBaseParam, MAP=1

    ;Turn off the display of IDL-draw windows
    idBaseDraw=Widget_Info(Event.top,find_by_uname='BaseDraw')
    Widget_Control, idBaseDraw, MAP=0


    ;Get ID for all parameters
    idTEXT_StartWav=Widget_Info(Event.top,find_by_uname='TEXT_StartWav')
    idTEXT_EndWav=Widget_Info(Event.top,find_by_uname='TEXT_EndWav')
    idTEXT_StartRow=Widget_Info(Event.top,find_by_uname='TEXT_StartRow')
    idTEXT_NumRow=Widget_Info(Event.top,find_by_uname='TEXT_NumRow')
    idTEXT_Bin=Widget_Info(Event.top,find_by_uname='TEXT_Bin')
    idTEXT_Average=Widget_Info(Event.top,find_by_uname='TEXT_Average')
    idTEXT_StartRow_0=Widget_Info(Event.top,find_by_uname='TEXT_StartRow_0')
    idTEXT_NumRow_0=Widget_Info(Event.top,find_by_uname='TEXT_NumRow_0')
    idTEXT_Bin_0=Widget_Info(Event.top,find_by_uname='TEXT_Bin_0')
    idTEXT_Average_0=Widget_Info(Event.top,find_by_uname='TEXT_Average_0')
    idTEXT_Emis1=Widget_Info(Event.top,find_by_uname='Emis1_TEXT')
    idDROPLIST_RunT=Widget_Info(Event.top,find_by_uname='RunT_DROPLIST')
    idDROPLIST_Emis=Widget_Info(Event.top,find_by_uname='Emis_DROPLIST')
    idDROPLIST_Mode=Widget_Info(Event.top,find_by_uname='DROPLIST_mode')
    idBaseRunTParamBoth=Widget_Info(Event.top,find_by_uname='BaseRunTParamBoth')
    idBaseEmis=Widget_Info(Event.top,find_by_uname='BaseEmis')
    idTEXT_st_0=Widget_Info(Event.top,find_by_uname='TEXT_st_0')
    idTEXT_st_1=Widget_Info(Event.top,find_by_uname='TEXT_st_1')
    idTEXT_st_2=Widget_Info(Event.top,find_by_uname='TEXT_st_2')
    idTEXT_st_3=Widget_Info(Event.top,find_by_uname='TEXT_st_3')
    idTEXT_st_4=Widget_Info(Event.top,find_by_uname='TEXT_st_4')

    idTEXT_upt=Widget_Info(Event.top,find_by_uname='TEXT_upt')
    idTEXT_upMT=Widget_Info(Event.top,find_by_uname='TEXT_upMT')
    idTEXT_downT=Widget_Info(Event.top,find_by_uname='TEXT_downT')
    idTEXT_downMT=Widget_Info(Event.top,find_by_uname='TEXT_downMT')
    idDROPLIST_epics=Widget_Info(Event.top,find_by_uname='DROPLIST_epics')
    idTEXT_display=Widget_Info(Event.top,find_by_uname='TEXT_Display')


    ;Assign values to all parameters
    if reload eq 0 then begin
        Widget_Control, idTEXT_StartWav, get_Value=startwav
    endif else begin
        startwav=0
    endelse

    IF startwav eq 0 then begin
            Param=read_file(pfile)
            epicsParam=read_file(epicsfile,str=1)
            ;Param=read_file('RunTParam.txt')
           ;print, Param

    ;Get ID for all parameters


    ;Assign values to all parameters

        Widget_Control, idTEXT_StartWav, Set_Value=strtrim(String(Param(0), format='(f4.0)'),1)
        Widget_Control, idTEXT_EndWav, Set_Value=strtrim(String(Param(1), format='(f4.0)'),1)
        Widget_Control, idTEXT_StartRow, Set_Value=strtrim(String(Param(2), format='(I3)'),1)
        Widget_Control, idTEXT_NumRow, Set_Value=strtrim(String(Param(3), format='(I3)'),1)
        Widget_Control, idTEXT_Bin, Set_Value=strtrim(String(Param(4), format='(I2)'),1)
        Widget_Control, idTEXT_Average, Set_Value=strtrim(String(Param(5), format='(I2)'),1)
        Widget_Control, idTEXT_StartRow_0, Set_Value=strtrim(String(Param(6), format='(I3)'),1)
        Widget_Control, idTEXT_NumRow_0, Set_Value=strtrim(String(Param(7), format='(I3)'),1)
        Widget_Control, idTEXT_Bin_0, Set_Value=strtrim(String(Param(8), format='(I2)'),1)
        Widget_Control, idTEXT_Average_0, Set_Value=strtrim(String(Param(9), format='(I2)'),1)
        Widget_Control, idTEXT_Emis1, Set_Value=strtrim(String(Param(10), format='(f15.10)'),1)
        Widget_Control, idTEXT_st_0, Set_Value=strtrim(String(Param(14), format='(f9.5)'),1)
        Widget_Control, idTEXT_st_1, Set_Value=strtrim(String(Param(15), format='(f9.5)'),1)
        Widget_Control, idTEXT_st_2, Set_Value=strtrim(String(Param(16), format='(e13.5)'),1)
        ;print, param(16)
        ;print, string(Param(16), format='(e15.8)')
        Widget_Control, idTEXT_st_3, Set_Value=(String(Param(17), format='(e13.5)'))
        Widget_Control, idTEXT_st_4, Set_Value=strtrim(String(Param(18), format='(e13.5)'))

        widget_control, idDROPLIST_RunT, get_value=set_side
        widget_control, idDROPLIST_Emis, get_value=set_emis
        widget_control, idDROPLIST_Mode, get_value=set_mode
        widget_control, idDROPLIST_epics, get_value=set_epics

        if (param(11) eq 2) then begin
            Widget_Control, idBaseRunTParamBoth, SENSITIVE=1
            set_side(0)='Both'
            set_side(1)='Single'
            set_side(2)='Upstream'
            set_side(3)='Downstream'

        endif else begin

            Widget_Control, idBaseRunTParamBoth, SENSITIVE=0
            if param(11) eq 3 then begin
                set_side(0)='Upstream'
                set_side(1)='Single'
                set_side(2)='Both'
                set_side(3)='Downstream'
            endif
            if param(11) eq 4 then begin
                set_side(0)='Downstream'
                set_side(1)='Single'
                set_side(2)='Both'
                set_side(3)='Upstream'
            endif
        endelse
        widget_control, idDROPLIST_RunT, set_value=set_side

        if param(12) eq 1 then begin
            Widget_Control, idBaseEmis, SENSITIVE=0
        endif
        if param(12) eq 2 then begin
            Widget_Control, idBaseEmis, SENSITIVE=1
            set_emis(0)='Wavelength Dependent'
            set_emis(1)='Wavelength Independent'
            widget_control, idDROPLIST_Emis, set_value=set_emis
        endif


        if param(13) eq 2 then begin

            set_Mode(0)='Slit Mode'
            set_Mode(1)='Pinhole Mode'
            widget_control, idDROPLIST_Mode, set_value=set_mode
        endif

       if epicsparam(0) eq 'on' then begin
;         set_epics(0)='Yes'
;         set_epics(1)='No'
         widget_control, idDROPLIST_epics, set_value=set_epics
         CASE param(11) of
         3: begin
            widget_control, idTEXT_downt, SENSITIVE=0
            widget_control, idTEXT_downMT, SENSITIVE=0
            widget_control, idTEXT_upt, SENSITIVE=1
            widget_control, idTEXT_upMT, SENSITIVE=1
         end
         4: begin
            widget_control, idTEXT_downt, SENSITIVE=1
            widget_control, idTEXT_downMT, SENSITIVE=1
            widget_control, idTEXT_upt, SENSITIVE=0
            widget_control, idTEXT_upMT, SENSITIVE=0
         end
         2: begin
            widget_control, idTEXT_downt, SENSITIVE=1
            widget_control, idTEXT_downMT, SENSITIVE=1
            widget_control, idTEXT_upt, SENSITIVE=1
            widget_control, idTEXT_upMT, SENSITIVE=1
         end
         ELSE: begin
            ttt=dialog_message('EPICS is ON. Select an appropriate Detector Side.', /information)
            widget_control, idTEXT_downt, SENSITIVE=0
            widget_control, idTEXT_downMT, SENSITIVE=0
            widget_control, idTEXT_upt, SENSITIVE=0
            widget_control, idTEXT_upMT, SENSITIVE=0
            end
         ENDCASE
       endif

        widget_control, idDROPLIST_epics, get_value=v_epics
        n_epics=widget_info(idDROPLIST_epics,/droplist_select)

        nepics=v_epics(n_epics)


       widget_control, idTEXT_upt, set_value=string(epicsparam(1))
       widget_control, idTEXT_upMT, set_value=string(epicsparam(2))
       widget_control, idTEXT_downT, set_value=string(epicsparam(3))
       widget_control, idTEXT_downMT, set_value=string(epicsparam(4))

       widget_control, idTEXT_SpecTPath, set_value=string(epicsparam(5))
       widget_control, idTEXT_DataPath, set_value=string(epicsparam(6))
       ;print, 'test....', epicsparam(7)
       widget_control, idTEXT_StandPath, set_value=string(epicsparam(7))



    ENDIF
    widget_control, idTEXT_st_0, SENSITIVE=0
    widget_control, idTEXT_st_1, SENSITIVE=0
    widget_control, idTEXT_st_2, SENSITIVE=0
    widget_control, idTEXT_st_3, SENSITIVE=0
    widget_control, idTEXT_st_4, SENSITIVE=0


    OnSelectMode, event

    widget_control, idTEXT_SpecTPath, set_value=string(defdir)
    ;print, defdir

end
;-----------------------------------------------------------------
pro OnLoadDefault, Event
    OnRunTParam, pfile='runtparam.ini', epicsfile='epicsparam.ini', reload=1, event

end
;-----------------------------------------------------------------
;-----------------------------------------------------------------
pro OnApplyParam, Event
COMMON parameter,   StartWav,$
              EndWav,$
              StartRow, $
              NumRow, $
              Bin, $
              Average, $
              StartRow_0, $
              NumRow_0, $
              Bin_0, $
              Average_0, $
              Emis1, $
              nside, $
              nemis, $
              nmode
 COMMON standlamp, st0, $
              st1, $
              st2, $
              st3, $
              st4
 COMMON idraw,  idraw_0, idraw_1
 COMMON epics, n_epics, PV_upT, PV_upMT, PV_downT, PV_downMT
 COMMON dir, specTpath, datapath, standpath


    idTEXT_StartWav=Widget_Info(Event.top,find_by_uname='TEXT_StartWav')
    idTEXT_EndWav=Widget_Info(Event.top,find_by_uname='TEXT_EndWav')
    idTEXT_StartRow=Widget_Info(Event.top,find_by_uname='TEXT_StartRow')
    idTEXT_NumRow=Widget_Info(Event.top,find_by_uname='TEXT_NumRow')
    idTEXT_Bin=Widget_Info(Event.top,find_by_uname='TEXT_Bin')
    idTEXT_Average=Widget_Info(Event.top,find_by_uname='TEXT_Average')
    idTEXT_StartRow_0=Widget_Info(Event.top,find_by_uname='TEXT_StartRow_0')
    idTEXT_NumRow_0=Widget_Info(Event.top,find_by_uname='TEXT_NumRow_0')
    idTEXT_Bin_0=Widget_Info(Event.top,find_by_uname='TEXT_Bin_0')
    idTEXT_Average_0=Widget_Info(Event.top,find_by_uname='TEXT_Average_0')
    idTEXT_Emis1=Widget_Info(Event.top,find_by_uname='Emis1_TEXT')
    idDROPLIST_RunT=Widget_Info(Event.top,find_by_uname='RunT_DROPLIST')
    idDROPLIST_Emis=Widget_Info(Event.top,find_by_uname='Emis_DROPLIST')
    idDROPLIST_Mode=Widget_Info(Event.top,find_by_uname='DROPLIST_mode')
    idTEXT_Mode=Widget_Info(Event.top,find_by_uname='TEXT_mode')
    idTEXT_Side=Widget_Info(Event.top,find_by_uname='TEXT_side')
    idTEXT_Emis=Widget_Info(Event.top,find_by_uname='TEXT_emis')
    idTEXT_st_0=Widget_Info(Event.top,find_by_uname='TEXT_st_0')
    idTEXT_st_1=Widget_Info(Event.top,find_by_uname='TEXT_st_1')
    idTEXT_st_2=Widget_Info(Event.top,find_by_uname='TEXT_st_2')
    idTEXT_st_3=Widget_Info(Event.top,find_by_uname='TEXT_st_3')
    idTEXT_st_4=Widget_Info(Event.top,find_by_uname='TEXT_st_4')
    ;idBUTTON_tp=Widget_Info(Event.top,find_by_uname='BUTTON_TProfile')
    ;idBUTTON_ip=Widget_Info(Event.top,find_by_uname='BUTTON_IntensityProfile')
    idDROPLIST_side1=Widget_Info(Event.top,find_by_uname='DROPLIST_Side1')
    idDROPLIST_side2=Widget_Info(Event.top,find_by_uname='DROPLIST_Side2')
    idLABEL_side1=Widget_Info(Event.top,find_by_uname='LABEL_Side1')
    idLABEL_side2=Widget_Info(Event.top,find_by_uname='LABEL_Side2')
    idLABEL_stand_0=widget_info(Event.top, FIND_BY_UNAME='LABEL_stand_0')

    idTEXT_upt=Widget_Info(Event.top,find_by_uname='TEXT_upt')
    idTEXT_upMT=Widget_Info(Event.top,find_by_uname='TEXT_upMT')
    idTEXT_downT=Widget_Info(Event.top,find_by_uname='TEXT_downT')
    idTEXT_downMT=Widget_Info(Event.top,find_by_uname='TEXT_downMT')
    idDROPLIST_epics=Widget_Info(Event.top,find_by_uname='DROPLIST_epics')

    idTEXT_SpecTPath=Widget_Info(Event.top,find_by_uname='TEXT_SpecTpath')
    idTEXT_DataPath=Widget_Info(Event.top,find_by_uname='TEXT_DataPath')
    idTEXT_StandPath=Widget_Info(Event.top,find_by_uname='TEXT_StandPath')
    idTEXT_display=Widget_Info(Event.top,find_by_uname='TEXT_Display')



    idDRAW_0=Widget_Info(Event.top,find_by_uname='DRAW_0')
    idDRAW_1=Widget_Info(Event.top,find_by_uname='DRAW_1')
    widget_control, idDRAW_0, get_value=idraw_0
    widget_control, idDRAW_1, get_value=idraw_1

    widget_control, idTEXT_StartWav, get_value=StartWav
        StartWav=string(StartWav, format='(f4.0)')
        ;print, '???????????????????', startwav
    widget_control, idTEXT_EndWav, get_value=EndWav
        EndWav=string(EndWav, format='(f4.0)')
    widget_control, idTEXT_StartRow, get_value=StartRow
        StartRow=string(StartRow, format='(I3)')
    widget_control, idTEXT_NumRow, get_value=NumRow
        NumRow=string(NumRow, format='(I3)')
    widget_control, idTEXT_Bin, get_value=Bin
        Bin=string(bin, format='(I3)')
    widget_control, idTEXT_Average, get_value=Average
       Average=string(Average, format='(I3)')
    widget_control, idTEXT_StartRow_0, get_value=StartRow_0
        StartRow_0=string(StartRow_0, format='(I3)')
    widget_control, idTEXT_NumRow_0, get_value=NumRow_0
        NumRow_0=string(NumRow_0, format='(I3)')
    widget_control, idTEXT_Bin_0, get_value=Bin_0
        Bin_0=string(bin_0, format='(I3)')
    widget_control, idTEXT_Average_0, get_value=Average_0
        Average_0=string(Average_0, format='(I3)')
    widget_control, idTEXT_Emis1, get_value=Emis1
        Emis1=string(Emis1, format='(f15.10)')
    Widget_Control, idTEXT_st_0, get_Value=st0
        st0=string(st0,format='(f15.5)')
    Widget_Control, idTEXT_st_1, get_Value=st1
        st1=string(st1,format='(f15.5)')
    Widget_Control, idTEXT_st_2, get_Value=st2
        st2=string(st2,format='(e20.5)')
    Widget_Control, idTEXT_st_3, get_Value=st3
        st3=string(st3,format='(e20.5)')
    Widget_Control, idTEXT_st_4, get_Value=st4
        st4=string(st4,format='(e20.5)')

        widget_control, idDROPLIST_Mode, get_value=v_mode
        n_mode=widget_info(idDROPLIST_Mode,/droplist_select)
        if v_mode(n_mode) eq 'Pinhole Mode' then begin
            nmode='1'
            ;widget_control, idBUTTON_tp, SENSITIVE=0
            ;widget_control, idBUTTON_ip, SENSITIVE=0
        endif
        if v_mode(n_mode) eq 'Slit Mode' then begin
            nmode='2'
            ;widget_control, idBUTTON_tp, SENSITIVE=1
            ;widget_control, idBUTTON_ip, SENSITIVE=1
        endif
        widget_control, idTEXT_Mode, set_value=v_mode(n_mode)


      widget_control, idDROPLIST_side1, get_value=set_disp1
      widget_control, idDROPLIST_side2, get_value=set_disp2
       widget_control, idDROPLIST_runt, get_value=v_side
        n_side=widget_info(idDROPLIST_runt,/droplist_select)
        if v_side(n_side) ne 'Both' then begin
            widget_control, idLABEL_side2, set_value='Side 1'
            ;widget_control, idLABEL_side1, set_value='Side 1'
            set_disp1(0)='Planck Fit'
            if nmode eq 1 then begin
               set_disp1(1)=''
            endif else begin
               set_disp1(1)='T Profile'
            endelse
            set_disp1(2)=''
            set_disp1(3)=''
            widget_control, idDROPLIST_side1, set_value=set_disp1

            set_disp2(0)='Spectra'
            if nmode eq 1 then begin
               set_disp2(1)=''
            endif else begin
               set_disp2(1)='Intensity Profile'
            endelse
            set_disp2(2)=''
            set_disp2(3)=''
            widget_control, idDROPLIST_side2, set_value=set_disp2
        endif else begin
            widget_control, idLABEL_side2, set_value='Side 2'
            ;widget_control, idLABEL_side2, set_value='Side 1'
                       ;widget_control, idLABEL_side1, set_value='Side 1'
            set_disp1(0)='Planck Fit'
            if nmode eq 1 then begin
               set_disp1(1)='Spectra'
               set_disp1(2)=''
               set_disp1(3)=''
            endif else begin
               set_disp1(1)='T Profile'
               set_disp1(2)='Spectra'
               set_disp1(3)='Intensity Profile'
            endelse
            widget_control, idDROPLIST_side1, set_value=set_disp1

            set_disp2(0)='Planck Fit'
            if nmode eq 1 then begin
               set_disp2(1)='Spectra'
               set_disp2(2)=''
               set_disp2(3)=''
            endif else begin
               set_disp2(1)='T Profile'
               set_disp2(2)='Spectra'
               set_disp2(3)='Intensity Profile'
            endelse
            widget_control, idDROPLIST_side2, set_value=set_disp2
        endelse


        if v_side(n_side) eq 'Single' then nside='1'
        if v_side(n_side) eq 'Both' then nside='2'
        if v_side(n_side) eq 'Upstream' then nside='3'
        if v_side(n_side) eq 'Downstream' then nside='4'
        widget_control, idTEXT_Side, set_value=v_side(n_side)+' Side'

        widget_control, idDROPLIST_Emis, get_value=v_emis
        n_emis=widget_info(idDROPLIST_emis,/droplist_select)
        if v_emis(n_emis) eq 'Wavelength Independent' then nemis='1'
        if v_emis(n_emis) eq 'Wavelength Dependent' then nemis='2'
        widget_control, idTEXT_Emis, set_value='Em:'+v_emis(n_emis)





    idBaseParam=Widget_Info(Event.top,find_by_uname='BaseParam')
    Widget_Control, idBaseParam, MAP=0

    ;Turn off the display of IDL-draw windows
    idBaseDraw=Widget_Info(Event.top,find_by_uname='BaseDraw')
    Widget_Control, idBaseDraw, MAP=1

       widget_control, idTEXT_specTpath, get_value=specTpath
       SpecTPath=string(specTpath)
       widget_control, idTEXT_datapath, get_value=datapath
       dataPath=string(datapath)
       widget_control, idTEXT_standpath, get_value=standpath
       standPath=string(standpath)

    if nside eq 2 then begin
       widget_control, idLABEL_stand_0, get_value=test_sfile_0
       test_sfile_0=string(test_sfile_0)
       if test_sfile_0 eq 'Display the second standard file' then begin
            ttt=dialog_message('Second standard file required! Load now?',/question)
            widget_control, idLABEL_stand_0,SENSITIVE=1
            if ttt eq 'Yes' then begin
                OnLoadStand, stand_file=1, event
            endif
       endif
    endif else begin
       widget_control, idLABEL_stand_0,SENSITIVE=0
    endelse

        widget_control, idDROPLIST_epics, get_value=v_epics
        n_epics=widget_info(idDROPLIST_epics,/droplist_select)

       nepics=v_epics(n_epics)

        widget_control, idTEXT_upt, get_value=PV_upT
        PV_upT=string(PV_upT)

        widget_control, idTEXT_upMT, get_value=PV_upMT
        PV_upMT=string(PV_upMT)

       widget_control, idTEXT_downT, get_value=PV_downT
       PV_downT=string(PV_downT)

       widget_control, idTEXT_downMT, get_value=PV_downMT
       PV_downMT=string(PV_downMT)

    widget_control, idTEXT_display, set_value='Parameters loaded.'

end
;-----------------------------------------------------------------

;****************************************************************************************
;***************************************************************************************
function SpecT_p, file, $
                      sfile, $
                      startwav, $
                      endwav,$
                      StartRow, $
                      NumRow, $
                      set_planck=set_planck, $
                      emis1=emis1, $
                      disp=disp

;+
; NAME:
;   SpecT_pinhole
;
; PURPOSE:
;   This function reads thermal radiation data (WinSpec data), fits to the Planck law
;   and caluculates temperatures.
;
; CATEGORY:
;   Data Analysis
;
; CALLING SEQUENCE:
;   t=Run_T_Pinhile, File, Stand=Stand, Startwav=StartWav, EndWav=EndWav, $
;             StartRow=StartRow,NumRow=NumRow
;
; INPUTS:
;   File:
;       The name of the data file for temperature calculation.
;
; OUTPUTS:
;   Temperature values.

;
; KEYWORD OUTPUTS:
;   None
;
; KEYWORD DESCRIPTION
;   file:         the name of the file to be calculated;
;   stand:        the name of the standard file;
;   startwav:     the first wavelength number to be used;
;   endwav:       the last wavelength number for fitting;
;   startrow:     the first row number to be slected;
;   numrow:       Number of rows to be used.
;
; RESTRICTIONS:
;   This function only calculate temperatures from binned spectra (pinhole mode).
;
; EXAMPLE:
;       IDL> t=Run_T_Pinhile, 'testfile.spe', Stand='Stand.spe', Startwav=650., EndWav=800., $
;             StartRow=0,NumRow=10
;       IDL> print, t
;
; MODIFICATION HISTORY:
;       Written by:     Guoyin Shen, 2/14/2004




COMMON idraw
COMMON standlamp
; Set default parameters
    if (keyword_set(startwav) eq 0) then startwav=650.

    if (keyword_set(endwav) eq 0) then endwav=830.

    if (keyword_set(startrow) eq 0) then startrow=0

    if (keyword_set(numrow) eq 0) then numrow=10

    if (keyword_set(emis1) eq 0) then emis1=0.

    if (keyword_set(disp) eq 0) then disp=0

  common emis, pemis1
  pemis1=emis1


if n_elements(file) eq 0 then begin
    file=dialog_pickfile(/read, filter=('*.SPE'))
    print, file
endif
if n_elements(sfile) eq 0 then begin
    sfile=dialog_pickfile(/read, filter=('*.SPE'), title='Select a standard file!')
    print, sfile
endif

; Read a standard file.
    read_princeton, sfile, stand_data, header=header, x_cal=x_cal
    ; print, x_cal
    stand_data=stand_data
    ;and '0000ffff'x
    standsize=size(stand_data)
    ; plot, x_cal, stand_data(*,0)




 ;Define wavelenth range
    ; Calculate the start wavelength specified
        coeffs = header.xcalibration.polynocoeff
        coeffs=coeffs(0:1)
        coeffs(0)=coeffs(0)-startwav
        roots=fz_roots(coeffs)
        startpix=fix(roots(0))

    ; Calculate the end wavelength specified
        coeffs = header.xcalibration.polynocoeff
        coeffs=coeffs(0:1)
        coeffs(0)=coeffs(0)-endwav
        roots=fz_roots(coeffs)
        endpix=fix(roots(0))
        ;print, startpix,endpix,startwav,endwav


; Calculate a transfunction from the standard data and the standard file
    trans = fltarr(standsize(1))
    stand_d = fltarr(standsize(1))
    ; print, stand_d(*,0)
        ;plot, x_cal, stand_d(*,0)

    ;print, '???????????????????', startrow
    for i=startrow,startrow+numrow-1 do begin
        stand_d=stand_d+stand_data(*,i)
    endfor
    ;plot, x_cal, stand_d
    ; Radiation data of the GSECARS-lamp from the Optronic Laboratories, Inc., fitted by KaleidaGraph 4th poly-order.
    ;planck = 416.1-2.7414*x_cal+0.0059856*x_cal^2.-4.8644e-6*x_cal^3.+1.3353e-9*x_cal^4.
    ;planck = 461.1-2.7414*x_cal+0.0059856*x_cal^2.-4.8644e-6*x_cal^3.+1.3353e-9*x_cal^4.
    ;GSECARS-lamp at the current of 10.48 A
    ;planck = 182.96-0.9322*x_cal+0.0016809*x_cal^2.-1.2545e-6*x_cal^3.+3.4577e-10*x_cal^4.
    ; Radiation data of the lamp from Dion Heinz, IR-163
    ;planck =489.56-3.3249*x_cal+0.0075135*x_cal^2.-6.301e-06*x_cal^3.+1.7966e-09*x_cal^4.
    ; Radiation data of the lamp from Dion Heinz, IR-397
    ;planck = 444.48-3.0014*x_cal+0.0067371*x_cal^2.-5.6073e-06*x_cal^3.+1.5892e-09*x_cal^4.

    planck = st0+st1*x_cal+st2*x_cal^2.+st3*x_cal^3.+st4*x_cal^4.

    trans= 1.*stand_d/planck
      ;plot, x_cal(startpix:endpix), trans(startpix:endpix)


; Read the file to be calculated...
    read_princeton, file , tem
     temsize=size(tem)
     data=fltarr(temsize(1))
     for i=startrow,startrow+numrow-1 do begin
         data=data+abs(tem(*,i))
     endfor
     ;oplot, x_cal, data, color=200

; Planck radiation
        radiation = data/trans
        ;plot, x_cal(startpix:endpix), radiation(startpix:endpix)
        m=endpix-startpix+1
        rad_fit=fltarr(m)
        data_fit=fltarr(4)
        ;print, radiation(endpix-200,0)
;
; If signal too weak, stop fitting and set temperature to be 300 K.
    if (radiation(endpix-200) LE .2) then begin
        ;t=dialog_message('Signal too weak!')
        data_fit=[300.,0.,0,0]


    endif else begin
       ;Begin fitting with the Wien approximation
       ; if n_elements(set_planck) eq 0 then begin
         ;   j = alog(radiation(startpix:endpix))+5.*alog(x_cal(startpix:endpix)*1.e-9)-alog(3.7398e-16)
             w = 1.438e-2/(1.e-9*x_cal(startpix:endpix))
         ;   p0=[-21.d, 0.0005]
         ;   err=fltarr(endpix-startpix)
         ;   for i=0, endpix-startpix-1 do err(i)=0.
         ;   print, err
         ;   result=poly_fit(w,j,1,j_fit, j_band, sigma)
         ;   result = mpfitfun('wien', w,j, err, p0,WEIGHTs=1d, PERROR=perr, BESTNORM=bestn, QUIET=1)
         ;   dof=n_elements(x_cal(startpix:endpix))-n_elements(p0)
         ;   pcerr=perr*sqrt(2.*bestn/dof)
         ;   ;print, result, pcerr
         ;   ;print, bestn
;
;            j_fit=result(0)+result(1)*w
;            ;Radiation fit
;            rad_fit=3.7398e-16*exp(j_fit)/(x_cal(startpix:endpix)*1.e-9)^5.
;            ;plot, w, j
;            ;oplot, w, j_fit, color=120
;            ;plot, x_cal(startpix:endpix), radiation(startpix:endpix)
;            ;oplot, x_cal(startpix:endpix), rad_fit, color=200;
;
;
;            ;Temperature
;            data_fit(0) = -1./result(1)
;            data_fit(1)=pcerr(1)*data_fit(0)^2.
;            ;print, data_fit(0)
;            ;print, result(0), result(1)
;
;            ;Emissivity
;            data_fit(2)=exp(result(0))
;            data_fit(3)=pcerr(0)*exp(result(0))
;            ;print, data_fit
;
;
;
;            ;Chi Square goodness-of-fit
;            ;data_fit(4)=chi
        ;Begin fitting with the Planck radiation law (non-linear fitting)
;        endif else begin
            p0=[1.d-10, 2000.]
            err=fltarr(endpix-startpix)
            for i=0, endpix-startpix-1 do err(i)=0.

            result = mpfitfun('planckfun', x_cal(startpix:endpix),radiation(startpix:endpix), $
                           err, p0,WEIGHTs=1.d, PERROR=perr, BESTNORM=bestn, QUIET=1)

            dof=n_elements(x_cal(startpix:endpix))-n_elements(p0)
            pcerr=perr*sqrt(2.*bestn/dof)
            ;print, result, pcerr
            ;print, bestn

            ;Radiation fit
            rad_fit=3.7398d-16*(result(0)*(1-.00005*(x_cal(startpix:endpix)-750.)))*(x_cal(startpix:endpix)*1.d-9)^(-5.)/$
               (exp(1.4388d-2/(x_cal(startpix:endpix)*1.d-9)/result(1))-1)





            ;Temperature
            data_fit(0) = result(1)
            data_fit(1)=pcerr(1)
            ;print, data_fit(0)
            ;print, result(0), result(1)

            ;Emissivity
            data_fit(2)=result(0)
            data_fit(3)=pcerr(0)
            ;print, data_fit
 ;       endelse
     endelse
     savefile=strmid(file, strpos(file,'\',/reverse_search)+1,$
             strlen(file))
    CASE disp of
       ;Radiation window 0
       0: begin
             wset, idraw_0
             ;print, 'draw window 0', idraw_0
            plot, x_cal(startpix:endpix), radiation(startpix:endpix), xtitle='Wavelength (nm)', ytitle='Radiation', /ynozero
            oplot, x_cal(startpix:endpix), rad_fit, color=200
            xyouts,0.3,0.15,'T(K)=',size=1.5,/normal
            xyouts,0.30,0.15, data_fit(0),size=1.5,/normal
            xyouts,0.66,0.15, ' +/- ', size=1., /normal
            xyouts,0.67,0.15, data_fit(1), size=1., /normal
            xyouts,0.3,0.22,'File: ', size=1.,/normal

            xyouts,0.45,0.22,savefile, size=1.,/normal
            end
        ;Radiation window 1
        1: begin
            wset, idraw_1
             ;print, 'draw window 0', idraw_0
            plot, x_cal(startpix:endpix), radiation(startpix:endpix), xtitle='Wavelength (nm)', ytitle='Radiation', /ynozero
            oplot, x_cal(startpix:endpix), rad_fit, color=200
            xyouts,0.3,0.15,'T(K)=',size=1.5,/normal
            xyouts,0.30,0.15, data_fit(0),size=1.5,/normal
            xyouts,0.66,0.15, ' +/- ', size=1., /normal
            xyouts,0.67,0.15, data_fit(1), size=1., /normal
            xyouts,0.3,0.22,'File: ', size=1.,/normal
            xyouts,0.45,0.22,savefile, size=1.,/normal
            end
         ;Spectra window 0
         2: begin
            wset, idraw_0
            ;print, 'draw window 1', idraw_1
            plot, x_cal(startpix:endpix), data(startpix:endpix), xtitle='Wavelength (nm)', ytitle='Intensity',/ynozero
            ;oplot, x_cal(startpix:endpix), rad_fit, color=200
         end
         ;Spectra window 1
         3: begin
            wset, idraw_1
            ;print, 'draw window 1', idraw_1
            plot, x_cal(startpix:endpix), data(startpix:endpix), xtitle='Wavelength (nm)', ytitle='Intensity', /ynozero
            end
        ;Planck save
        4: begin
            plancksave=dialog_pickfile(/write, filter=('*.plk'))
            openw, lun, plancksave, /get_lun
               printf, lun, 'Data of Planck radiation and its fit'
               printf, lun, 'File:', file
               printf, lun, 'Standard fie: ', sfile
               printf, lun, '         Wavelength(nm)         Radiation            Fit        '
               for k=startpix, endpix do begin
                 printf, lun, format='(3f20.4)', x_cal(k), radiation(k), rad_fit(k-startpix)
               endfor
            free_lun, lun
            end
       ;Planck print
       5: begin
            set_plot, 'printer'
            re=dialog_printersetup()
            plot, x_cal(startpix:endpix), radiation(startpix:endpix), $
                 xtitle='Wavelength (nm)', ytitle='Radiation', title=file, /ynozero
            oplot, x_cal(startpix:endpix), rad_fit, color=120
            xyouts,0.3,0.15,'T(K)=',size=1.5,/normal
            xyouts,0.30,0.15, data_fit(0),size=1.5,/normal
            xyouts,0.66,0.15, ' +/- ', size=1., /normal
            xyouts,0.67,0.15, data_fit(1), size=1., /normal
            xyouts,0.3,0.22,'File: ', size=1.,/normal
            xyouts,0.45,0.22,savefile, size=1.,/normal

            device, /close
            set_plot, 'win'
          end
       6: begin
            wset, idraw_0
             ;print, 'draw window 0', idraw_0
            plot, x_cal(startpix:endpix), radiation(startpix:endpix), xtitle='Wavelength (nm)', ytitle='Radiation', /ynozero
            oplot, x_cal(startpix:endpix), rad_fit, color=200
            xyouts,0.3,0.15,'T(K)=',size=1.5,/normal
            xyouts,0.30,0.15, data_fit(0),size=1.5,/normal
            xyouts,0.66,0.15, ' +/- ', size=1., /normal
            xyouts,0.67,0.15, data_fit(1), size=1., /normal
            xyouts,0.3,0.22,'File: ', size=1.,/normal
            xyouts,0.45,0.22,savefile, size=1.,/normal

            wset, idraw_1
            ;print, 'draw window 1', idraw_1
            plot, x_cal(startpix:endpix), data(startpix:endpix), xtitle='Wavelength (nm)', ytitle='Intensity', /ynozero
            end
        ELSE:
       ENDCASE

     ;Return data_fit
     ;  data_fit(0): Temperature
     ;  data_fit(1): Emissivisy
     ;  data_fit(2): Chi square goodness
     ;  data_fit(3): 1-sigma temperature
     return, data_fit
end

function wien, x, p
    ;y=p(0)+p(1)*x
    ;print, emis1
    return, p(0)+p(1)*x
end

function planckfun, x, p
    common emis
    f=3.7398e-16*(p(0)*(1+pemis1*(x-750.)))*(x*1.e-9)^(-5.)/(exp(1.4388e-2/(x*1.e-9)/p(1))-1)

    return, f
end

;*******************************************************************************************************
function SpecT_s, file, $
              sfile, $
              startwav, $
              endwav, $
              startrow, $
              numrow, $
              numbin, $
              numaverage, $
              set_planck=set_planck, $
              emis1=emis1, $
              disp=disp



;+
; NAME:
;   SpecT_pinhole
;
; PURPOSE:
;   This function reads thermal radiation data (WinSpec data), fits to the Planck law
;   and caluculates temperatures.
;
; CATEGORY:
;   Data Analysis
;
; CALLING SEQUENCE:
;   t=Run_T_Pinhile, File, Stand=Stand, Startwav=StartWav, EndWav=EndWav, $
;             StartRow=StartRow,NumRow=NumRow
;
; INPUTS:
;   File:
;       The name of the data file for temperature calculation.
;
; OUTPUTS:
;   Temperature values.

;
; KEYWORD OUTPUTS:
;   None
;
; KEYWORD DESCRIPTION
;   file:         the name of the file to be calculated;
;   stand:        the name of the standard file;
;   startwav:     the first wavelength number to be used;
;   endwav:       the last wavelength number for fitting;
;   startrow:      the first row of the recorded image;
;   numrow:       the number of rows to be calculated;
;   numbin:       the number of binning;
;   numaverage:   the number of points to be averaged at the central portion

; RESTRICTIONS:
;   This function only calculate temperatures from binned spectra (pinhole mode).
;
; EXAMPLE:
;       IDL> t=SpecT_slit, 'testfile.spe', Stand='Stand.spe', Startwav=650., EndWav=800., $
;             StartRow=0,NumRow=10
;       IDL> print, t
;
; MODIFICATION HISTORY:
;       Written by:     Guoyin Shen, 2/14/2004


; Set default values

    if n_elements(file) eq 0 then begin
       file=dialog_pickfile(/read, filter=('*.spe'))
       print, file
    endif
    if n_elements(sfile) eq 0 then begin
       sfile=dialog_pickfile(/read, filter=('*.spe'), title='Select a standard file!')
       print, sfile
    endif
    if (keyword_set(startwav) eq 0) then startwav=650.

    if (keyword_set(endwav) eq 0) then endwav=800.

    if (keyword_set(startrow) eq 0) then startrow=0

    if (keyword_set(numrow) eq 0) then numrow=60

    if (keyword_set(numbin) eq 0) then numbin=3

    if (keyword_set(numaverage) eq 0) then numaverage=3

    if (keyword_set(emis1) eq 0) then emis1=0

    if (keyword_set(disp) eq 0) then disp=0


common emis, pemis1
pemis1=emis1
common idraw
common standlamp


; Read a standard file.
    read_princeton, sfile, stand_data, header=header, x_cal=x_cal
    ; print, x_cal
    stand_data=stand_data
    ; and '0000ffff'x
    standsize=size(stand_data)
    for i=startrow, startrow+numrow-1 do stand_data(*,i-startrow)=stand_data(*,i)

; Define a wavelength range for fitting.
    ; Calculate the start wavelength specified
        coeffs = header.xcalibration.polynocoeff
        coeffs=coeffs(0:1)
        coeffs(0)=coeffs(0)-startwav
        roots=fz_roots(coeffs)
        startpix=fix(roots(0))

        ; Calculate the end wavelength specified
        coeffs = header.xcalibration.polynocoeff
        coeffs=coeffs(0:1)
        coeffs(0)=coeffs(0)-endwav
        roots=fz_roots(coeffs)
        endpix=fix(roots(0))
        ;print, startpix,endpix,startwav,endwav

; Define the number of pixels
    numpoint = fix(numrow/numbin)

; Calculate transfunction from the standard data and the standard file
    trans = fltarr(standsize(1),numpoint)
    stand_d = fltarr(standsize(1),numpoint)
    radiation = fltarr(standsize(1),numpoint)

    for i=0,numpoint-1 do begin
        num=i*numbin
        for k=0,numbin-1 do stand_d(*,i)=stand_d(*,i)+stand_data(*,num+k)
    endfor

    ; Radiation data of the GSECARS-lamp from the Optronic Laboratories, Inc., fitted by KaleidaGraph 4th poly-order.
    ;planck = 416.1-2.7414*x_cal+0.0059856*x_cal^2.-4.8644e-6*x_cal^3.+1.3353e-9*x_cal^4.

    ;GSECARS-lamp at the current of 10.48 A
    ;planck = 182.96-0.9322*x_cal+0.0016809*x_cal^2.-1.2545e-6*x_cal^3.+3.4577e-10*x_cal^4.

    ; Radiation data of the lamp from Dion Heinz, IR-163
    ;planck =489.56-3.3249*x_cal+0.0075135*x_cal^2.-6.301e-06*x_cal^3.+1.7966e-09*x_cal^4.

    ; Radiation data of the lamp from Dion Heinz, IR-397
    ;planck = 444.48-3.0014*x_cal+0.0067371*x_cal^2.-5.6073e-06*x_cal^3.+1.5892e-09*x_cal^4.

    planck = st0+st1*x_cal+st2*x_cal^2.+st3*x_cal^3.+st4*x_cal^4.

    for i=0,numpoint-1 do trans(*,i)= 1.*stand_d(*,i)/planck
        ;plot, x_cal(startpix:endpix), trans(startpix:endpix,1)


;Load files to calculate temperatures
    read_princeton, file , tem
    data = fltarr(standsize(1),numpoint)

    for i=startrow,startrow+numrow-1 do tem(*,i-startrow)=tem(*,i)


    for i=0,numpoint-1 do begin
        num=i*numbin
        for k=0,numbin-1 do data(*,i)=data(*,i)+abs(tem(*,num+k))
    endfor
    ;print, data

 ;Calculate thermal radiation
    radiation = data/trans
    ; plot, x_cal(startpix:endpix), radiation(startpix:endpix,25)
    ;print, radiation(endpix-200, *)
 ;Apply fitting to the Planck radiation law

    m=endpix-startpix+1
    rad_fit=dblarr(numpoint, m)
    data_fit=fltarr(numpoint, 4)

    for i = 0, numpoint-1 do begin
        if (radiation(endpix-200,i) LE 0.2) then begin
            data_fit(i,0)=300.
            data_fit(i,1)=0.
            data_fit(i,2)=0.
            data_fit(i,3)=0.
        endif else begin

        ;Begin fitting with the Wien approximation
;            if n_elements(set_planck) eq 0 then begin
;                j = alog(radiation(startpix:endpix,i))+5.*alog(x_cal(startpix:endpix)*1.e-9)-alog(3.7398e-16)
;                w = 1.438e-2/(1.e-9*x_cal(startpix:endpix))
;                p0=[-21.d, 0.0005]
;                err=fltarr(endpix-startpix+1)
;                for k=0, endpix-startpix do err(k)=0.
;                ;print, err
;                ;result=poly_fit(w,j,1,j_fit, j_band, sigma)
;                result = mpfitfun('wien', w,j, err, p0,WEIGHTs=1d, PERROR=perr, BESTNORM=bestn, QUIET=1);;
;
;                ;error calculation (refer to MPFITFUN)
;                dof=n_elements(x_cal(startpix:endpix))-n_elements(p0)
;                pcerr=perr*sqrt(2.*bestn/dof);
;
;                ;print, result, pcerr
;                ;print, bestn;
;
;                j_fit=result(0)+result(1)*w;
;
;                ;Radiation fit
;                rad_fit(i,*)=3.7398e-16*exp(j_fit)/(x_cal(startpix:endpix)*1.e-9)^5.;
;
;                ;Temperature
;                data_fit(i,0) = -1./result(1)
;                data_fit(i,1)=pcerr(1)*data_fit(0)^2.
;                ;print, data_fit(i,0), data_fit(i,1)
;
;                ;Emissivity
;                data_fit(i,2)=exp(result(0))
; ;               data_fit(i,3)=pcerr(0)*exp(result(0))
;
;                ;data_fit(4)=chi
        ;Begin fitting with the Planck radiation law (non-linear fitting)
;            endif else begin
                p0=[1.d-10, 2000.]
                err=fltarr(endpix-startpix)
                for k=0, endpix-startpix-1 do err(k)=0.

                result = mpfitfun('planckfun', x_cal(startpix:endpix),radiation(startpix:endpix,i), $
                               err, p0,WEIGHTs=1.d, PERROR=perr, BESTNORM=bestn, QUIET=1)
                ;dof=n_elements(x_cal(startpix:endpix))-n_elements(p0)

                dof=n_elements(x_cal(startpix:endpix))-n_elements(p0)
                pcerr=perr*sqrt(2.*bestn/dof)

                ;Radiation fit
                rad_fit(i,*)=3.7398d-16*(result(0)*(1-.00005*(x_cal(startpix:endpix)-750.)))*(x_cal(startpix:endpix)*1.d-9)^(-5.)/$
                        (exp(1.4388d-2/(x_cal(startpix:endpix)*1.d-9)/result(1))-1)


                ;plot, x_cal(startpix:endpix), radiation(startpix:endpix)
                ;oplot, x_cal(startpix:endpix), rad_fit, color=200


            ;Temperature
                data_fit(i,0) = result(1)
                data_fit(i,1)=pcerr(1)

            ;Emissivity
                data_fit(i,2)=result(0)
                data_fit(i,3)=pcerr(0)
                ;print, data_fit
 ;           endelse
       endelse


            ;oplot, x_cal(startpix:endpix), rad_fit, color=200
    endfor

    midnum=fix(numpoint/2)
    av=fix((numaverage-1)/2)
    savefile=strmid(file, strpos(file,'\',/reverse_search)+1,$
             strlen(file))

            temp=0.
            temp_err=0.
            for m=midnum-av, midnum+av do temp=temp+data_fit(m,0)
            for m=midnum-av, midnum+av do temp_err=temp_err+data_fit(m,1)
            temp=temp/numaverage
            temp_err=temp_err/numaverage

    CASE disp of
        0: begin
            wset, idraw_0

            plot, x_cal(startpix:endpix),radiation(startpix:endpix,midnum),xtitle="Wavelength, nm",$
                ytitle='Radiation',/ynozero
            oplot,x_cal(startpix:endpix),rad_fit(midnum,*),color=200

            xyouts,0.3,0.15,'T(K)= ',size=1.5,/normal
            xyouts,0.29,0.15, temp,size=1.5,/normal
            xyouts,0.63,0.15, ' +/- ', size=1., /normal
            xyouts,0.66,0.15, temp_err, size=1., /normal
            xyouts,0.3,0.22,'File: ', size=1.,/normal

            xyouts,0.45,0.22,savefile, size=1.,/normal

            wset, idraw_1
            plot, x_cal(startpix:endpix), data(startpix:endpix, midnum),$
                 xtitle='Wavelength, nm', ytitle='Intensity',/ynozero
            for k=0,numpoint-1 do begin
                oplot, x_cal(startpix:endpix), data(startpix:endpix,k), color=200
            endfor
          end


        ;Temperature profile
        1:begin
            wset, idraw_0
            x_pix=indgen(numpoint)
            x_pix=numbin*x_pix
            plot, x_pix, data_fit(*,0), xtitle='Pixels', $
                ytitle='Temperature (K)',title='File: '+savefile, /ynozero, psym=-1
            oplot, x_pix, data_fit(*,0), color=200
            end
        ;Spectra
        2:begin
            wset, idraw_1
            datamax=max(data)
            plot, x_cal(startpix:endpix), data(startpix:endpix, midnum), xtitle='Wavelength, nm', ytitle='Intensity',/ynozero,$
                   yrange=[0,datamax]
            for k=0,numpoint-1 do begin
                oplot, x_cal(startpix:endpix), data(startpix:endpix,k), color=200
            endfor
            end
        ;Radiation fit
        3:begin
            wset, idraw_0
            plot, x_cal(startpix:endpix),radiation(startpix:endpix,midnum),xtitle='Wavelength (nm)', ytitle='Radiation',/ynozero
            oplot,x_cal(startpix:endpix),rad_fit(midnum,*),color=200
            xyouts,0.3,0.15,'T= ',size=1.5,/normal
            xyouts,0.22,0.15, temp,size=1.5,/normal
            xyouts,0.56,0.15, ' +/- ', size=1., /normal
            xyouts,0.59,0.15, temp_err, size=1., /normal
            xyouts,0.3,0.21,'File: ', size=1.,/normal
            xyouts,0.45,0.21,savefile, size=1.,/normal
            end
        ;Intensity profile
        4:begin
            wset, idraw_1
            x_pix=indgen(numpoint)
            x_pix=numbin*x_pix
            profile=fltarr(numpoint)
            for k=0,numpoint-1 do profile(k)=total(data(startpix:endpix,k)/(endpix-startpix+1))
            plot, x_pix, profile, xtitle='Pixels', $
                   ytitle='Intensity', title='Intensity Profile',psym=-1, /ynozero
            oplot, x_pix, profile, color=200
            end
         5:begin
            wset, idraw_1
            x_pix=indgen(numpoint)
            x_pix=numbin*x_pix
            plot, x_pix, data_fit(*,0), xtitle='Pixels', $
                ytitle='Temperature (K)',title='File: '+savefile, /ynozero, psym=-1
            oplot, x_pix, data_fit(*,0), color=200
            end
        ;Spectra
        6:begin
            wset, idraw_0
            datamax=max(data)
            plot, x_cal(startpix:endpix), data(startpix:endpix, midnum), xtitle='Wavelength, nm', ytitle='Intensity',/ynozero,$
                   yrange=[0,datamax]
            for k=0,numpoint-1 do begin
                oplot, x_cal(startpix:endpix), data(startpix:endpix,k), color=200
            endfor
            end
        ;Radiation fit
        7:begin
            wset, idraw_1
            plot, x_cal(startpix:endpix),radiation(startpix:endpix,midnum),xtitle='Wavelength (nm)', ytitle='Radiation', /ynozero
            oplot,x_cal(startpix:endpix),rad_fit(midnum,*),color=200
            xyouts,0.3,0.15,'T= ',size=1.5,/normal
            xyouts,0.22,0.15, temp,size=1.5,/normal
            xyouts,0.56,0.15, ' +/- ', size=1., /normal
            xyouts,0.59,0.15, temp_err, size=1., /normal
            xyouts,0.3,0.21,'File: ', size=1.,/normal
            xyouts,0.45,0.21,savefile, size=1.,/normal
            end
        ;Intensity profile
        8:begin
            wset, idraw_0
            x_pix=indgen(numpoint)
            x_pix=numbin*x_pix
            profile=fltarr(numpoint)

            ;print, intdata
            for k=0,numpoint-1 do profile(k)=total(data(startpix:endpix,k)/(endpix-startpix+1))
            ;print, profile
            plot, x_pix, profile, xtitle='Pixels', $
                   ytitle='Intensity', title='Intensity Profile',psym=-1,/ynozero
            oplot, x_pix, profile, color=200
            end
        9:begin
            plancksave=dialog_pickfile(/write, filter=('*.plk'))
            openw, lun, plancksave, /get_lun
               printf, lun, 'Data of Planck radiation and its fit at the central position'
               printf, lun, 'File:', file
               printf, lun, 'Standard file: ', sfile
               printf, lun, '          Wavelength(nm)         Radiation            Fit        '
               for k=startpix, endpix do begin
                 printf, lun, format='(3f20.4)', x_cal(k), radiation(k,midnum), rad_fit(midnum,k-startpix)
               endfor
            free_lun, lun
            end
        10:begin
            set_plot, 'printer'
            re=dialog_printersetup()
            plot, x_cal(startpix:endpix), radiation(startpix:endpix, midnum), $
                 xtitle='Wavelength (nm)', ytitle='Radiation', title=savefile+'#'+strtrim(string(midnum),1)
            oplot, x_cal(startpix:endpix), rad_fit(midnum,*),color=200
            xyouts,0.3,0.15,'T= ',size=1.5,/normal
            xyouts,0.22,0.15, temp,size=1.5,/normal
            xyouts,0.56,0.15, ' +/- ', size=1., /normal
            xyouts,0.59,0.15, temp_err, size=1., /normal
            xyouts,0.3,0.21,'File: ', size=1.,/normal
            xyouts,0.45,0.21,savefile, size=1.,/normal
            device, /close
            set_plot, 'win'
           end
        else:
    ENDCASE

    return, data_fit
end
;********************************************************************************
pro read_princeton, file, $
                data, $
                header=header, $
                x_calibration=x_calibration, $
                y_calibration=y_calibration, $
                comments=comments, $
                exposure=exposure, $
                background_file = background_file, $
                date=date
;+
; NAME:
;   READ_PRINCETON
;
; PURPOSE:
;   This procedure reads data files written by Princeton Instruments'
;   WinSPEC and WinVIEW software.
;
; CATEGORY:
;   File input.
;
; CALLING SEQUENCE:
;   READ_PRINCETON, File, Data
;
; INPUTS:
;   File:
;       The name of the data file to read.
;
; OUTPUTS:
;   Data[nx, ny, nframes]:
;   The output data array.  The array will be 1, 2 or 3 dimensions
;   (depending upon whether ny and nframes are 1) and can be integer,
;   long or float data type.
;
; KEYWORD OUTPUTS:
;   HEADER:
;       The 4100 byte header from the file.  This header can be used to
;       extract additional information about the file.  See the Princteon
;       Instruments "PC Interface Library Programming Manual" for the
;       description of the header structure, and this procedure for
;       examples of how to extract information from the header.
;
;   X_CALIBRATION:
;       An nx array of calibrated values for each pixel in the X direction.
;   Y_CALIBRATION:
;       An ny array of calibrated values for each pixel in the Y direction.
;   COMMENTS:
;       A 5-element string array containing the "experiment comments"
;       fields, which is a 5x80 byte array starting at location 200 in
;       the PI header.  These fields are typically used to store
;       experiment-specific information.  For example, in the tomography
;       experiments we use the first two strings to store the frame type
;       and rotation angle.
;   DATE:
;       A date string of the form DDMMMYYYY:HH:MM:SS
;   EXPOSURE:
;       The exposure time in seconds.
;   BACKGROUND_FILE:
;       The name of the background file that was subtracted from the data
;
; RESTRICTIONS:
;   This procedure currently only extracts limited information from the
;   header. It should be exhanced to extract more fields, probably into a
;   structure.
;   The data and calibration are corrected for byte order when reading on
;   a big-endian host, but other elements of the header are not converted.
;
; EXAMPLE:
;   Read a data file:
;
;       IDL> READ_PRINCETON, 'test.spe', data, header=header, x_cal=x_cal
;       IDL> plot, x_cal, data
;       IDL> clock_speed = float(header, 1428)
;       IDL> print, 'Vertical clock speed (microseconds) = ', clock_speed
;
; MODIFICATION HISTORY:
;       Written by:     Mark Rivers, 11/4/97
;   Mark Rivers 10/27/98  Convert data to long if any pixels are > 32K
;   Mark Rivers 11/12/98  Fix to not convert data if already long
;   Mark Rivers 3/16/99   Added /BLOCK keyword to openr to work with VMS
;   Mark Rivers 3/27/99   Added "Comments" keyword
;   Mark Rivers 3/29/99   Added "Date" keyword
;   Mark Rivers 2/22/00   Corrected byte order for data and calibration.
;   Mark Rivers 9/11/01   Added "exposure" keyword
;   Mark Rivers 9/12/01   Added "background_file" keyword
;-

openr, lun, /get, file, /block

header = bytarr(4100)
readu, lun, header

; Convert the header from a byte array to a structure
header = convert_princeton_header(header)

; Get the image size from the header
nx = header.xdim
ny = header.ydim
nframes = header.NumFrames
data_type = header.datatype
case data_type of
        0: data = fltarr(nx, ny, nframes)
        1: data = lonarr(nx, ny, nframes)
        2: data = intarr(nx, ny, nframes)
        3: data = uintarr(nx, ny, nframes)
        else: message, 'Unknown data type'
endcase

xcal = header.xcalibration
ycal = header.ycalibration
x_calibration = poly(findgen(nx), xcal.polynocoeff(0:xcal.polynoorder))
y_calibration = poly(findgen(ny), ycal.polynocoeff(0:ycal.polynoorder))

comments=header.comments
comments=string(comments)
date = header.date
;hour = fix(header, 30)
;byteorder, hour, /sswap, /swap_if_big_endian
;minute = fix(header, 32)
;byteorder, minute, /sswap, /swap_if_big_endian
;second = fix(header, 38)
;byteorder, second, /sswap, /swap_if_big_endian
;date = date + ":" + string(hour, format='(i2.2)') $
;            + ":" + string(minute, format='(i2.2)') $
;            + ":" + string(second, format='(i2.2)')
exposure = header.exp_sec
if (header.BackGrndApplied) then background_file = header.background $
else background_file = ""

readu, lun, data
data = reform(data)  ; Eliminate trailing dimensions if 1
case data_type of
        0: byteorder, data, /fswap, /swap_if_big_endian
        1: byteorder, data, /lswap, /swap_if_big_endian
        2: byteorder, data, /wswap, /swap_if_big_endian
        3: byteorder, data, /sswap, /swap_if_big_endian
        else: message, 'Unknown data type'
endcase
free_lun, lun
end
;***************************************************************************************************************
pro princeton_header__define
; NOTE: the following values should not change, otherwise the header will
; be bleeped up.
HDRNAMEMAX = 120     ; max char str length for file name
USERINFOMAX = 1000   ; user information space.
COMMENTMAX = 80      ; User comment string max length (5 comments)
LABELMAX = 16        ; Label string max length.
FILEVERMAX = 16      ; File version string max length.
DATEMAX = 10         ; string length of file creation date string as ddmmmyyyy\0
ROIMAX = 10          ; Max size of roi array of structures.
TIMEMAX = 7          ; Max time store as hhmmss\0

HEADER_VERSION  = 2.0

  C_UNKNOWN         =  -1
  C_ST1000          =  0
  C_ST120NEW        =  1
  C_ST120OLD        =  2
  C_ST130           =  3
  C_ST121           =  4
  C_ST138           =  5
  C_DC131           =  6
  C_ST133           =  7
  C_ST135           =  8
  C_VICCD           =  9
  C_ST116           = 10
  C_OMA3            = 11
  C_OMA4            = 12
  C_ST143           = 13
  C_VICCDBOX        = 14
  C_MICROMAX        = 15
  C_SPECTROMAX      = 16
  C_MICROVIEW       = 17
  C_LOW_COST_SPEC   = 18
  C_ST133_5MHZ      = 19
  C_EMPTY_5MHZ      = 20
  C_EPIX_CONTROLLER = 21
  C_PVCAM           = 22
  C_GENERIC         = 23

ROIinfo = {princeton_ROIinfo, $      ; ROI information
  startx: 0, $                 ; left x start value.
  endx: 0, $                   ; right x value.
  groupx: 0, $                 ; amount x is binned/grouped in hw.
  starty: 0, $                 ; top y start value.
  endy: 0, $                   ; bottom y value.
  groupy: 0 $                 ; amount y is binned/grouped in hw.
}                              ; 12 Bytes Each

princeton_calibration = {princeton_calibration, $
    offset:         0.d, $          ; 3000  3489  offset for absolut data scaling
    factor:         0.d, $          ; 3008  3497  factor for absolut data scaling
    current_unit:   0B, $;          ; 3016  3505  selected scaling unit
    CalibReserved1: 0B, $           ; 3017  3506  reserved
    display_string: bytarr(40), $   ; 3018  3507  string used for drawing axes...
    CalibReserved2: bytarr(40), $   ; 3058  3547  reserved
    calib_valid:    0B, $           ; 3098  3587  flag if calibration is valid
    input_unit:     0B, $           ; 3099  3588  current input units for "calib_value"
    polynounit:     0B, $           ; 3100  3589  linear UNIT and used in the "polynocoeff"
    polynoorder:    0B, $           ; 3101  3590  ORDER of calibration POLYNOM
    calib_count:    0B, $           ; 3102  3591  valid calibration data pairs
    pixel_position: dblarr(10), $   ; 3103  3592  pixel pos. of calibration data
    calib_value:    dblarr(10), $   ; 3183  3672  calibration VALUE at above pos
    polynocoeff:    dblarr(6), $    ; 3263  3752  polynom COEFFICIENTS
    laser_position: 0.d, $          ; 3311  3800  laser wavenumber for relativ WN
    CalibReserved3: 0B, $           ; 3319  3808  reserved
    leftover_flag:  0B, $           ; 3320  3809  not used.
    user_label:     bytarr(40), $   ; 3321  3810  Calibration label
    expansion:      bytarr(128)  $  ; 3361  3850  Expansion area
}

princeton_header = {princeton_header, $
  ControllerVersion:    0, $                ;    0  Hardware Version
  LogicOutput:          0, $                ;    2  Definition of Output BNC
  AmpHiCapLowNoise:     0, $                ;    4  Amp Switching Mode
  xDimDet:              0, $                ;    6  Detector x dimension of chip.
  mode:                 0, $                ;    8  timing mode
  exp_sec:              0., $               ;   10  alternitive exposure, in sec.
  VChipXdim:            0, $                ;   14  Virtual Chip X dim
  VChipYdim:            0, $;               ;   16  Virtual Chip Y dim
  yDimDet:              0, $                ;   18  y dimension of CCD or detector.
  date:                 "", $               ;   20  date
  VirtualChipFlag:      0, $                ;   30  On/Off
  Spare_1:              bytarr(2), $        ;   32
  noscan:               0, $                ;   34  Old number of scans - should always be -1
  DetTemperature:       0., $               ;   36  Detector Temperature Set
  DetType:              0, $                ;   40  CCD/DiodeArray type
  xdim:                 0, $                ;   42  actual # of pixels on x axis
  stdiode:              0, $                ;   44  trigger diode
  DelayTime:            0., $               ;   46  Used with Async Mode
  ShutterControl:       0, $                ;   50  Normal, Disabled Open, Disabled Closed
  AbsorbLive:           0, $                ;   52  On/Off
  AbsorbMode:           0, $                ;   54  Reference Strip or File
  CanDoVirtualChipFlag: 0, $                ;   56  T/F Cont/Chip able to do Virtual Chip
  ThresholdMinLive:     0, $                ;   58  On/Off
  ThresholdMinVal:      0., $               ;   60  Threshold Minimum Value
  ThresholdMaxLive:     0, $                ;   64  On/Off
  ThresholdMaxVal:      0., $               ;   66  Threshold Maximum Value
  SpecAutoSpectroMode:  0, $                ;   70  T/F Spectrograph Used
  SpecCenterWlNm:       0., $               ;   72  Center Wavelength in Nm
  SpecGlueFlag:         0, $                ;   76  T/F File is Glued
  SpecGlueStartWlNm:    0., $               ;   78  Starting Wavelength in Nm
  SpecGlueEndWlNm:      0., $               ;   82  Starting Wavelength in Nm
  SpecGlueMinOvrlpNm:   0., $               ;   86  Minimum Overlap in Nm
  SpecGlueFinalResNm:   0., $               ;   90  Final Resolution in Nm
  PulserType:           0, $                ;   94  0=None, PG200=1, PTG=2, DG535=3
  CustomChipFlag:       0, $                ;   96  T/F Custom Chip Used
  XPrePixels:           0, $                ;   98  Pre Pixels in X direction
  XPostPixels:          0, $                ;  100  Post Pixels in X direction
  YPrePixels:           0, $                ;  102  Pre Pixels in Y direction
  YPostPixels:          0, $                ;  104  Post Pixels in Y direction
  asynen:               0, $                ;  106  asynchron enable flag  0 = off
  datatype:             0, $                ;  108  experiment datatype
                                            ;       0 =   FLOATING POINT
                                            ;       1 =   LONG INTEGER
                                            ;       2 =   INTEGER
                                            ;       3 =   UNSIGNED INTEGER
  PulserMode:           0, $                ;  110  Repetitive/Sequential
  PulserOnChipAccums:   0, $                ;  112  Num PTG On-Chip Accums
  PulserRepeatExp:      0L, $               ;  114  Num Exp Repeats (Pulser SW Accum)
  PulseRepWidth:        0., $               ;  118  Width Value for Repetitive pulse (usec)
  PulseRepDelay:        0., $               ;  122  Width Value for Repetitive pulse (usec)
  PulseSeqStartWidth:   0., $               ;  126  Start Width for Sequential pulse (usec)
  PulseSeqEndWidth:     0., $               ;  130  End Width for Sequential pulse (usec)
  PulseSeqStartDelay:   0., $               ;  134  Start Delay for Sequential pulse (usec)
  PulseSeqEndDelay:     0., $               ;  138  End Delay for Sequential pulse (usec)
  PulseSeqIncMode:      0, $                ;  142  Increments: 1=Fixed, 2=Exponential
  PImaxUsed:            0, $                ;  144  PI-Max type controller flag
  PImaxMode:            0, $                ;  146  PI-Max mode
  PImaxGain:            0, $                ;  148  PI-Max Gain
  BackGrndApplied:      0, $                ;  150  1 if background subtraction done
  PImax2nsBrdUsed:      0, $                ;  152  T/F PI-Max 2ns Board Used
  minblk:               0, $                ;  154  min. # of strips per skips
  numminblk:            0, $                ;  156  # of min-blocks before geo skps
  SpecMirrorLocation:   intarr(2), $        ;  158  Spectro Mirror Location, 0=Not Present
  SpecSlitLocation:     intarr(4), $        ;  162  Spectro Slit Location, 0=Not Present
  CustomTimingFlag:     0, $                ;  170  T/F Custom Timing Used
  ExperimentTimeLocal:  "", $               ;  172  Experiment Local Time as hhmmss\0
  ExperimentTimeUTC:    "", $               ;  179  Experiment UTC Time as hhmmss\0
  ExposUnits:           0, $                ;  186  User Units for Exposure
  ADCoffset:            0, $                ;  188  ADC offset
  ADCrate:              0, $                ;  190  ADC rate
  ADCtype:              0, $                ;  192  ADC type
  ADCresolution:        0, $                ;  194  ADC resolution
  ADCbitAdjust:         0, $                ;  196  ADC bit adjust
  gain:                 0, $                ;  198  gain
  Comments:             strarr(5), $        ;  200  File Comments
  geometric:            0, $                ;  600  geometric ops: rotate 0x01,
                                            ;       reverse 0x02, flip 0x04
  xlabel:               "", $               ;  602  intensity display string
  cleans:               0, $                ;  618  cleans
  NumSkpPerCln:         0, $                ;  620  number of skips per clean.
  SpecMirrorPos:        intarr(2), $        ;  622  Spectrograph Mirror Positions
  SpecSlitPos:          fltarr(4), $        ;  626  Spectrograph Slit Positions
  AutoCleansActive:     0, $                ;  642  T/F
  UseContCleansInst:    0, $                ;  644  T/F
  AbsorbStripNum:       0, $                ;  646  Absorbance Strip Number
  SpecSlitPosUnits:     0, $                ;  648  Spectrograph Slit Position Units
  SpecGrooves:          0., $               ;  650  Spectrograph Grating Grooves
  srccmp:               0, $                ;  654  number of source comp. diodes
  ydim:                 0, $                ;  656  y dimension of raw data.
  scramble:             0, $                ;  658  0=scrambled,1=unscrambled
  ContinuousCleansFlag: 0, $                ;  660  T/F Continuous Cleans Timing Option
  ExternalTriggerFlag:  0, $                ;  662  T/F External Trigger Timing Option
  lnoscan:              0L, $               ;  664  Number of scans (Early WinX)
  lavgexp:              0L, $               ;  668  Number of Accumulations
  ReadoutTime:          0., $               ;  672  Experiment readout time
  TriggeredModeFlag:    0, $                ;  676  T/F Triggered Timing Option
  Spare_2:              bytarr(10), $       ;  678
  sw_version:           "", $               ;  688  Version of SW creating this file
  type:                 0, $                ;  704  0=1000,1=new120,2=old120,3=130,
                                            ;       st121=4,st138=5,dc131(PentaMax)=6,
                                            ;       st133(MicroMax)=7,st135(GPIB)=8,
                                            ;       VICCD=9, ST116(GPIB)=10,
                                            ;       OMA3(GPIB)=11,OMA4=12
  flatFieldApplied:     0, $                ;  706  1 if flat field was applied.
  Spare_3:              bytarr(16), $       ;  708
  kin_trig_mode:        0, $                ;  724  Kinetics Trigger Mode
  dlabel:               "", $               ;  726  Data label.
  Spare_4:              bytarr(436), $      ;  742
  PulseFileName:        "", $               ;  1178  Name of Pulser File with
                                            ;           Pulse Widths/Delays (for Z-Slice)
  AbsorbFileName:       "", $               ; 1298 Name of Absorbance File (if File Mode)
  NumExpRepeats:        0L, $               ; 1418  Number of Times experiment repeated
  NumExpAccums:         0L, $               ; 1422  Number of Time experiment accumulated
  YT_Flag:              0, $                ; 1426  Set to 1 if this file contains YT data
  clkspd_us:            0., $               ; 1428  Vert Clock Speed in micro-sec
  HWaccumFlag:          0, $                ; 1432  set to 1 if accum done by Hardware.
  StoreSync:            0, $                ; 1434  set to 1 if store sync used.
  BlemishApplied:       0, $                ; 1436  set to 1 if blemish removal applied.
  CosmicApplied:        0, $                ; 1438  set to 1 if cosmic ray removal applied
  CosmicType:           0, $                ; 1440  if cosmic ray applied, this is type.
  CosmicThreshold:      0., $               ; 1442  Threshold of cosmic ray removal.
  NumFrames:            0L, $               ; 1446  number of frames in file.
  MaxIntensity:         0., $               ; 1450  max intensity of data (future)
  MinIntensity:         0., $               ; 1454  min intensity of data (future)
  ylabel:               "", $               ; 1458  y axis label.
  ShutterType:          0, $                ; 1474  shutter type.
  shutterComp:          0., $               ; 1476  shutter compensation time.
  readoutMode:          0, $                ; 1480  readout mode, full,kinetics, etc
  WindowSize:           0, $                ; 1482  window size for kinetics only.
  clkspd:               0, $                ; 1484  clock speed for kinetics & frame transfer.
  interface_type:       0, $                ; 1486  computer interface
                                            ;       (isa-taxi, pci, eisa, etc.)
  NumROIsInExperiment:  0, $                ; 1488  May be more than the 10 allowed in
                                            ;       this header (if 0, assume 1)
  Spare_5:              bytarr(16), $       ; 1490
  controllerNum:        0, $                ; 1506  if multiple controller system will
                                            ;       have controller number data came from.
                                            ;       this is a future item.
  SWmade:               0, $                ; 1508  Which software package created this file
  NumROI:               0, $                ; 1510  number of ROIs used. if 0 assume 1.
  ROIinfoblk:           replicate(ROIinfo, ROIMAX), $     ; 1512  ROI information
  FlatField:            "", $               ; 1632  Flat field file name.
  background:           "", $               ; 1752  background sub. file name.
  blemish:              "", $               ; 1872  blemish file name.
  file_header_ver:      0., $               ; 1992  version of this file header
  YT_Info:              bytarr(1000), $     ; 1996-2996  Reserved for YT information
  WinView_id:           0L, $               ; 2996  == 0x01234567L if in use by WinView
  xcalibration:         {princeton_calibration}, $ ; 3000 -> 3488  X axis calibration
  ycalibration:         {princeton_calibration}, $ ; 3489 -> 3977  Y axis calibration
  Istring:              "", $               ; 3978  special intensity scaling string
  Spare_6:              bytarr(80), $       ; 4018
  lastvalue:            0  $                ; 4098  Always the LAST value in the header
}                                           ; 4100 Bytes Total Header Size

end
;*********************************************************************************************************
function convert_princeton_header, header

; NOTE: the following values should not change, otherwise the header will
; be bleeped up.
HDRNAMEMAX = 120     ; max char str length for file name
USERINFOMAX = 1000   ; user information space.
COMMENTMAX = 80      ; User comment string max length (5 comments)
LABELMAX = 16        ; Label string max length.
FILEVERMAX = 16      ; File version string max length.
DATEMAX = 10         ; string length of file creation date string as ddmmmyyyy\0
ROIMAX = 10          ; Max size of roi array of structures.
TIMEMAX = 7          ; Max time store as hhmmss\0


str = {princeton_header}

str.ControllerVersion      = fix(header, 0)            ;    0  Hardware Version
str.LogicOutput            = fix(header, 2)            ;    2  Definition of Output BNC
str.AmpHiCapLowNoise       = fix(header, 4)            ;    4  Amp Switching Mode
str.xDimDet                = fix(header, 6)            ;    6  Detector x dimension of chip.
str.mode                   = fix(header, 8)            ;    8  timing mode
str.exp_sec                = float(header, 10)         ;   10  alternitive exposure, in sec.
str.VChipXdim              = fix(header, 14)           ;   14  Virtual Chip X dim
str.VChipYdim              = fix(header, 16)           ;   16  Virtual Chip Y dim
str.yDimDet                = fix(header, 18)           ;   18  y dimension of CCD or detector.
temp                       = byte(header, 20, DATEMAX) ;   20  date
str.date                   = string(temp)              ;   20  date
str.VirtualChipFlag        = fix(header, 30)           ;   30  On/Off
str.Spare_1                = byte(header, 32, 2)       ;   32
str.noscan                 = fix(header, 34)           ;   34  Old number of scans - should always be -1
str.DetTemperature         = float(header, 36)         ;   36  Detector Temperature Set
str.DetType                = fix(header, 40)           ;   40  CCD/DiodeArray type
str.xdim                   = fix(header, 42)           ;   42  actual # of pixels on x axis
str.stdiode                = fix(header, 44)           ;   44  trigger diode
str.DelayTime              = float(header, 46)         ;   46  Used with Async Mode
str.ShutterControl         = fix(header, 50)           ;   50  Normal, Disabled Open, Disabled Closed
str.AbsorbLive             = fix(header, 52)           ;   52  On/Off
str.AbsorbMode             = fix(header, 54)           ;   54  Reference Strip or File
str.CanDoVirtualChipFlag   = fix(header, 56)           ;   56  T/F Cont/Chip able to do Virtual Chip
str.ThresholdMinLive       = fix(header, 58)           ;   58  On/Off
str.ThresholdMinVal        = float(header, 60)         ;   60  Threshold Minimum Value
str.ThresholdMaxLive       = fix(header, 64)           ;   64  On/Off
str.ThresholdMaxVal        = float(header, 66)         ;   66  Threshold Maximum Value
str.SpecAutoSpectroMode    = fix(header, 70)           ;   70  T/F Spectrograph Used
str.SpecCenterWlNm         = float(header, 72)         ;   72  Center Wavelength in Nm
str.SpecGlueFlag           = fix(header, 76)           ;   76  T/F File is Glued
str.SpecGlueStartWlNm      = float(header, 78)         ;   78  Starting Wavelength in Nm
str.SpecGlueEndWlNm        = float(header, 82)         ;   82  Starting Wavelength in Nm
str.SpecGlueMinOvrlpNm     = float(header, 86)         ;   86  Minimum Overlap in Nm
str.SpecGlueFinalResNm     = float(header, 90)         ;   90  Final Resolution in Nm
str.PulserType             = fix(header, 94)           ;   94  0=None, PG200=1, PTG=2, DG535=3
str.CustomChipFlag         = fix(header, 96)           ;   96  T/F Custom Chip Used
str.XPrePixels             = fix(header, 98)           ;   98  Pre Pixels in X direction
str.XPostPixels            = fix(header, 100)          ;  100  Post Pixels in X direction
str.YPrePixels             = fix(header, 102)          ;  102  Pre Pixels in Y direction
str.YPostPixels            = fix(header, 104)          ;  104  Post Pixels in Y direction
str.asynen                 = fix(header, 106)          ;  106  asynchron enable flag  0 = off
str.datatype               = fix(header, 108)          ;  108  experiment datatype
                                                       ;       0 =   FLOATING POINT
                                                       ;       1 =   LONG INTEGER
                                                       ;       2 =   INTEGER
                                                       ;       3 =   UNSIGNED INTEGER
str.PulserMode             = fix(header, 110)          ;  110  Repetitive/Sequential
str.PulserOnChipAccums     = fix(header, 112)          ;  112  Num PTG On-Chip Accums
str.PulserRepeatExp        = long(header, 114)         ;  114  Num Exp Repeats (Pulser SW Accum)
str.PulseRepWidth          = float(header, 118)        ;  118  Width Value for Repetitive pulse (usec)
str.PulseRepDelay          = float(header, 122)        ;  122  Width Value for Repetitive pulse (usec)
str.PulseSeqStartWidth     = float(header, 126)        ;  126  Start Width for Sequential pulse (usec)
str.PulseSeqEndWidth       = float(header, 130)        ;  130  End Width for Sequential pulse (usec)
str.PulseSeqStartDelay     = float(header, 134)        ;  134  Start Delay for Sequential pulse (usec)
str.PulseSeqEndDelay       = float(header, 138)        ;  138  End Delay for Sequential pulse (usec)
str.PulseSeqIncMode        = fix(header, 142)          ;  142  Increments: 1=Fixed, 2=Exponential
str.PImaxUsed              = fix(header, 144)          ;  144  PI-Max type controller flag
str.PImaxMode              = fix(header, 146)          ;  146  PI-Max mode
str.PImaxGain              = fix(header, 148)          ;  148  PI-Max Gain
str.BackGrndApplied        = fix(header, 150)          ;  150  1 if background subtraction done
str.PImax2nsBrdUsed        = fix(header, 152)          ;  152  T/F PI-Max 2ns Board Used
str.minblk                 = fix(header, 154)          ;  154  min. # of strips per skips
str.numminblk              = fix(header, 156)          ;  156  # of min-blocks before geo skps
str.SpecMirrorLocation     = fix(header, 158, 2)       ;  158  Spectro Mirror Location, 0=Not Present
str.SpecSlitLocation       = fix(header, 162, 4)       ;  162  Spectro Slit Location, 0=Not Present
str.CustomTimingFlag       = fix(header, 170)          ;  170  T/F Custom Timing Used
temp                       = byte(header, 172, TIMEMAX);  172  Experiment Local Time as hhmmss\0
str.ExperimentTimeLocal    = string(temp)              ;  172  Experiment Local Time as hhmmss\0
temp                       = byte(header, 179, TIMEMAX);  179  Experiment UTC Time as hhmmss\0
str.ExperimentTimeUTC      = string(temp)              ;  179  Experiment UTC Time as hhmmss\0
str.ExposUnits             = fix(header, 186)          ;  186  User Units for Exposure
str.ADCoffset              = fix(header, 188)          ;  188  ADC offset
str.ADCrate                = fix(header, 190)          ;  190  ADC rate
str.ADCtype                = fix(header, 192)          ;  192  ADC type
str.ADCresolution          = fix(header, 194)          ;  194  ADC resolution
str.ADCbitAdjust           = fix(header, 196)          ;  196  ADC bit adjust
str.gain                   = fix(header, 198)          ;  198  gain
temp                       = byte(header, 200, COMMENTMAX, 5) ;  200  File Comments
str.Comments               = string(temp)              ;  200  File Comments
str.geometric              = fix(header, 600)          ;  600  geometric ops: rotate 0x01,
                                                        ;       reverse 0x02, flip 0x04
temp                       = byte(header, 602, LABELMAX) ;  602  intensity display string
str.xlabel                 = string(temp)              ;  602  intensity display string
str.cleans                 = fix(header, 618)          ;  618  cleans
str.NumSkpPerCln           = fix(header, 620)          ;  620  number of skips per clean.
str.SpecMirrorPos          = fix(header, 622, 2)       ;  622  Spectrograph Mirror Positions
str.SpecSlitPos            = float(header, 626, 4)     ;  626  Spectrograph Slit Positions
str.AutoCleansActive       = fix(header, 642)          ;  642  T/F
str.UseContCleansInst      = fix(header, 644)          ;  644  T/F
str.AbsorbStripNum         = fix(header, 646)          ;  646  Absorbance Strip Number
str.SpecSlitPosUnits       = fix(header, 648)          ;  648  Spectrograph Slit Position Units
str.SpecGrooves            = float(header, 650)        ;  650  Spectrograph Grating Grooves
str.srccmp                 = fix(header, 654)          ;  654  number of source comp. diodes
str.ydim                   = fix(header, 656)          ;  656  y dimension of raw data.
str.scramble               = fix(header, 658)          ;  658  0=scrambled,1=unscrambled
str.ContinuousCleansFlag   = fix(header, 660)          ;  660  T/F Continuous Cleans Timing Option
str.ExternalTriggerFlag    = fix(header, 662)          ;  662  T/F External Trigger Timing Option
str.lnoscan                = long(header, 664)         ;  664  Number of scans (Early WinX)
str.lavgexp                = long(header, 668)         ;  668  Number of Accumulations
str.ReadoutTime            = float(header, 672)        ;  672  Experiment readout time
str.TriggeredModeFlag      = fix(header, 676)          ;  676  T/F Triggered Timing Option
str.Spare_2                = byte(header, 678, 10)     ;  678
temp                       = byte(header, FILEVERMAX)  ;  688  Version of SW creating this file
str.sw_version             = string(temp)              ;  688  Version of SW creating this file
str.type                   = fix(header, 704)          ;  704  0=1000,1=new120,2=old120,3=130,
                                                       ;       st121=4,st138=5,dc131(PentaMax)=6,
                                                       ;       st133(MicroMax)=7,st135(GPIB)=8,
                                                       ;       VICCD=9, ST116(GPIB)=10,
                                                       ;       OMA3(GPIB)=11,OMA4=12
str.flatFieldApplied       = fix(header, 706)          ;  706  1 if flat field was applied.
str.Spare_3                = byte(header, 708, 16)     ;  708
str.kin_trig_mode          = fix(header, 724)          ;  724  Kinetics Trigger Mode
temp                       = byte(header, 726, LABELMAX);  726  Data label.
str.dlabel                 = string(temp)              ;  726  Data label.
str.Spare_4                = byte(header, 742, 436)    ;  742
temp                       = byte(header, 1178, HDRNAMEMAX) ;  1178  Name of Pulser File with
                                                       ;           Pulse Widths/Delays (for Z-Slice)
str.PulseFileName          = string(temp)              ;  1178  Name of Pulser File with
                                                       ;           Pulse Widths/Delays (for Z-Slice)
temp                       = byte(header, 1298, HDRNAMEMAX) ; 1298 Name of Absorbance File (if File Mode)
str.AbsorbFileName         = string(temp)              ; 1298 Name of Absorbance File (if File Mode)
str.NumExpRepeats          = long(header, 1418)        ; 1418  Number of Times experiment repeated
str.NumExpAccums           = long(header, 1422)        ; 1422  Number of Time experiment accumulated
str.YT_Flag                = fix(header, 1426)         ; 1426  Set to 1 if this file contains YT data
str.clkspd_us              = float(header, 1428)       ; 1428  Vert Clock Speed in micro-sec
str.HWaccumFlag            = fix(header, 1432)         ; 1432  set to 1 if accum done by Hardware.
str.StoreSync              = fix(header, 1434)         ; 1434  set to 1 if store sync used.
str.BlemishApplied         = fix(header, 1436)         ; 1436  set to 1 if blemish removal applied.
str.CosmicApplied          = fix(header, 1438)         ; 1438  set to 1 if cosmic ray removal applied
str.CosmicType             = fix(header, 1440)         ; 1440  if cosmic ray applied, this is type.
str.CosmicThreshold        = float(header, 1442)       ; 1442  Threshold of cosmic ray removal.
str.NumFrames              = long(header, 1446)        ; 1446  number of frames in file.
str.MaxIntensity           = float(header, 1450)       ; 1450  max intensity of data (future)
str.MinIntensity           = float(header, 1454)       ; 1454  min intensity of data (future)
temp                       = byte(header, 1458, LABELMAX) ; 1458  y axis label.
str.ylabel                 = string(temp)              ; 1458  y axis label.
str.ShutterType            = fix(header, 1474)         ; 1474  shutter type.
str.shutterComp            = float(header, 1476)       ; 1476  shutter compensation time.
str.readoutMode            = fix(header, 1480)         ; 1480  readout mode, full,kinetics, etc
str.WindowSize             = fix(header, 1482)         ; 1482  window size for kinetics only.
str.clkspd                 = fix(header, 1484)         ; 1484  clock speed for kinetics & frame transfer.
str.interface_type         = fix(header, 1486)         ; 1486  computer interface
                                                       ;       (isa-taxi, pci, eisa, etc.)
str.NumROIsInExperiment    = fix(header, 1488)         ; 1488  May be more than the 10 allowed in
                                                       ;       this header (if 0, assume 1)
str.Spare_5                = byte(header, 1490, 16)    ; 1490
str.controllerNum          = fix(header, 1506)         ; 1506  if multiple controller system will
                                                       ;       have controller number data came from.
                                                       ;       this is a future item.
str.SWmade                 = fix(header, 1508)             ; 1508  Which software package created this file
str.NumROI                 = fix(header, 1510)             ; 1510  number of ROIs used. if 0 assume 1.
str.ROIinfoblk             = replicate({princeton_ROIinfo}, ROIMAX)    ; 1512  ROI information  NEEDS WORK
temp                       = byte(header, 1632, HDRNAMEMAX) ; 1632  Flat field file name.
str.FlatField              = string(temp)                   ; 1632  Flat field file name.
temp                       = byte(header, 1752, HDRNAMEMAX) ; 1752  background sub. file name.
str.background             = string(temp)                   ; 1752  background sub. file name.
temp                       = byte(header, 1872, HDRNAMEMAX) ; 1872  blemish file name.
str.blemish                = string(temp)                   ; 1872  blemish file name.
str.file_header_ver        = float(header, 1992)            ; 1992  version of this file header
str.YT_Info                = byte(header, 1996, 1000)  ; 1996-2996  Reserved for YT information
str.WinView_id             = long(header, 2996)        ; 2996  == 0x01234567L if in use by WinView
offset = 3000                                          ; 3000 -> 3488  X axis calibration
str.xcalibration.offset         = double(header, offset)
str.xcalibration.factor         = double(header, offset+8)
str.xcalibration.current_unit   = byte(header, offset+16)
str.xcalibration.CalibReserved1 = byte(header, offset+17)
str.xcalibration.display_string = byte(header, offset+18, 40)
str.xcalibration.CalibReserved2 = byte(header, offset+58, 40)
str.xcalibration.calib_valid    = byte(header, offset+98)
str.xcalibration.input_unit     = byte(header, offset+99)
str.xcalibration.polynounit     = byte(header, offset+100)
str.xcalibration.polynoorder    = byte(header, offset+101)
str.xcalibration.calib_count    = byte(header, offset+102)
str.xcalibration.pixel_position = double(header, offset+103, 10)
str.xcalibration.calib_value    = double(header, offset+183, 10)
str.xcalibration.polynocoeff    = double(header, offset+263, 6)
str.xcalibration.laser_position = double(header, offset+311)
str.xcalibration.CalibReserved3 = byte(header, offset+319)
str.xcalibration.leftover_flag  = byte(header, offset+320)
str.xcalibration.user_label     = byte(header, offset+321, 40)
str.xcalibration.expansion      = byte(header, offset+361, 128)
str.ycalibration           = {princeton_calibration}
offset = 3489
                                         ; 3489 -> 3977  Y axis calibration
str.ycalibration.offset         = double(header, offset)
str.ycalibration.factor         = double(header, offset+8)
str.ycalibration.current_unit   = byte(header, offset+16)
str.ycalibration.CalibReserved1 = byte(header, offset+17)
str.ycalibration.display_string = byte(header, offset+18, 40)
str.ycalibration.CalibReserved2 = byte(header, offset+58, 40)
str.ycalibration.calib_valid    = byte(header, offset+98)
str.ycalibration.input_unit     = byte(header, offset+99)
str.ycalibration.polynounit     = byte(header, offset+100)
str.ycalibration.polynoorder    = byte(header, offset+101)
str.ycalibration.calib_count    = byte(header, offset+102)
str.ycalibration.pixel_position = double(header, offset+103, 10)
str.ycalibration.calib_value    = double(header, offset+183, 10)
str.ycalibration.polynocoeff    = double(header, offset+263, 6)
str.ycalibration.laser_position = double(header, offset+311)
str.ycalibration.CalibReserved3 = byte(header, offset+319)
str.ycalibration.leftover_flag  = byte(header, offset+320)
str.ycalibration.user_label     = byte(header, offset+321, 40)
str.ycalibration.expansion      = byte(header, offset+361, 128)
temp                       = byte(header, 3978, 40)    ; 3978  special intensity scaling string
Istring                    = string(temp)              ; 3978  special intensity scaling string
str.Spare_6                = byte(header, 4018, 80)    ; 4018
str.lastvalue              = fix(header, 4098)         ; 4098  Always the LAST value in the header
                                                       ; 4100 Bytes Total Header Size

; If this is a big-endian machine swap the byte order
; I don't know of a built-in IDL test for endianness, do it ourselves
t1 = 1
t2 = 1
byteorder, t2, /sswap, /swap_if_big_endian
big_endian = (t1 ne t2)
if (big_endian) then str = swap_endian(str)
return, str
end
;******************************************************************************************************
;-----------------------------------------------------------------
pro OnLoadSpec, Event
    idTEXT_display=Widget_Info(Event.top,find_by_uname='TEXT_Display')
    idTEXT_mode=widget_info(event.top, find_by_uname='TEXT_mode')

    widget_control, idTEXT_mode, get_value=testparam
    testparam=strtrim(string(testparam),1)
    if testparam eq '' then begin
       OnRunTParam, event
    endif

    common defaultdir

    ;Specify the directory
    idTEXT_DataPath=Widget_Info(Event.top,find_by_uname='TEXT_DataPath')
    widget_control, idTEXT_DataPath, get_value=datadir
    datadir=string(datadir)
    if datadir ne '' then begin
        pathtest=findfile(filepath('*.*',root_dir=datadir),count=cn)
        if cn gt 0 then begin
            cd, datadir
        endif
    endif


    idTEXT_file=widget_info(Event.top, FIND_BY_UNAME='TEXT_File')
    ;

    OPENFILE= dialog_pickfile(/read, filter='*.SPE')
    ;   print, 'open....',openfile
    if openfile ne '' then begin
        widget_control, idTEXT_File, set_value=string(openfile)
        filedir=strmid(openfile, 0, strpos(openfile,'\',/reverse_search))
        widget_control, idTEXT_DataPath, set_value=string(filedir)
        widget_control, idTEXT_display, set_value='File loaded:  '+string(openfile)
    endif

    cd, defdir

end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnLoadStand, stand_file=stand_file, Event
    idTEXT_display=Widget_Info(Event.top,find_by_uname='TEXT_Display')
    idDROPLIST_RunT=Widget_Info(Event.top,find_by_uname='RunT_DROPLIST')

    widget_control, idDROPLIST_RunT, get_value=v_side
    n_side=widget_info(idDROPLIST_RunT, /droplist_select)


    if n_elements(stand_file) eq 0 then stand_file=0
    common defaultdir

    ;Specify the directory
    idTEXT_StandPath=Widget_Info(Event.top,find_by_uname='TEXT_StandPath')
    idLABEL_stand_0=widget_info(Event.top, FIND_BY_UNAME='LABEL_stand_0')

    widget_control, idTEXT_StandPath, get_value=standdir
    standdir=string(standdir)
    if standdir ne '' then begin
        pathtest=findfile(filepath('*.SPE',root_dir=standdir),count=cn)
        if cn gt 0 then begin
         cd, standdir
        endif
    endif

    idTEXT_file=widget_info(Event.top, FIND_BY_UNAME='TEXT_File')

    idTEXT_stand=widget_info(Event.top, FIND_BY_UNAME='TEXT_StandFile')
    idLABEL_stand_0=widget_info(Event.top, FIND_BY_UNAME='LABEL_stand_0')
    ;widget_control, idTEXT_standFile, get_value=openstand

    OPENStand= dialog_pickfile(/read, filter='*.SPE', title='Select a standard file')
    if OPENStand ne '' then begin


        if stand_file eq 0 then begin
            widget_control, idTEXT_stand, set_value=string(openstand)
        endif else begin
            widget_control, idLABEL_stand_0, set_value=string(openstand)
        endelse
        standdir=strmid(openstand, 0, strpos(openstand,'\',/reverse_search))
        widget_control, idTEXT_StandPath, set_value=string(standdir)
        widget_control, idTEXT_display, set_value='Standard File loaded:  '+string(openstand)
        cd, standdir
    endif
    ;If "Both" side, load another standard file for larger row numbers

    if v_side(n_side) eq 'Both' then begin

       widget_control, idLABEL_stand_0,SENSITIVE=1
       widget_control, idLABEL_stand_0, get_value=test_sfile_0
       test_sfile_0=string(test_sfile_0)
       if test_sfile_0 eq 'Display the second standard file' then begin
         ;ttt=dialog_message('Second standard file required!',/information)
         sfile_0= dialog_pickfile(/read, filter='*.SPE', title='Load the second standard file')
         if sfile_0 ne '' then begin
                  widget_control, idLABEL_stand_0, set_value=string(sfile_0)
         endif

       endif

    endif else begin
       widget_control, idLABEL_stand_0,SENSITIVE=0
    endelse
   cd, defdir
end
;-----------------------------------------------------------------
;-----------------------------------------------------------------
pro OnCalcTSingle, Event
    idTEXT_mode=widget_info(event.top, find_by_uname='TEXT_mode')

    widget_control, idTEXT_mode, get_value=testparam
    testparam=strtrim(string(testparam),1)
    if testparam eq '' then begin
       OnRunTParam, event
    endif

    ;OnRunTParam, event
    ;Define files
    COMMON idraw
    COMMON f_result, fit_result, fit_result_0

    idTEXT_file=widget_info(Event.top, FIND_BY_UNAME='TEXT_File')
    idTEXT_stand=widget_info(Event.top, FIND_BY_UNAME='TEXT_StandFile')
    idLABEL_stand_0=widget_info(Event.top, FIND_BY_UNAME='LABEL_stand_0')
    idDROPLIST_side1=Widget_Info(Event.top,find_by_uname='DROPLIST_Side1')
    idDROPLIST_side2=Widget_Info(Event.top,find_by_uname='DROPLIST_Side2')
    idLABEL_side1=Widget_Info(Event.top,find_by_uname='LABEL_Side1')
    idLABEL_side2=Widget_Info(Event.top,find_by_uname='LABEL_Side2')
    idTEXT_StartWav=Widget_Info(Event.top,find_by_uname='TEXT_StartWav')
    idTEXT_display=Widget_Info(Event.top,find_by_uname='TEXT_Display')



    idDRAW_0=Widget_Info(Event.top,find_by_uname='DRAW_0')
    idDRAW_1=Widget_Info(Event.top,find_by_uname='DRAW_1')
    widget_control, idDRAW_0, get_value=idraw_0
    widget_control, idDRAW_1, get_value=idraw_1
    ;print, 'testttttt', idraw_0, idraw_1

    widget_control, idTEXT_File, get_value=file
    file=string(file)
    if file eq '' then begin
        ;ttt=dialog_message('Load a file first!', /information)
        OnLoadSpec, event
        widget_control, idTEXT_File, get_value=file
    endif
    file=strtrim(string(file),1)
    ;print, file
    widget_control, idTEXT_stand, get_value=sfile
    sfile=string(sfile)
    if sfile eq '' then begin
        ;ttt=dialog_message('Load a standard file first!', /information)
        OnLoadStand, event
        widget_control, idTEXT_stand, get_value=sfile
    endif
    sfile=strtrim(string(sfile),1)
    ;print, sfile


    ;Load parameters
    ;OnApplyParam, Event
    widget_control, idTEXT_StartWav, get_value=startw
        startw=string(startw)
    if startw eq '' then begin
        OnRunTParam, event
        OnApplyParam, Event
    endif
    COMMON parameter
    COMMON Standlamp
    ;print, '/////////////////////////', startrow
    startrow=fix(startrow)
    numrow=fix(numrow)
    startrow_0=fix(startrow_0)
    numrow_0=fix(numrow_0)
    bin=fix(bin)
    bin_0=fix(bin_0)
    average=fix(average)
    average_0=fix(average_0)
    nmode=fix(nmode)
    nside=fix(nside)
    nemis=fix(nemis)

    if nside eq 2 then begin
       widget_control, idLABEL_stand_0, get_value=sfile_0
       print, sfile_0
    endif

    widget_control, idDROPLIST_side1, get_value=v_side1
    n_side1=widget_info(idDROPLIST_side1,/droplist_select)
    widget_control, idDROPLIST_side2, get_value=v_side2
    n_side2=widget_info(idDROPLIST_side2,/droplist_select)


    ;Single side
    if nside ne 2 then begin
       if nmode eq 1 then begin
         if nemis eq 1 then begin
          fit_result=SpecT_p(file, sfile, startwav, endwav,startrow,numrow, disp=6)
         endif else begin
          fit_result=SpecT_p(file, sfile,startwav,endwav,StartRow,NumRow, set_planck=1, emis1=emis1, disp=6)
         endelse
         widget_control, idTEXT_display, set_value=file
         tem=strtrim(string(fit_result(0),format='(f7.1)'),1)
         temerr=strtrim(string(fit_result(1), format='(f4.1)'),1)
         widget_control, idTEXT_display, set_value='T = '+tem+' +/- '+temerr+' K',/APPEND
         if fit_result(0) eq 300. then begin
            widget_control, idTEXT_display, set_value='Signal too weak!', /APPEND
         endif
       endif else begin
         if nemis eq 1 then begin
            if v_side1(n_side1) eq 'Planck Fit' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average,disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average,disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average,disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, disp=4)
            ;help, fit_result
         endif else begin
            if v_side1(n_side1) eq 'Planck Fit' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average,set_planck=1, emis1=emis1,disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average,set_planck=1, emis1=emis1,disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average,set_planck=1, emis1=emis1,disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
              fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, set_planck=1, emis1=emis1,disp=4)
         endelse
         numpoint = fix(numrow/bin)
         midnum=fix(numpoint/2)
         av=fix((average-1)/2)
         temp=0.
         temperr=0.
         for m=midnum-av, midnum+av do temp=temp+fit_result(m,0)
         for m=midnum-av, midnum+av do temperr=temperr+fit_result(m,1)
         temp=temp/average
         temperr=temperr/average
         tem=strtrim(string(temp,format='(f7.1)'),1)
         temerr=strtrim(string(temperr,format='(f4.1)'),1)
         widget_control, idTEXT_display, set_value=file
         widget_control, idTEXT_display, set_value='T = '+tem+' +/- '+temerr+' K',/APPEND
         if tem eq '300.0' then begin
           widget_control, idTEXT_display, set_value='Side Signal too weak!', /APPEND
         endif
       endelse

    ;Both side
    endif else begin
       if nmode eq 1 then begin
         if nemis eq 1 then begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_p(file, sfile, startwav, endwav,startrow,numrow, disp=0)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_p(file, sfile, startwav, endwav,startrow,numrow, disp=2)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_p(file, sfile_0, startwav, endwav,startrow_0,numrow_0, disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_p(file, sfile_0, startwav, endwav,startrow_0,numrow_0, disp=3)
         endif else begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_p(file, sfile, startwav, endwav,startrow,numrow,set_planck=1, emis1=emis1, disp=0)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_p(file, sfile, startwav, endwav,startrow,numrow,set_planck=1, emis1=emis1, disp=2)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_p(file, sfile_0, startwav, endwav,startrow_0,numrow_0,set_planck=1, emis1=emis1, disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_p(file, sfile_0, startwav, endwav,startrow_0,numrow_0,set_planck=1, emis1=emis1, disp=3)
         endelse
         widget_control, idTEXT_display, set_value=file
         tem=strtrim(string(fit_result(0),format='(f7.1)'),1)
         temerr=strtrim(string(fit_result(1), format='(f4.1)'),1)
         widget_control, idTEXT_display, set_value='T1 = '+tem+' +/- '+temerr+' K',/APPEND
         if tem eq '300.0' then begin
           widget_control, idTEXT_display, set_value='Side-1 signal too weak!', /APPEND
         endif
         tem_0=strtrim(string(fit_result_0(0),format='(f7.1)'),1)
         temerr_0=strtrim(string(fit_result_0(1), format='(f4.1)'),1)
         widget_control, idTEXT_display, set_value='T2 = '+tem_0+' +/- '+temerr_0+' K',/APPEND
         if tem_0 eq '300.0' then begin
           widget_control, idTEXT_display, set_value='Side-2 signal too weak!', /APPEND
         endif

       endif else begin
         if nemis eq 1 then begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
             fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, disp=1)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, disp=6)
            if v_side1(n_side1) eq 'Intensity Profile' then $
             fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, disp=8)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=7)
            if v_side2(n_side2) eq 'T Profile' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=5)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=4)
         endif else begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_s(file, sfile, startwav, endwav,startrow,numrow,bin,average, set_planck=1, emis1=emis1,disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
             fit_result=specT_s(file, sfile, startwav, endwav,startrow,numrow,bin,average, set_planck=1, emis1=emis1,disp=1)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, set_planck=1, emis1=emis1,disp=6)
            if v_side1(n_side1) eq 'Intensity Profile' then $
             fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, set_planck=1, emis1=emis1,disp=8)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=7)
            if v_side2(n_side2) eq 'T Profile' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=5)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
             fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=4)
         endelse

         numpoint = fix(numrow/bin)
         midnum=fix(numpoint/2)
         av=fix((average-1)/2)
         temp=0.
         temperr=0.
         for m=midnum-av, midnum+av do temp=temp+fit_result(m,0)
         for m=midnum-av, midnum+av do temperr=temperr+fit_result(m,1)
         temp=temp/average
         temperr=temperr/average
         tem=strtrim(string(temp,format='(f7.1)'),1)
         temerr=strtrim(string(temperr,format='(f4.1)'),1)
         widget_control, idTEXT_display, set_value=file
         widget_control, idTEXT_display, set_value='T1 = '+tem+' +/- '+temerr+' K',/APPEND
         if tem eq '300.0' then begin
           widget_control, idTEXT_display, set_value='Side-1 signal too weak!', /APPEND
         endif

         numpoint_0 = fix(numrow_0/bin_0)
         midnum_0=fix(numpoint_0/2)
         av_0=fix((average_0-1)/2)
         temp_0=0.
         temperr_0=0.
         for m=midnum_0-av_0, midnum_0+av_0 do temp_0=temp_0+fit_result_0(m,0)
         for m=midnum_0-av_0, midnum_0+av_0 do temperr_0=temperr_0+fit_result_0(m,1)
         temp_0=temp_0/average_0
         temperr_0=temperr_0/average_0
         tem_0=strtrim(string(temp_0,format='(f7.1)'),1)
         temerr_0=strtrim(string(temperr_0,format='(f4.1)'),1)
         ;widget_control, idTEXT_display, set_value=file, /APPEND
         widget_control, idTEXT_display, set_value='T2 = '+tem_0+' +/- '+temerr_0+' K',/APPEND
         if tem_0 eq '300.0' then begin
           widget_control, idTEXT_display, set_value='Side-2 signal too weak!', /APPEND
         endif
       endelse
    endelse
    ;help, fit_result
end
;-----------------------------------------------------------------
pro OnCalcTMulti, Event
    idTEXT_mode=widget_info(event.top, find_by_uname='TEXT_mode')

    widget_control, idTEXT_mode, get_value=testparam
    testparam=strtrim(string(testparam),1)
    if testparam eq '' then begin
       OnRunTParam, event
    endif

    idTEXT_file=widget_info(Event.top, FIND_BY_UNAME='TEXT_File')
    idTEXT_stand=widget_info(Event.top, FIND_BY_UNAME='TEXT_StandFile')
    idLABEL_stand_0=widget_info(Event.top, FIND_BY_UNAME='LABEL_stand_0')
    idTEXT_firstfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_firstfile')
    idTEXT_lastfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_lastfile')
    idDROPLIST_side1=Widget_Info(Event.top,find_by_uname='DROPLIST_Side1')
    idDROPLIST_side2=Widget_Info(Event.top,find_by_uname='DROPLIST_Side2')
    idLABEL_side1=Widget_Info(Event.top,find_by_uname='LABEL_Side1')
    idLABEL_side2=Widget_Info(Event.top,find_by_uname='LABEL_Side2')

    widget_control, idDROPLIST_side1, get_value=v_side1
    n_side1=widget_info(idDROPLIST_side1,/droplist_select)
    widget_control, idDROPLIST_side2, get_value=v_side2
    n_side2=widget_info(idDROPLIST_side2,/droplist_select)


    widget_control, idTEXT_File, get_value=file
    if n_elements(file) eq 0 then begin
        ttt=dialog_message('Specify file(s) first!', /information)
        OnLoadSpec, event
        widget_control, idTEXT_File, get_value=file
    endif
    rootfile=string(file)
    print, file

    widget_control, idTEXT_stand, get_value=sfile
    if n_elements(sfile) eq 0 then begin
        ttt=dialog_message('Load a standard file first!', /information)
        OnLoadStand, event
        widget_control, idTEXT_stand, get_value=sfile
    endif
    sfile=string(sfile)
    print, sfile

    ;Load parameters
    ;OnApplyParam, Event
    COMMON parameter
    COMMON Standlamp
    COMMON mf_result, mfit_result, mfit_result_0
    COMMON m3f_result, m3fit_result, m3fit_result_0
    ;print, '/////////////////////////', startrow
    startrow=fix(startrow)
    numrow=fix(numrow)
    startrow_0=fix(startrow_0)
    numrow_0=fix(numrow_0)
    bin=fix(bin)
    bin_0=fix(bin_0)
    average=fix(average)
    average_0=fix(average_0)
    nmode=fix(nmode)
    nside=fix(nside)
    nemis=fix(nemis)
    numpoint=numrow/bin
    numpoint_0=numrow_0/bin_0

    if nside eq 2 then begin
       widget_control, idLABEL_stand_0, get_value=sfile_0
       print, sfile_0
    endif

    widget_control, idTEXT_firstfile, get_value=firstfile
       firstfile=fix(string(firstfile))
       firstfile=firstfile(0)

    widget_control, idTEXT_lastfile, get_value=lastfile
       lastfile=fix(string(lastfile))
       lastfile=lastfile(0)
       print, 'lastfile', lastfile
       help, firstfile, lastfile

    ;name=rootfile+'*'+'.spe'
    ;file=findfile(name,count=n)

    ;if n_elements(firstfile) eq 0 then firstfile=1
    ;if n_elements(lastfile) eq 0 then lastfile=n


    nfile=lastfile-firstfile+1

    mfit_result=fltarr(4,nfile)
    m3fit_result=fltarr(numpoint,4,nfile)
    mfit_result_0=fltarr(4,nfile)
    m3fit_result_0=fltarr(numpoint_0,4,nfile)

    file=strarr(nfile)

    for i=0, nfile-1 do begin
      file(i)=rootfile+strtrim(string(i+firstfile),1)+'.spe'
         ;print, file
     if nside ne 2 then begin
       if nmode eq 1 then begin
         if nemis eq 1 then begin
          fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow, disp=6)
         endif else begin
          fit_result=specT_p(file(i), sfile,startwav,endwav,StartRow,NumRow, set_planck=1, emis1=emis1, disp=6)
         endelse
         mfit_result(*,i)=fit_result
       endif else begin
         if nemis eq 1 then begin
            if v_side1(n_side1) eq 'Planck Fit' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average,disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average,disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average,disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, disp=4)
            ;help, fit_result
         endif else begin
            if v_side1(n_side1) eq 'Planck Fit' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average,set_planck=1, emis1=emis1,disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average,set_planck=1, emis1=emis1,disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average,set_planck=1, emis1=emis1,disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
              fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, set_planck=1, emis1=emis1,disp=4)
         endelse
         m3fit_result(*,*,i)=fit_result
       endelse
    ;Both side
    endif else begin
       if nmode eq 1 then begin
         if nemis eq 1 then begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow, disp=0)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow, disp=2)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_p(file(i), sfile_0, startwav, endwav,startrow_0,numrow_0, disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_p(file(i), sfile_0, startwav, endwav,startrow_0,numrow_0, disp=3)
         endif else begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow,set_planck=1, emis1=emis1, disp=0)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow,set_planck=1, emis1=emis1, disp=2)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_p(file(i), sfile_0, startwav, endwav,startrow_0,numrow_0,set_planck=1, emis1=emis1, disp=1)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_p(file(i), sfile_0, startwav, endwav,startrow_0,numrow_0,set_planck=1, emis1=emis1, disp=3)
         endelse
         mfit_result(*,i)=fit_result
         mfit_result_0(*,i)=fit_result_0
       endif else begin
         if nemis eq 1 then begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
             fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, disp=1)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, disp=6)
            if v_side1(n_side1) eq 'Intensity Profile' then $
             fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, disp=8)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=7)
            if v_side2(n_side2) eq 'T Profile' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=5)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=4)
         endif else begin
            if v_side1(n_side1) eq 'Planck Fit' then $
             fit_result=specT_s(file(i), sfile, startwav, endwav,startrow,numrow,bin,average, set_planck=1, emis1=emis1,disp=3)
            if v_side1(n_side1) eq 'T Profile' then $
             fit_result=specT_s(file(i), sfile, startwav, endwav,startrow,numrow,bin,average, set_planck=1, emis1=emis1,disp=1)
            if v_side1(n_side1) eq 'Spectra' then $
             fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, set_planck=1, emis1=emis1,disp=6)
            if v_side1(n_side1) eq 'Intensity Profile' then $
             fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average, set_planck=1, emis1=emis1,disp=8)
            if v_side2(n_side2) eq 'Planck Fit' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=7)
            if v_side2(n_side2) eq 'T Profile' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=5)
            if v_side2(n_side2) eq 'Spectra' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=2)
            if v_side2(n_side2) eq 'Intensity Profile' then $
             fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1, emis1=emis1,disp=4)
         endelse
         m3fit_result(*,*,i)=fit_result
         m3fit_result_0(*,*,i)=fit_result_0
       endelse
    endelse
 endfor


;            if nside ne 2 then begin
;            if nmode eq 1 then begin
;
;                if nemis eq 1 then begin
;                    fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow)
;                    mfit_result(*,i)=fit_result
;                endif else begin
;                    fit_result=specT_p(file(i), sfile,startwav,endwav,StartRow,NumRow, set_planck=1, emis1=emis1)
;                    mfit_result(*,i)=fit_result
;                endelse
;            endif else begin
;
;                if nemis eq 1 then begin
;                ;print, 'hereeeeeeeee'
;                    ;print, file(i-1)
;                    fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average)
;                 ;print, fit_result(0,0)
;                    m3fit_result(*,0,i)=fit_result(*,0)
;                endif else begin
;                    fit_result=specT_s(file(i), sfile, startwav, endwav,startrow,numrow, set_planck=1, emis1=emis1)
;                    m3fit_result(*,*,i)=fit_result
;                endelse
;            endelse
;         endif else begin
;            if nmode eq 1 then begin
;
;                if nemis eq 1 then begin
;                    fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow)
;                    mfit_result(*,i)=fit_result
;                    fit_result_0=specT_p(file(i), sfile_0, startwav, endwav,startrow_0,numrow_0)
;                    mfit_result_0(*,i)=fit_result_0
;                endif else begin
;                    fit_result=specT_p(file(i), sfile, startwav, endwav,startrow,numrow, set_planck=1, emis1=emis1)
;                    mfit_result(*,i)=fit_result
;                    fit_result_0=specT_p(file(i), sfile_0, startwav, endwav,startrow_0,numrow_0, set_planck=1, emis1=emis1)
;                    mfit_result_0(*,i)=fit_result_0
;                endelse
;            endif else begin
;
;                if nemis eq 1 then begin
;                    fit_result=specT_s(file(i), sfile, startwav,endwav,startrow,numrow, bin, average)
;                    m3fit_result(*,*,i)=fit_result
;                    fit_result_0=specT_s(file(i), sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0)
;                    m3fit_result_0(*,*,i)=fit_result_0
;                endif else begin
;                    fit_result=specT_s(file(i), sfile, startwav, endwav,startrow,numrow,bin,average, set_planck=1, emis1=emis1)
;                    m3fit_result(*,*,i)=fit_result
;                    fit_result_0=specT_s(file(i), sfile_0, startwav, endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1,emis1=emis1)
;                    m3fit_result_0(*,*,i)=fit_result_0
;                endelse
;            endelse
;          endelse
;    endfor
   ;print, 'mfitttttt', m3fit_result(0,0,*)
end
;-----------------------------------------------------------------

pro OnSaveT, nfile=nfile, Event
    COMMON f_result
    COMMON mf_result
    COMMON m3f_result
    ;OnApplyParam, Event
    COMMON parameter
    nmode=fix(nmode)
    nside=fix(nside)

    idDROPLIST_ftd=widget_info(Event.top, FIND_BY_UNAME='DROPLIST_FileToDo')
    idTEXT_firstfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_firstfile')
    idTEXT_lastfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_lastfile')
    idTEXT_file=widget_info(Event.top, FIND_BY_UNAME='TEXT_File')
    idTEXT_display=widget_info(Event.top, FIND_BY_UNAME='TEXT_Display')
    idTEXT_standfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_StandFile')

    widget_control, idTEXT_standfile, get_value=sfile
    sfile=strtrim(string(sfile),1)

    widget_control, idTEXT_file, get_value=file
    if n_elements(nfile) eq 0 then nfile=0
    if nfile eq 0 then begin

        if n_elements(file) eq 0 then begin
            ttt=dialog_message('Load a file first!', /information)
            OnLoadSpec, event
            widget_control, idTEXT_File, get_value=file
        endif
        ;print, string(file)
        file=strtrim(string(file))
        ;print, file
        a=strpos(file,'.SPE')
        ;print, a

        if a gt 1 then begin
          temfile=strmid(file,0,strlen(file)-4) + '.tem'
        endif else begin
          temfile=file+'.tem'
        endelse
    endif else begin
            temfile=dialog_pickfile(/write, filter=['*.tem', '*.*'])
    endelse

    if temfile ne '' then begin

        widget_control, idTEXT_display, set_value='File saved:  '+string(temfile)

        widget_control, idTEXT_firstfile, get_value=firstfile
        firstfile=fix(string(firstfile))
        firstfile=firstfile(0)
        widget_control, idTEXT_lastfile, get_value=lastfile
        lastfile=fix(string(lastfile))
        lastfile=lastfile(0)


        widget_control, idDROPLIST_ftd, get_value=v_ftd
        n_ftd=widget_info(idDROPLIST_ftd,/droplist_select)

        if v_ftd(n_ftd) eq 'Single file' then begin
            if nmode eq 1 then begin
            ; print, 'this is a test'
                openw, lun, temfile, /get_lun
                printf, lun, 'Temperature Data'
                printf, lun, 'File:', file
                printf, lun, 'Standard file: ', sfile
                printf, lun, 'Mode: Pinhole'
                printf, lun, '-------------------------------------------------------------------------'
                if nside ne 2 then begin
                    printf, lun, 'T(K): ',fit_result(0), fit_result(1)
                endif else begin
                    printf, lun, 'T1(K): ',fit_result(0), fit_result(1)
                    printf, lun, 'T2(K): ',fit_result_0(0), fit_result_0(1)
                endelse
                free_lun, lun
            endif else begin
                nsize=size(fit_result)
                print, 'nsize', nsize(1)
                openw, lun, temfile, /get_lun
                printf, lun, 'Temperature Data'
                printf, lun, 'File:', file
                printf, lun, 'Standard file: ', sfile
                printf, lun, 'Mode: Slit'
                printf, lun, '-------------------------------------------------------------------------'
                if nside ne 2 then begin
                    for k=0, nsize(1)-1 do printf, lun, 'T(K):',k+1,':', fit_result(k,0), fit_result(k,1)

                endif else begin
                    for k=0, nsize(1)-1 do printf, lun, 'T1(K):',k+1,':', fit_result(k,0), fit_result(k,1)
                    printf, lun, '------------------------------------------------------------------------'
                    for j=0, nsize(1)-1 do printf, lun, 'T2(K):',j+1,':', fit_result_0(j,0), fit_result_0(j,1)
                endelse
                free_lun, lun
            endelse
        endif else begin
            if nmode eq 1 then begin
                openw, lun, temfile, /get_lun
                printf, lun, 'Temperature Data'
                printf, lun, 'File:', file
                printf, lun, 'Standard file: ', sfile
                printf, lun, 'Mode: Pinhole'
                printf, lun, '-------------------------------------------------------------------------'
                if nside ne 2 then begin
                    for k=firstfile, lastfile do printf, lun, 'File#', k, mfit_result(0,k-firstfile), mfit_result(1,k-firstfile)
                endif else begin
                    for k=firstfile, lastfile do printf, lun, 'File#', k, mfit_result(0,k-firstfile), mfit_result(1,k-firstfile)
                    printf, lun, '------------------------------------------------------------------------'
                    for j=firstfile, lastfile do printf, lun, 'File#', j, mfit_result_0(0,j-firstfile), mfit_result_0(1,j-firstfile)
                endelse
                free_lun, lun
            endif else begin
                nsize=size(m3fit_result)
                openw, lun, temfile, /get_lun
                printf, lun, 'Temperature Data'
                printf, lun, 'File:', file
                printf, lun, 'Standard file: ', sfile
                printf, lun, 'Mode: Slit'
                printf, lun, '-------------------------------------------------------------------------'
                if nside ne 2 then begin
                    printf, lun, format='('+string(nsize(1))+'f8.1)', m3fit_result(*,0,*)
                ;print, format='('+string(nsize(1))+'f7.1)', m3fit_result(*,0,*)
                endif else begin
                    printf, lun, format='('+string(nsize(1))+'f8.1)', m3fit_result(*,0,*)
                    printf, lun, '-------------------------------------------------------------------------'
                    printf, lun, format='('+string(nsize(1))+'f8.1)', m3fit_result_0(*,0,*)
                endelse
                free_lun, lun
            endelse
        endelse
        widget_control, idTEXT_display, set_value='File saved:  '+string(temfile)
    endif
end
;-----------------------------------------------------------------


pro OnSaveTAs, Event
    OnSaveT, nfile=1, event

end
;-----------------------------------------------------------------

pro OnSavePlanckAs, Event
    OnPrintPlanck, pdisp=4, sdisp=9, p0disp=4, s0disp=9, event
end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnPrintT, Event
    mesg=strarr(2)
    mesg(0)='Still working...'
    mesg(1)='You may save data and then print.'
    ttt=dialog_message(mesg, /information)
end

;-----------------------------------------------------------------
pro OnPrintPlanck, pdisp=pdisp, p0disp=p0disp, sdisp=sdisp, s0disp=s0disp, Event

    if n_elements(pdisp) eq 0 then pdisp=5
    if n_elements(sdisp) eq 0 then sdisp=10
    if n_elements(p0disp) eq 0 then p0disp=5
    if n_elements(s0disp) eq 0 then s0disp=10

    COMMON idraw

    idTEXT_file=widget_info(Event.top, FIND_BY_UNAME='TEXT_File')
    idTEXT_stand=widget_info(Event.top, FIND_BY_UNAME='TEXT_StandFile')
    idLABEL_stand_0=widget_info(Event.top, FIND_BY_UNAME='LABEL_stand_0')
    idTEXT_firstfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_firstfile')
    idTEXT_display=widget_info(Event.top, FIND_BY_UNAME='TEXT_Display')

    widget_control, idTEXT_firstfile, get_value=firstfile
    firstfile=strtrim(string(firstfile),1)

    idDRAW_0=Widget_Info(Event.top,find_by_uname='DRAW_0')
    idDRAW_1=Widget_Info(Event.top,find_by_uname='DRAW_1')
    widget_control, idDRAW_0, get_value=idraw_0
    widget_control, idDRAW_1, get_value=idraw_1
    ;print, 'testttttt', idraw_0, idraw_1

    idDROPLIST_ftd=widget_info(Event.top, FIND_BY_UNAME='DROPLIST_FileToDo')


    widget_control, idDROPLIST_ftd, get_value=v_ftd
    n_ftd=widget_info(idDROPLIST_ftd,/droplist_select)

    if v_ftd(n_ftd) eq 'Single file' then begin
        widget_control, idTEXT_File, get_value=file
        file=string(file)
    endif else begin
        widget_control, idTEXT_File, get_value=file
        file=string(file)+firstfile+'.SPE'
    endelse
    ;widget_control, idTEXT_display, set_value='Saved Planck data: '+file, /APPEND

    widget_control, idTEXT_stand, get_value=sfile
    sfile=string(sfile)
    ;print, sfile


    ;Load parameters
    ;OnApplyParam, Event
    COMMON parameter
    COMMON Standlamp
    ;print, '/////////////////////////', startrow
    startrow=fix(startrow)
    numrow=fix(numrow)
    startrow_0=fix(startrow_0)
    numrow_0=fix(numrow_0)
    bin=fix(bin)
    bin_0=fix(bin_0)
    average=fix(average)
    average_0=fix(average_0)
    nmode=fix(nmode)
    nside=fix(nside)
    nemis=fix(nemis)

    if nside eq 2 then begin
       widget_control, idLABEL_stand_0, get_value=sfile_0
       print, sfile_0
    endif

    ;Single side
    if nside ne 2 then begin
       if nmode eq 1 then begin
         if nemis eq 1 then begin
          fit_result=specT_p(file, sfile, startwav, endwav,startrow,numrow, disp=pdisp)
         endif else begin
          fit_result=specT_p(file, sfile,startwav,endwav,StartRow,NumRow, set_planck=1, emis1=emis1, disp=pdisp)
         endelse
       endif else begin
         if nemis eq 1 then begin
          fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, disp=sdisp)
          ;help, fit_result
         endif else begin
          fit_result=specT_s(file, sfile, startwav, endwav,startrow,numrow, set_planck=1, emis1=emis1, disp=sdisp)
         endelse
       endelse
    endif else begin
       if nmode eq 1 then begin
         if nemis eq 1 then begin
          fit_result=specT_p(file, sfile, startwav, endwav,startrow,numrow, disp=pdisp)
          ;print, 'T1= ', fit_result(0)
          ;print, 'Save Planck radiation the second side.'
          fit_result_0=specT_p(file, sfile_0, startwav, endwav,startrow_0,numrow_0, disp=p0disp)
          ;print, 'T2= ', fit_result(0)
         endif else begin
          fit_result=specT_p(file, sfile, startwav, endwav,startrow,numrow, set_planck=1, emis1=emis1, disp=pdisp)
                   ;print, 'Save Planck radiation the second side.'
          fit_result_0=specT_p(file, sfile_0, startwav, endwav,startrow_0,numrow_0, set_planck=1, emis1=emis1, disp=p0disp)
         ;print, 'T2= ', fit_result(0)
         endelse
       endif else begin
         if nemis eq 1 then begin
          fit_result=specT_s(file, sfile, startwav,endwav,startrow,numrow, bin, average, disp=sdisp)
                    ;print, 'Save Planck radiation the second side.'
          fit_result_0=specT_s(file, sfile_0, startwav,endwav,startrow_0,numrow_0, bin_0, average_0, disp=s0disp)

         endif else begin
          fit_result=specT_s(file, sfile, startwav, endwav,startrow,numrow,bin,average, set_planck=1, emis1=emis1, disp=sdisp)
                  ;print, 'Save Planck radiation the second side.'
          fit_result_0=specT_s(file, sfile_0, startwav, endwav,startrow_0,numrow_0, bin_0, average_0, set_planck=1,emis1=emis1, disp=s0disp)

         endelse
       endelse
    endelse
    ;help, fit_result
end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnExit, Event
    WIDGET_CONTROL, Event.top, /DESTROY
end
;-----------------------------------------------------------------

pro OnFileinfo, Event
    ttt=dialog_message('To be added...',/information)

end
;-----------------------------------------------------------------


pro OnFittingInfo, Event
    ttt=dialog_message('To be added...',/information)
end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnPlotPlanck, Event

    OnPrintPlanck, pdisp=0, p0disp=1, sdisp=3, s0disp=7, event

end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnPlotT, Event
    OnPrintPlanck, pdisp=0,p0disp=0, sdisp=1,s0disp=5, event
end
;-----------------------------------------------------------------

pro OnPlotRaw, Event
    OnPrintPlanck, pdisp=2,p0disp=3, sdisp=6,s0disp=2, event
end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnPlotInt, Event
    OnPrintPlanck, pdisp=2, p0disp=3, sdisp=8,s0disp=4, event
end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnAbout, Event
    XDISPLAYFILE,'AboutInfo.txt'
end
;-----------------------------------------------------------------

pro OnReadMe, Event
     XDISPLAYFILE,'ReadMe.txt'
end
;-----------------------------------------------------------------

pro OnHelpOnLine, Event
    ttt=dialog_message('Still working...',/information)
end
;-----------------------------------------------------------------
;*****************************************************************************************************
function winx32_expsetup
; Returns the class ID for a WinX32 ExpSetup object
return, 'IDLcomIDispatch$CLSID$E715B92B_25F9_11D1_9330_444553540000'
end


function winx32_docfile
; Returns the class ID for a WinX32 DocFile object
return, 'IDLcomIDispatch$CLSID$E715B925_25F9_11D1_9330_444553540000'
end
;******************************************************************************************************
;-----------------------------------------------------------------
pro OnRunT, Event
    idTEXT_mode=widget_info(event.top, find_by_uname='TEXT_mode')

    widget_control, idTEXT_mode, get_value=testparam
    testparam=strtrim(string(testparam),1)
    if testparam eq '' then begin
       OnRunTParam, event
    endif

    idTEXT_file=widget_info(Event.top, FIND_BY_UNAME='TEXT_File')
    idDROPLIST_ccdtime=widget_info(Event.top, FIND_BY_UNAME='DROPLIST_CCDtime')
    idDROPLIST_runmode=widget_info(Event.top, FIND_BY_UNAME='DROPLIST_RunMode')

    widget_control, idDROPLIST_ccdtime, get_value=v_ccdtime
    n_ccdtime=widget_info(idDROPLIST_ccdtime,/droplist_select)
    widget_control, idDROPLIST_runmode, get_value=v_runmode
    n_runmode=widget_info(idDROPLIST_runmode,/droplist_select)

    if v_ccdtime(n_ccdtime) eq 300.0 then begin
     t=caget('3idb:3:userCalc1.VAL',timeVal)
     if timeVal gt 120.  then begin
       timeVal=120.
     endif
     if timeVal lt 0.02  then begin
       timeVal=0.02
     endif
     v_ccdtime(n_ccdtime)=timeVal
    endif

    idTEXT_display=widget_info(Event.top, FIND_BY_UNAME='TEXT_Display')
    widget_control, idTEXT_display, set_value='CCD time = '+v_ccdtime(n_ccdtime)+'Sec'

    class=winx32_docfile()
    expset=winx32_expsetup()
    ;help, expset
    ;help, class
    Docfile=obj_new(class)
    Setup=obj_new(expset)
    ;ccdtime=1.
    a=Setup->SetParam(127,v_ccdtime(n_ccdtime))
    b=Setup->Start2()

    while (setup->getparam(797) ne 0) do begin
        wait, .5
        ;print, 'waiting for stop'
    Endwhile

    ;expname1=setup->getparam(780)
    ;expname2=strtrim(string(setup->getparam(796)),1)
    expname=b->getparam(104)
    ;print, expname

    widget_control, idTEXT_file, set_value=string(expname)

    t=b->close()
    OnCalcT_B, event

    ;print, v_runmode(n_runmode)
    ;help, v_runmode(n_runmode)

    while v_runmode(n_runmode) ne 'Passive' do begin
        run_wait=v_runmode(n_runmode)/2.
        wait, run_wait
       ;ccdtime=1.
       widget_control, idDROPLIST_ccdtime, get_value=v_ccdtime
       n_ccdtime=widget_info(idDROPLIST_ccdtime,/droplist_select)
       a=Setup->SetParam(127,v_ccdtime(n_ccdtime))
       b=Setup->Start2()

       while (setup->getparam(797) ne 0) do begin
           wait, .5
           ;print, 'waiting for stop'
       Endwhile

       ;expname1=setup->getparam(780)
       ;expname2=setup->getparam(796)
       expname=b->getparam(104)

       widget_control, idTEXT_file, set_value=expname

       t=b->close()
       OnCalcT_B, event
       wait, run_wait
        widget_control, idDROPLIST_runmode, get_value=v_runmode
        n_runmode=widget_info(idDROPLIST_runmode,/droplist_select)
    endwhile

end

;-----------------------------------------------------------------
pro OnMeasureT, Event
    OnRunT, Event
end
;-----------------------------------------------------------------

pro OnSelectFile, Event
    idDROPLIST_ftd=widget_info(Event.top, FIND_BY_UNAME='DROPLIST_FileToDo')
    idTEXT_firstfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_firstfile')
    idTEXT_lastfile=widget_info(Event.top, FIND_BY_UNAME='TEXT_lastfile')

    widget_control, idDROPLIST_ftd, get_value=v_ftd
    n_ftd=widget_info(idDROPLIST_ftd,/droplist_select)

    if v_ftd(n_ftd) eq 'Multi files' then begin
       widget_control, idTEXT_firstfile, SENSITIVE=1
       widget_control, idTEXT_lastfile, SENSITIVE=1
    endif else begin
       widget_control, idTEXT_firstfile, SENSITIVE=0
       widget_control, idTEXT_lastfile, SENSITIVE=0
    endelse
end
;-----------------------------------------------------------------

pro OnCalcT_B, Event
    idDROPLIST_ftd=widget_info(Event.top, FIND_BY_UNAME='DROPLIST_FileToDo')


    widget_control, idDROPLIST_ftd, get_value=v_ftd
    n_ftd=widget_info(idDROPLIST_ftd,/droplist_select)

    if v_ftd(n_ftd) eq 'Single file' then begin
        OnCalcTsingle, event
    endif else begin
        OnCalcTMulti, event
    endelse

end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnLoadStand_B, Event
    OnLoadStand, event
end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnLoadFile_B, Event
    OnLoadSpec, event
end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnPlotPlanck_B, Event
    ;OnPrintPlanck, pdisp=0, sdisp=3, event

end
;-----------------------------------------------------------------

pro OnPlotTProfile_B, Event
    ;OnPrintPlanck, pdisp=0, sdisp=1, event

end
;-----------------------------------------------------------------

pro OnPlotSpectra_B, Event
    ;OnPrintPlanck, pdisp=0, sdisp=2, event
end
;-----------------------------------------------------------------

pro OnPlotIntProfile_B, Event
    ;OnPrintPlanck, pdisp=0, sdisp=4, event
end
;-----------------------------------------------------------------

pro OnSelectCCDTime, Event
    idTEXT_display=widget_info(Event.top, FIND_BY_UNAME='TEXT_Display')

    a=event.index
    ccdt=fltarr(15)
    ccdt=[1,0.02,0.05,0.1, 0.2, 0.5, 1, 2,5,10,20,30,60,120,300]
    ;print, ccdt(a)
    ccd=strtrim(string(ccdt(a)),1)
    if ccd eq 300  then begin
      widget_control, idTEXT_display, set_value='CCD time = external'
    endif else begin
      widget_control, idTEXT_display, set_value='CCD time = '+ccd+'Sec'
    endelse


end
;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnPlotImage_B, Event

end
;-----------------------------------------------------------------

pro OnSelectRunMode, Event
    ;idDROPLIST_runmode=Widget_Info(Event.top,find_by_uname='DROPLIST_RunMode')
    ;a=event.index
    ;rm=intarr(12)
    ;rm=[0,1,2,3,4,5,10,15,30,60,120,300]

    ;print, rm(a)
end
;-----------------------------------------------------------------

pro OnSelectEmis, Event
    idBaseEmis=Widget_Info(Event.top,find_by_uname='BaseEmis')
    idDROPLIST_Emis=Widget_Info(Event.top,find_by_uname='Emis_DROPLIST')

    widget_control, idDROPLIST_Emis, get_value=v_emis
    n_emis=widget_info(idDROPLIST_emis,/droplist_select)
    ;print, 'test....', v_emis(n_emis)

    if v_emis(n_emis) eq 'Wavelength Dependent' then begin
       Widget_Control, idBaseEmis, SENSITIVE=1
    endif else begin
       Widget_Control, idBaseEmis, SENSITIVE=0
    endelse
end
;-----------------------------------------------------------------

pro OnSelectSide, Event
    idBaseRunTParamBoth=Widget_Info(Event.top,find_by_uname='BaseRunTParamBoth')
    idDROPLIST_RunT=Widget_Info(Event.top,find_by_uname='RunT_DROPLIST')

    idTEXT_upt=Widget_Info(Event.top,find_by_uname='TEXT_upt')
    idTEXT_upMT=Widget_Info(Event.top,find_by_uname='TEXT_upMT')
    idTEXT_downT=Widget_Info(Event.top,find_by_uname='TEXT_downT')
    idTEXT_downMT=Widget_Info(Event.top,find_by_uname='TEXT_downMT')
    idDROPLIST_epics=Widget_Info(Event.top,find_by_uname='DROPLIST_epics')

    widget_control, idDROPLIST_runt, get_value=v_side
    n_side=widget_info(idDROPLIST_runt,/droplist_select)
    ;print, 'test....', v_side(n_side)

    if v_side(n_side) eq 'Both' then begin
       Widget_Control, idBaseRunTParamBoth, SENSITIVE=1
    endif else begin
       Widget_Control, idBaseRunTParamBoth, SENSITIVE=0
    endelse

    widget_control, idDROPLIST_epics, get_value=v_epics
    n_epics=widget_info(idDROPLIST_epics,/droplist_select)

            widget_control, idTEXT_downt, SENSITIVE=0
            widget_control, idTEXT_downMT, SENSITIVE=0
            widget_control, idTEXT_upt, SENSITIVE=0
            widget_control, idTEXT_upMT, SENSITIVE=0

    if v_epics(n_epics) eq 'Yes' then begin
         CASE v_side(n_side) of
         'Upstream': begin
            widget_control, idTEXT_upt, SENSITIVE=1
            widget_control, idTEXT_upMT, SENSITIVE=1
            widget_control, idTEXT_downt, SENSITIVE=0
            widget_control, idTEXT_downMT, SENSITIVE=0
         end
         'Downstream': begin
            widget_control, idTEXT_upt, SENSITIVE=0
            widget_control, idTEXT_upMT, SENSITIVE=0
            widget_control, idTEXT_downt, SENSITIVE=1
            widget_control, idTEXT_downMT, SENSITIVE=1
         end
         'Both': begin
            widget_control, idTEXT_downt, SENSITIVE=1
            widget_control, idTEXT_downMT, SENSITIVE=1
            widget_control, idTEXT_upt, SENSITIVE=1
            widget_control, idTEXT_upMT, SENSITIVE=1
         end
         ELSE: begin
            ttt=dialog_message('EPICS is ON. Select an appropriate Detector Side.', /information)
            widget_control, idTEXT_downt, SENSITIVE=0
            widget_control, idTEXT_downMT, SENSITIVE=0
            widget_control, idTEXT_upt, SENSITIVE=0
            widget_control, idTEXT_upMT, SENSITIVE=0
            end
         ENDCASE
     endif

     OnSelectMode, event



;    if (v_epics(n_epics) eq 'Yes') then begin
;       if v_side(n_side) ne 'Single' then begin
;         EPICSmode
;       endif
;
;    endif

end
;-----------------------------------------------------------------


pro OnDefault, Event
    OnSaveParam, savefile='RunTParam.ini', strfile='epicsParam.ini', event

end

pro OnSaveParam, savefile=savefile, strfile=strfile, Event
    common defaultdir
    cd, defdir
    OnApplyParam, Event
    COMMON parameter
    COMMON standlamp
    COMMON epics
    COMMON dir

    if n_elements(savefile) eq 0 then savefile='RunTParam.txt'

   ; savefile=file

    openw, lun, savefile, /get_lun

    ;printf, lun, format='("Energy", 8X, "I.norm")'

    printf, lun, StartWav
    printf, lun, EndWav
    printf, lun, StartRow
    printf, lun, NumRow
    printf, lun, Bin
    printf, lun, Average
    printf, lun, StartRow_0
    printf, lun, NumRow_0
    printf, lun, Bin_0
    printf, lun, Average_0
    printf, lun, Emis1
    printf, lun, nside
    printf, lun, nemis
    printf, lun, nmode
    printf, lun, st0
    printf, lun, st1
    printf, lun, st2
    printf, lun, st3
    printf, lun, st4


    free_lun, lun

    if n_elements(strfile) eq 0 then strfile='epicsParam.txt'
    openw, lun1, strfile, /get_lun

    printf, lun1, n_epics
    printf, lun1, PV_upT
    printf, lun1, PV_upMT
    printf, lun1, PV_downT
    printf, lun1, PV_downMT
    printf, lun1, specTpath
    printf, lun1, datapath
    printf, lun1, standpath

    free_lun, lun1

    idBaseParam=Widget_Info(Event.top,find_by_uname='BaseParam')
    Widget_Control, idBaseParam, MAP=0

    ;Turn off the display of IDL-draw windows
    idBaseDraw=Widget_Info(Event.top,find_by_uname='BaseDraw')
    Widget_Control, idBaseDraw, MAP=1
;print, 'ttttt'
end
;-----------------------------------------------------------------

pro OnExitParam, Event
    idBaseParam=Widget_Info(Event.top,find_by_uname='BaseParam')
    Widget_Control, idBaseParam, MAP=0

    ;Turn off the display of IDL-draw windows
    idBaseDraw=Widget_Info(Event.top,find_by_uname='BaseDraw')
    Widget_Control, idBaseDraw, MAP=1

    ;t = dialog_message('Parameters were not applied nor saved!', /information)

end

;-----------------------------------------------------------------
pro OnSelectMode, Event
    idTEXT_bin=Widget_Info(Event.top,find_by_uname='TEXT_Bin')
    idTEXT_bin_0=Widget_Info(Event.top,find_by_uname='TEXT_Bin_0')
    idTEXT_Average=Widget_Info(Event.top,find_by_uname='TEXT_Average')
    idTEXT_Average_0=Widget_Info(Event.top,find_by_uname='TEXT_Average_0')
    idDROPLIST_RunT=Widget_Info(Event.top,find_by_uname='RunT_DROPLIST')
    idDROPLIST_mode=Widget_Info(Event.top,find_by_uname='DROPLIST_mode')


    ;tmode=strarr(3)
    ;tmode(0)='(Pinhole Mode) means that a pinhole is used at the entrance of a spectrometer.'
    ;tmode(1)=''
    ;tmode(2)='(Slit Mode) means that a slit is used at the entrance of a spectrometer.
    ;tt=dialog_message(tmode, /information)
       widget_control, idDROPLIST_mode, get_value=v_mode
       n_mode=widget_info(idDROPLIST_mode,/droplist_select)
       ;print, v_side(n_side)
    if v_mode(n_mode) eq 'Pinhole Mode' then begin
       widget_control, idTEXT_bin, sensitive=0
       widget_control, idTEXT_bin_0, sensitive=0
       widget_control, idTEXT_Average, sensitive=0
       widget_control, idTEXT_Average_0, sensitive=0
    endif else begin
       widget_control, idTEXT_bin, sensitive=1
       widget_control, idTEXT_Average, sensitive=1

       widget_control, idDROPLIST_runt, get_value=v_side
       n_side=widget_info(idDROPLIST_runt,/droplist_select)
       ;print, v_side(n_side)
       if v_side(n_side) eq 'Both' then begin
         widget_control, idTEXT_Average_0, sensitive=1
         widget_control, idTEXT_bin_0, sensitive=1
       endif
    endelse

end


;-----------------------------------------------------------------
pro OnParamSetup, Event
    OnRunTParam, Event
end
;
; Empty stub procedure used for autoloading.
;
pro SpectroTv1_eventcb
end


;**************************************************************************************

pro OnDir, Event
    ;Display parameter window
    idBase_dir=Widget_Info(Event.top,find_by_uname='BASE_dir')
    Widget_Control, idBase_dir, MAP=1

    ;Turn off the display of IDL-draw windows
    idBaseDraw=Widget_Info(Event.top,find_by_uname='BaseDraw')
    Widget_Control, idBaseDraw, MAP=0

end

;----------------------------------------------------------------------

pro OnOKDir, Event

    idBase_dir=Widget_Info(Event.top,find_by_uname='BASE_dir')
    Widget_Control, idBase_dir, MAP=0


    idBaseDraw=Widget_Info(Event.top,find_by_uname='BaseDraw')
    Widget_Control, idBaseDraw, MAP=1

end
;--------------------------------------------------------------------
pro OnTimeT, Event

end
;-----------------------------------------------------------------------
pro OnSpecTdir, Event
    idTEXT_display=widget_info(Event.top,find_by_uname='TEXT_Display')
    widget_control, idTEXT_display, set_value='Locate a directory with (RunTParam.ini).'
    file=dialog_pickfile(/read, filter=['*.txt','*.ini'], title='Locate a directory')
    dir=strmid(file, 0, strpos(file,'\',/reverse_search))

    idTEXT_SpecTPath=Widget_Info(Event.top,find_by_uname='TEXT_SpecTpath')
    widget_control, idTEXT_SpecTPath, set_value=string(dir)

end
;------------------------------------------------------------------------------
pro OnDataDir, Event
    file=dialog_pickfile(/read, filter=['*.SPE'])
    dir=strmid(file, 0, strpos(file,'\',/reverse_search))

    idTEXT_DataPath=Widget_Info(Event.top,find_by_uname='TEXT_DataPath')
    widget_control, idTEXT_DataPath, set_value=string(dir)

end
;-------------------------------------------------------------------------------
pro OnStandDir, Event
    file=dialog_pickfile(/read, filter=['*.SPE'])
    dir=strmid(file, 0, strpos(file,'\',/reverse_search))

    idTEXT_StandPath=Widget_Info(Event.top,find_by_uname='TEXT_StandPath')
    widget_control, idTEXT_StandPath, set_value=string(dir)

end
;-----------------------------------------------------------------------------------

;
; Empty stub procedure used for autoloading.
;
pro SpecTv1a_eventcb
end


;-----------------------------------------------------------------
pro OnSide1, Event
    idDROPLIST_side1=Widget_Info(Event.top,find_by_uname='DROPLIST_Side1')
    ;idDROPLIST_side2=Widget_Info(Event.top,find_by_uname='DROPLIST_Side2')
    idLABEL_side1=Widget_Info(Event.top,find_by_uname='LABEL_Side1')
    ;idLABEL_side2=Widget_Info(Event.top,find_by_uname='LABEL_Side2')

    widget_control, idDROPLIST_side1, get_value=v_side1
    n_side1=widget_info(idDROPLIST_side1,/droplist_select)
    ;widget_control, idDROPLIST_side2, get_value=v_side2
    ;n_side2=widget_info(idDROPLIST_side2,/droplist_select)

    if v_side1(n_side1) eq 'Planck Fit' then $
       OnPrintPlanck, pdisp=0, p0disp=20,sdisp=3, s0disp=20, event
    if v_side1(n_side1) eq 'T Profile' then $
       OnPrintPlanck, pdisp=0, p0disp=20,sdisp=1, s0disp=20, event
    if v_side1(n_side1) eq 'Spectra' then $
       OnPrintPlanck, pdisp=2, p0disp=20,sdisp=6, s0disp=20, event
    if v_side1(n_side1) eq 'Intensity Profile' then $
       OnPrintPlanck, pdisp=0, p0disp=20,sdisp=8, s0disp=20, event

end


;-----------------------------------------------------------------
pro OnSide2, Event
    ;idDROPLIST_side1=Widget_Info(Event.top,find_by_uname='DROPLIST_Side1')
    idDROPLIST_side2=Widget_Info(Event.top,find_by_uname='DROPLIST_Side2')
    ;idLABEL_side1=Widget_Info(Event.top,find_by_uname='LABEL_Side1')
    idLABEL_side2=Widget_Info(Event.top,find_by_uname='LABEL_Side2')

    ;widget_control, idDROPLIST_side1, get_value=v_side1
    ;n_side1=widget_info(idDROPLIST_side1,/droplist_select)
    widget_control, idDROPLIST_side2, get_value=v_side2
    n_side2=widget_info(idDROPLIST_side2,/droplist_select)

    if v_side2(n_side2) eq 'Planck Fit' then $
       OnPrintPlanck, pdisp=1, p0disp=1,sdisp=7, s0disp=7, event
    if v_side2(n_side2) eq 'T Profile' then $
       OnPrintPlanck, pdisp=0, p0disp=0,sdisp=5, s0disp=5, event
    if v_side2(n_side2) eq 'Spectra' then $
       OnPrintPlanck, pdisp=3, p0disp=3,sdisp=2, s0disp=2, event
    if v_side2(n_side2) eq 'Intensity Profile' then $
       OnPrintPlanck, pdisp=0, p0disp=0,sdisp=4, s0disp=4, event

end


pro OnEPICSpv, Event
    OnRunTParam, event
end
;-----------------------------------------------------------------




pro OnEpics, Event
     OnSelectSide, event
     ;COMMON epics, seside, seepics

    idDROPLIST_epics=Widget_Info(Event.top,find_by_uname='DROPLIST_epics')
    idDROPLIST_RunT=Widget_Info(Event.top,find_by_uname='RunT_DROPLIST')
    idTEXT_upt=Widget_Info(Event.top,find_by_uname='TEXT_upt')
    idTEXT_upMT=Widget_Info(Event.top,find_by_uname='TEXT_upMT')
    idTEXT_downT=Widget_Info(Event.top,find_by_uname='TEXT_downT')
    idTEXT_downMT=Widget_Info(Event.top,find_by_uname='TEXT_downMT')

;;    b=event.index
;;    s_epics=strarr(2)
;;    s_epics=['Yes', 'No']
;;    print, 'test/////'
;;    print, s_epics(b)
;
    widget_control, idDROPLIST_epics, get_value=v_epics
    n_epics=widget_info(idDROPLIST_epics,/droplist_select)

    seepics=v_epics(n_epics)

    widget_control, idDROPLIST_RunT, get_value=v_side
    n_side=widget_info(idDROPLIST_runt, /droplist_select)
    seside=v_side(n_side)



    if seepics eq 'Yes' then begin

         CASE seside of
         'Upstream': begin
            widget_control, idTEXT_upt, SENSITIVE=1
            widget_control, idTEXT_upMT, SENSITIVE=1
            widget_control, idTEXT_downt, SENSITIVE=0
            widget_control, idTEXT_downMT, SENSITIVE=0
         end
         'Downstream': begin
            widget_control, idTEXT_upt, SENSITIVE=0
            widget_control, idTEXT_upMT, SENSITIVE=0
            widget_control, idTEXT_downt, SENSITIVE=1
            widget_control, idTEXT_downMT, SENSITIVE=1
         end
         'Both': begin
            widget_control, idTEXT_downt, SENSITIVE=1
            widget_control, idTEXT_downMT, SENSITIVE=1
            widget_control, idTEXT_upt, SENSITIVE=1
            widget_control, idTEXT_upMT, SENSITIVE=1
         end
         ELSE: begin
            ;ttt=dialog_message('EPICS is ON. Select an appropriate Detector Side.', /information)
            widget_control, idTEXT_downt, SENSITIVE=0
            widget_control, idTEXT_downMT, SENSITIVE=0
            widget_control, idTEXT_upt, SENSITIVE=0
            widget_control, idTEXT_upMT, SENSITIVE=0
            end
         ENDCASE
;
       XMANAGER, 'OnEpics', idDROPLIST_epics, /no_block
    endif

print, 'test epics..'


end
;-----------------------------------------------------------------

PRO OnEpics_event, event
    ;common epics
    ;OnSelectSide, event
    idDROPLIST_epics=Widget_Info(Event.top,find_by_uname='DROPLIST_epics')
    ;idC_epics=widget_info(event.top, find_by_uname='CBUTTON_epics')
    idTEXT_upt=Widget_Info(Event.top,find_by_uname='TEXT_upt')
    idTEXT_upMT=Widget_Info(Event.top,find_by_uname='TEXT_upMT')
    idTEXT_downT=Widget_Info(Event.top,find_by_uname='TEXT_downT')
    idTEXT_downMT=Widget_Info(Event.top,find_by_uname='TEXT_downMT')
    idDROPLIST_RunT=Widget_Info(Event.top,find_by_uname='RunT_DROPLIST')
    idDROPLIST_Mode=Widget_Info(Event.top,find_by_uname='DROPLIST_mode')

    ;print, 'check is ', seside, seepics



    widget_control, idTEXT_upt, get_value=upT
    upT=strtrim(string(upT),1)
    ;print, upt
    widget_control, idTEXT_upMT, get_value=upMT
    upMT=strtrim(string(upMT),1)
    ;print, upMT
    widget_control, idTEXT_downT, get_value=downT
    downT=strtrim(string(downT),1)
    widget_control, idTEXT_downMT, get_value=downMT
    downMT=strtrim(string(downMT),1)
    ;print, downMT

    widget_control, idDROPLIST_Mode, get_value=v_mode
    n_mode=widget_info(idDROPLIST_Mode, /droplist_select)

    widget_control, idDROPLIST_RunT, get_value=v_side
    n_side=widget_info(idDROPLIST_RunT, /droplist_select)

    widget_control, idDROPLIST_epics, get_value=v_epics
    n_epics=widget_info(idDROPLIST_epics, /droplist_select)



  IF v_epics(n_epics) eq 'Yes' THEN BEGIN
    ;PRINT, 'Timer Fired'
    WIDGET_CONTROL, idDROPLIST_epics, TIMER=.3
    CASE v_side(n_side) of
    'Both': begin
        t=caget(upMT, ut)
        t=caget(downMT, dt)
        if (ut ne 0) or (dt ne 0) then begin
           OnRunT, event
           COMMON f_result
           COMMON parameter
           CASE v_mode(n_mode) of
           'Pinhole Mode': begin
                t=caput(upT,fit_result(0))
                t=caput(downT,fit_result_0(0))
                end
           'Slit Mode': begin
               numpoint = fix(numrow/bin)
                midnum=fix(numpoint/2)
                av=fix((average-1)/2)
                temp=0.
                for m=midnum-av, midnum+av do temp=temp+fit_result(m,0)
                temp=temp/average

          numpoint_0 = fix(numrow_0/bin_0)
                midnum_0=fix(numpoint_0/2)
                av_0=fix((average_0-1)/2)
                temp_0=0.
                for n=midnum_0-av_0, midnum_0+av_0 do temp_0=temp_0+fit_result_0(n,0)
                temp_0=temp_/average_0

          t=caput(upT, temp)
          t=caput(downT, temp_0)
                end
                else:
            ENDCASE
                t=caput(upMT, 0)
                t=caput(downMT,0)
           ;print, 'measure....', systime()
        endif
        ;print, 'wait...', systime()
       end
    'Upstream': begin
        t=caget(upMT, ut)
        ;t=caget(downMT, dt)
        if (ut ne 0) then begin
           ; print, 'test......................'
           OnRunT, event
           COMMON f_result
           COMMON parameter
           CASE v_mode(n_mode) of
           'Pinhole Mode': begin
                t=caput(upT,fit_result(0))
                ;t=caput(downT,fit_result_0(0))
                end
           'Slit Mode': begin
               numpoint = fix(numrow/bin)
                midnum=fix(numpoint/2)
                av=fix((average-1)/2)
                temp=0.
                for m=midnum-av, midnum+av do temp=temp+fit_result(m,0)
                temp=temp/average

          t=caput(upT, temp)
          ;t=caput(downT, temp_0)
                end
                else:
            ENDCASE
                t=caput(upMT, 0)
                ;t=caput(downMT,0)
            ;print, 'measure....', systime()
        endif
        ;print, 'wait...', systime()
       end
     'Downstream': begin
        ;t=caget(upMT, ut)
        t=caget(downMT, dt)
        if (dt ne 0) then begin
           OnRunT, event
           COMMON f_result
           COMMON parameter
           CASE v_mode(n_mode) of
           'Pinhole Mode': begin
                ;t=caput(upT,fit_result(0))
                t=caput(downT,fit_result(0))
                end
           'Slit Mode': begin
               numpoint = fix(numrow/bin)
                midnum=fix(numpoint/2)
                av=fix((average-1)/2)
                temp=0.
                for m=midnum-av, midnum+av do temp=temp+fit_result(m,0)
                temp=temp/average

          t=caput(downT, temp)
          ;t=caput(downT, temp_0)
                end
                else:
            ENDCASE
                ;t=caput(upMT, 0)
                t=caput(downMT,0)
            ;print, 'measure....', systime()
        endif
        ;print, 'wait...', systime()
       end
      ELSE:
      ENDCASE
    endif

END

;---------------------------------------------------------------------------------

pro OnStandChange, Event
    idTEXT_st_0=Widget_Info(Event.top,find_by_uname='TEXT_st_0')
    idTEXT_st_1=Widget_Info(Event.top,find_by_uname='TEXT_st_1')
    idTEXT_st_2=Widget_Info(Event.top,find_by_uname='TEXT_st_2')
    idTEXT_st_3=Widget_Info(Event.top,find_by_uname='TEXT_st_3')
    idTEXT_st_4=Widget_Info(Event.top,find_by_uname='TEXT_st_4')

    widget_control, idTEXT_st_0, SENSITIVE=1
    widget_control, idTEXT_st_1, SENSITIVE=1
    widget_control, idTEXT_st_2, SENSITIVE=1
    widget_control, idTEXT_st_3, SENSITIVE=1
    widget_control, idTEXT_st_4, SENSITIVE=1


end

;---------------------------------------------------------------------------------




;-----------------------------------------------------------------

;-----------------------------------------------------------------
pro OnTimer, Event

end

;
pro SpecT_eventcb
end

;; IDL startup file
;!quiet=1
;.run ezcaIDL
;.run ezcaIDLWidgets
;caInit
;casettimeout,.02
;casetretrycount, 100
;@bsif_common
;@os.init
;if (os_system.arch eq 'alpha') then os_system.prt = 'lpr'
;if (os_system.arch eq 'sparc') then device, retain=2, true_color=24
;if (os_system.arch eq 'sparc') then os_system.prt = 'lpr'
;; mn for linux
;if ((os_system.arch eq 'x86') and (os_system.os eq 'linux')) then  os_system.prt = 'lpr'
;if ((os_system.arch eq 'x86') and (os_system.os eq 'linux')) then  device, retain=2, decomposed=1
;
;-----------------------------------------------------------------
;-----------------------------------------------------------------
; Activate Button Callback Procedure.
; Argument:
;   Event structure:
;
;   {WIDGET_BUTTON, ID:0L, TOP:0L, HANDLER:0L, SELECT:0}
;
;   ID is the widget ID of the component generating the event. TOP is
;       the widget ID of the top level widget containing ID. HANDLER
;       contains the widget ID of the widget associated with the
;       handler routine.

;   SELECT is set to 1 if the button was set, and 0 if released.
;       Normal buttons do not generate events when released, so
;       SELECT will always be 1. However, toggle buttons (created by
;       parenting a button to an exclusive or non-exclusive base)
;       return separate events for the set and release actions.

;   Retrieve the IDs of other widgets in the widget hierarchy using
;       id=widget_info(Event.top, FIND_BY_UNAME=name)

;-----------------------------------------------------------------
pro OnResetEpics, Event
    OnEpics_event, event
end
;-----------------------------------------------------------------
; Activate Button Callback Procedure.
; Argument:
;   Event structure:
;
;   {WIDGET_BUTTON, ID:0L, TOP:0L, HANDLER:0L, SELECT:0}
;
;   ID is the widget ID of the component generating the event. TOP is
;       the widget ID of the top level widget containing ID. HANDLER
;       contains the widget ID of the widget associated with the
;       handler routine.

;   SELECT is set to 1 if the button was set, and 0 if released.
;       Normal buttons do not generate events when released, so
;       SELECT will always be 1. However, toggle buttons (created by
;       parenting a button to an exclusive or non-exclusive base)
;       return separate events for the set and release actions.

;   Retrieve the IDs of other widgets in the widget hierarchy using
;       id=widget_info(Event.top, FIND_BY_UNAME=name)

;-----------------------------------------------------------------
pro OnCancelDir, Event
    idBase_dir=Widget_Info(Event.top,find_by_uname='BASE_dir')
    Widget_Control, idBase_dir, MAP=0


    idBaseDraw=Widget_Info(Event.top,find_by_uname='BaseDraw')
    Widget_Control, idBaseDraw, MAP=1
end
;-----------------------------------------------------------------
; Notify Realize Callback Procedure.
; Argument:
;   wWidget - ID number of specific widget.
;
;
;   Retrieve the IDs of other widgets in the widget hierarchy using
;       id=widget_info(Event.top, FIND_BY_UNAME=name)

;-----------------------------------------------------------------
pro OnStart, wWidget


end
;-----------------------------------------------------------------
; Post Create Widget Procedure.
; Argument:
;   wWidget - ID number of specific widget.
;
;   Any keywords passed into the generated widget creation procedure
;       are passed into this procudure.

;   Retrieve the IDs of other widgets in the widget hierarchy using
;       id=widget_info(Event.top, FIND_BY_UNAME=name)

;-----------------------------------------------------------------
pro Onstart2, wWidget, _EXTRA=_VWBExtra_

end


;



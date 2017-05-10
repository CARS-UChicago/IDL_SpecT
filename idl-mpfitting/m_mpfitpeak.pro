function m_mpfitpeak, p, $
					 px1=px1, $
					 px2=px2, $
					 scale=scale, $
					 backg=backg, $
					 width=width, $
					 startchi=startchi, $
					 image=image, $
					 dim=dim


;************* not finished *********************

	int=fltarr(dim(1))

 for k=px1, px2 do begin
		;model: d=d0+d1*(1-3cos^2(chi))
			d0=lambda/2/sin(((scale(0)+scale(1)*k)/2)*!dtor)
			;print, dim(2)
			;int(k)=0
			for i=0, dim(2)-1 do begin
				d=d0+p*(1-3*cos((i+startchi)*!dtor)*cos((i+startchi)*!dtor))
				conv=2*asin(lambda/2/d)*!radeg
				pconv=(conv-scale(0))/scale(1)+0.5
				;print, pconv
				pconv=fix(pconv)
				;print, pconv
				int(k)=image(pconv,i)+int(k)
			endfor
	endfor

numpixel=findgen(dim(1))
twotheta=scale(0)+scale(1)*numpixel

background=backg(0)+backg(1)*twotheta

int=int-background

;	pi=replicate({value:0.D, fixed:0, limited:[0,0], limits:[0.D, 0.D],$
;				step:00.D},4)
;	pi(0).limited(0)=1
;	pi(0).limits=-1000.
;	pi(0).limited(1)=1
;	pi(0).limits(1)=0.
result=MPFITPEAK(twotheta(px1:px2), int(px1:px2),param,estimates=startp,$
				nterms=6, moffat=1, perror=pe, PARINFO=pi)


;return deviation

deviates=2*param(2)/1.D

;print, 'p= ', p
;print, 'para=', param(2)
;print,'dev=', deviates
;deviates=1.D6*deviates
return, deviates

end
;+
; NAME:
;   LORENZ
;
; AUTHOR:
;   Guoyin Shen , shen@cars.uchicago.edu
;   Modified from a procedure "GAUSS1.pro" by
;   Craig B. Markwardt, NASA/GSFC Code 662, Greenbelt, MD 20770
;   craigm@lheamail.gsfc.nasa.gov
;
; PURPOSE:
;   Compute Lorenzian curve given the mean, sigma and area.
;
; MAJOR TOPICS:
;   Curve and Surface Fitting
;
; CALLING SEQUENCE:
;   YVALS = LORENZ(XVALS, [MEAN, SIGMA, AREA], SKEW=skew)
;
; DESCRIPTION:
;
;  This routine computes the values of a Lorenzian function whose
;  X-values, mean, sigma, and total area are given.
;
;  XVALS can be an array of X-values, in which case the returned
;  Y-values are an array as well.  The second parameter to LORENZ
;  should be an array containing the MEAN, SIGMA, and total AREA, in
;  that order.
;
; INPUTS:
;   X - Array of X-values.
;
;   [MEAN, SIGMA, AREA] - the mean, sigma and total area of the
;                         desired Lorenzian curve.
;
; INPUT KEYWORD PARAMETERS:
;
;   SKEW - You may specify a skew value.  Default is no skew.
;
; RETURNS:
;
;   Returns the array of Y-values.
;
; EXAMPLE:
;
;   p = [2.2D, 1.4D, 3000.D]
;   x = dindgen(200)*0.1 - 10.
;   y = lorenz(x, p)
;
;   Computes the values of the Lorenzian at equispaced intervals
;   (spacing is 0.1).  The Lorenzian has a mean of 2.2, standard
;   deviation of 1.4, and total area of 3000.
;
; REFERENCES:
;
; MODIFICATION HISTORY:
;
;
;-

function lorenz, x, p, skew=skew, _EXTRA=extra

  sz = size(x)
  if sz(sz(0)+1) EQ 5 then smax = 26D else smax = 13.

  if n_elements(p) GE 3 then norm = p(2) else norm = x(0)*0 + 1

  u = ((x-p(0))/(abs(p(1)) > 1e-20))^2
  ;mask = u LT (smax^2)
  f = norm /(1+temporary(u)) /(!dpi * p(1))
  mask = 0

  if n_elements(skew) GT 0 then $
    f = (1.D + skew * (x-p(0))/p(1))*f

  return, f
end

module funcs

implicit none

contains

pure real function avrg(alist)
  real, intent(in) :: alist(:)

  avrg = sum(alist) / real(size(alist))
end function avrg


elemental real function arctan(x)
  use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_quiet_nan

  real, intent(in) :: x
  real :: prevxp, presxp, term, y
  real :: nan
  real, parameter :: pi = 4.*atan(1.)
  integer :: i

  nan = ieee_value(0., ieee_quiet_nan)

  if (x < 0.) then
    arctan = nan
    return
  endif

  arctan = 0.

  if (x - 1. > 0.) then
    term = -1. / x
    arctan = pi/2
  else
    term = x
  endif

  prevxp = 1.
  y = term ** 2.

  do while(term-0.00005 >= 0. .or. -term - 0.00005 >= 0.)
    arctan = arctan + term
    presxp = prevxp + 2.

    term = -prevxp / presxp * y * term
    prevxp = presxp
  enddo

end function arctan

end module funcs

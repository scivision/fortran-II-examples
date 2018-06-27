      program example2
!  normally we use atan() intrinsic, this is just for example.
!
! page 29
      use funcs, only: arctan   ! should always put function and subroutine in modules

      !-----------------------------------------------------------------------
      ! this is obsolete Fortran 66 and should not be done
      !dimension a(5)
      !data a /3.,3.5,1.57, 3.14, -1/
      !--------------------------------------------
      ! this is modern
      real :: a(5) = [3., 3.5, 1.57, 3.14, -1.]
      !---------------------------------------------
      
      ! old Fortran II way
      do 10 i = 1,5
10    write (*,*) arctanII(a(i))
      
      ! modern Fortran way
      print *, arctan(a)
      
      ! range of arctan
      print *, atan(-huge(0.)), atan(huge(0.))

      end program


      function arctanII(x)

      real :: prevxp, presxp, pi 
      
      pi = 3.1415927

      if (x) 2,3,3

!2     stop  ! instead, return a value outside plausible range (common Fortran trick)
2     arctanII=-99
      return 

3     arctanII = 0.

      if (x - 1.) 10, 10, 5

5     term = -1. / x
      arctanII = pi / 2
      goto 11

10    term = x
11    prevxp = 1.
      y = term ** 2.

12    arctanII = arctanII + term
      presxp = prevxp + 2.

      term = -prevxp / presxp * y * term
      prevxp = presxp

      if(term - 0.00005) 15, 12, 12
15    if(-term - 0.00005) 16, 12, 12

16    end


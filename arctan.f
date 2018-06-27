      program example2
!  normally we use atan() intrinsic, this is just for example.
!
! page 29
      use funcs, only: arctan
      use funcs58, only: arctanII   
      ! should always put function and subroutine in modules

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


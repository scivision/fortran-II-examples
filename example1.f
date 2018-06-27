      program example1
!  page 27     
      use funcs  ! for modern Fortran only, ex1.f90
      
      real :: a(5) = [27, 36, 29, 10, 1]   ! modern way, I dislike obsolete "DATA"
      
      print *, avrgII(a,5)
      
      print *, avrg77(a,5)
      
      print *, avrg(a)
      
      end program
      
      
      function avrgII(alist, n)
! Fortran II way     
      dimension alist(5)
      
      sum = alist(1)
      
      do 10 i = 2, n
10    sum = sum + alist(i)

      avrgII = sum / real(n)
      
      end
      
      
      function avrg77(alist, n)
! Fortran 77 way
      dimension alist(n)
      
       sum = alist(1)
      
      do  i = 2, n
        sum = sum + alist(i)
      end do
      
      avrgII = sum / real(n)
      
      end
      

program bench
use, intrinsic:: iso_fortran_env, only: int64
use funcs, only: arctan
use funcs58, only: arctanII

implicit none

real :: tintrinsic, told, tnew
real, allocatable ::  ain(:), aout(:)
integer(int64) :: tic, toc, rate
integer :: i, N
character(12) :: argv

N = 100000
call get_command_argument(1,argv,status=i)
if (i==0) read(argv,*) N

allocate(ain(N), aout(N))

!call random_init()  ! Fortran 2018
call random_number(ain)


call system_clock(tic,count_rate=rate)
aout = atan(ain)
call system_clock(toc)
tintrinsic = (toc-tic)/real(rate)


call system_clock(tic,count_rate=rate)
aout = arctan(ain)

call system_clock(toc)
tnew = (toc-tic)/real(rate)


call system_clock(tic,count_rate=rate)
do i = 1,n
  aout(i) = arctanII(ain(i))
enddo
call system_clock(toc)
told = (toc-tic)/real(rate)

print *,'arctan benchmark, ',N,' size array, time in seconds.'
print '(A,ES13.3,A,ES13.3,A,ES13.3)','intrinsic ',tintrinsic,'  modern Fortran ',tnew,'  Fortran II / 77  ',told
end program

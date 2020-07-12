module stdlib_experimental_system
use, intrinsic :: iso_c_binding, only : c_int, c_long
implicit none
private
public :: sleep

interface
#ifdef _WIN32
subroutine winsleep(dwMilliseconds) bind (C, name='Sleep')

subroutine sleep(millisec)
integer, intent(in) :: millisec
integer(c_int) :: ierr

#ifdef _WIN32
call winsleep(int(millisec, c_long))
#else
ierr = usleep(int(millisec * 1000, c_int))
if (ierr/=0) error stop 'problem with usleep() system call'
#endif


end subroutine sleep

end module stdlib_experimental_system

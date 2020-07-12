submodule (stdlib_experimental_error) estop

implicit none

contains

module procedure error_stop

if(present(code)) then
  write(stderr,*) msg
  error stop code
else
  error stop msg
endif
end procedure

end submodule estop
© 2020 GitHub, Inc.

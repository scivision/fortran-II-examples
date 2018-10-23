FC=gfortran
.PHONY: all
all: arctan example1 bench

FFLAGS = -O3
ifeq ($(FC),flang)
  FFLAGS += -static-flang-libs
endif

arctan: funcs.o funcs58.o arctan.f
	$(FC) $(FFLAGS) $^ -o $@

example1: funcs.o example1.f
	$(FC) $(FFLAGS) $^ -o $@

bench: funcs.o funcs58.o benchmark.f90
		$(FC) $(FFLAGS) $^ -o $@

funcs.o: funcs.f90
	$(FC) $(FFLAGS) -c $^ -o $@

funcs58.o: funcs58.f
	$(FC) $(FFLAGS) -c $^ -o $@

.PHONY: clean
clean:
	$(RM) *.o *.mod

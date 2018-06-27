.PHONY: all
all: arctan example1

arctan: funcs.o example2.f
	$(FC) $(FFLAGS) $^ -o $@

example1: funcs.o example1.f
	$(FC) $(FFLAGS) $^ -o $@
	
funcs.o: funcs.f90
	$(FC) $(FFLAGS) -c $^ -o $@

.PHONY: clean
clean: 
	$(RM) *.o *.mod

# fortran-II-examples
Fortran II (year 1958) examples from IBM 704 Fortran II 
[manual](archive.computerhistory.org/resources/text/Fortran/102653989.05.01.acc.pdf) 
with modern Fortran equivalents.

## Requirements
Most Fortran compilers can handle the Fortran II code within.
Of course there will be some compiler warnings.

## Build

```sh
make
```

./arctan

./ex1

## Notes

Subprograms/program units (now known as "procedures" e.g. functions and subroutines) were concluded with `RETURN` for Fortran II.  
`END` was for the overall program end **only**. 
Fortran 66 allowed `END` to be used for procedures as well.
Perhaps this is an origin for the maddening (unnecessary) practice in Fortran 66 and 77 of ending procedures with
```fortran
RETURN
END
```

* Fortran 66 [standard](http://web.eah-jena.de/~kleine/history/languages/ansi-x3dot9-1966-Fortran66.pdf)
* Fortran 77 [langauge reference](http://physik.uibk.ac.at/hephy/praktikum/fortran_manual.pdf)


### Function statements

The original 1957 Fortran had "statement functions", which in 1957 Fortran and Fortran II were required to have a name ending in `F` e.g. `MINIMAXF`.

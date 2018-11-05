# fortran-II-examples
Fortran II (year 1958) examples from IBM 704 Fortran II 
[manual](http://archive.computerhistory.org/resources/text/Fortran/102653989.05.01.acc.pdf) 
with modern Fortran equivalents.

The benchmark shows that good modern Fortran coding can be orders of magnitude faster than Fortran 77 techniques.

## Requirements
Most Fortran compilers can handle the Fortran II code within.
Of course there will be some compiler warnings.

## Build / Usage

```sh
make
```

```
./bench
```

### Benchmark
An arctan function is tested.

* Intrinsic:  Fortran built-in `atan()`
* New:        My implementatin in modern Fortran of the 1958 IBM arctangent function
* Old:        Fortran 77 implementation of 1958 IBM arctangent function


time in seconds.   Optimization `-O3`

Flang 5.0   `make FC=flang`

    ./bench 1000000
    intrinsic     1.740E-02  modern Fortran     6.861E-02  Fortran 77      6.119E-02

    ./bench 10000000
    intrinsic     1.397E-01  modern Fortran     6.690E-01  Fortran 77      6.231E-01


Intel Fortran 2019   `make FC=ifort`

    ./bench 1000000
    intrinsic     2.648E-03  modern Fortran     9.605E-02  Fortran 77      8.485E-02
    
    ./bench 10000000
    intrinsic     2.596E-02  modern Fortran     9.397E-01  Fortran 77      8.574E-01

PGI 2017    `make FC=pgf95`

     ./bench 1000000
    intrinsic     5.782E-03  modern Fortran     6.846E-02  Fortran 77      6.339E-02

    ./bench 10000000
    intrinsic     3.290E-02  modern Fortran     7.069E-01  Fortran 77      6.356E-01

Using the same algorithm, modern Fortran 95+ techniques are approximately the same speed as awkward Fortran 77 style coding.

## Notes

Subprograms/program units (now known as "procedures" e.g. functions and subroutines) must be concluded for Fortran II (1958) with
```fortran
RETURN
END
```
However, since Fortran 66, all that's needed for ending procedures (functions and subroutines) is 
```fortran
END
````
so there's no need to be anachronistic--just end with `end subroutine` or `end function`

* Fortran II (1958) [manual](http://archive.computerhistory.org/resources/text/Fortran/102653989.05.01.acc.pdf)
* Fortran 66 [standard](http://web.eah-jena.de/~kleine/history/languages/ansi-x3dot9-1966-Fortran66.pdf)
* Fortran 77 [langauge reference](http://physik.uibk.ac.at/hephy/praktikum/fortran_manual.pdf)


### Function statements

The original 1957 Fortran had "statement functions", which in 1957 Fortran and Fortran II were required to have a name ending in `F` e.g. `MINIMAXF`.

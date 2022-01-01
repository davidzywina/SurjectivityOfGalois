# SurjectivityOfGalois

This repository contains Magma code for the algorithms outlined in the paper "On the surjectivity of mod ell representations associated to elliptic curves".

For an elliptic curve E over the rationals, the function "ExceptionalSet" computes a finite set S of primes such that the mod ell representation associated to E has maximal image for all primes ell not in the set S.   It uses two different approaches depending on whether the j-invariant of E is an integer or not.

In the file Example.m, we apply it to the elliptic curves in Cremona's database.


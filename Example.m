/*
  For each non-CM elliptic curve E over the rationals in Cremona's database, the following code computes a finite set of primes S 
  such that if the mod ell representation rho_{E,ell} is not surjective with a prime ell>13, then ell is in the set S. 
  It uses the function "ExceptionalSet" from the file SurjectivityOfGalois.m
  
  Cremona's database currently consists of elliptic curves of conductor at most 500000, and our code actually verifies 
  Conjecture 1.1 in the paper for all such non-CM curves.
 */

D:=CremonaDatabase();   
LargestConductor(D);
  
for N in [1..LargestConductor(D)] do
	for E in EllipticCurves(D,N) do
		if HasComplexMultiplication(E) eq false then
        		S:={p: p in ExceptionalSet(E) | p gt 13};
		        if jInvariant(E) in {-297756989/2, -882216989/131072} then
        		   assert S eq {17};
	        	elif jInvariant(E) in {-9317, -162677523113838677} then
		           assert S eq {37};
		        elif S ne {} then
		           print E, S;
		        end if;
		end if;
	end for;
end for;
  

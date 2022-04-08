function ExceptionalSet(E)
    /* Input:  An elliptic curve E defined over Q
    
        Output: A finite set S of primes so that the Galois representation rho_{E,l} has image GL_2(F_l) for all primes l not in S.
    */
  
    j:=jInvariant(E); 
    den:=Denominator(j);
    S:={2,3,5,7,11,13};	
    if j in {-297756989/2, -882216989/131072} then  S:=S join {17};  end if;                                       	
    if j in {-9317, -162677523113838677} then  S:=S join {37}; end if;

    if den ne 1 then 
        ispow,b,e:=IsPower(den);                
        if ispow then                       	
            g:=GCD([e] cat [p^2-1: p in PrimeDivisors(b)]);
            S:=S join {ell: ell in PrimeDivisors(g)};
        end if;
    else
        Q:=PrimeDivisors(Numerator(j-1728));
        Q:=[q: q in Q | q ne 2 and IsOdd(Valuation(j-1728,q))];
        if Valuation(j,2) in {3,6,9} then Q:=[2] cat Q; end if;

        p:=2;
        alpha:=[]; beta:=[];
        repeat  
            a:=0;   
            while a eq 0 do
                repeat  p:=NextPrime(p); until p notin Q;
                K:=KodairaSymbol(E,p);
                if K eq KodairaSymbol("I0") then
                    a:=TraceOfFrobenius(E,p);
                elif K eq KodairaSymbol("I0*") then
                    a:=TraceOfFrobenius(QuadraticTwist(E,p),p);
                end if;
            end while;                   
            S:=S join {ell : ell in PrimeDivisors(a)};

            alpha:= alpha cat [[(1-KroneckerSymbol(q,p)) div 2 : q in Q]];   
            beta:= beta cat [ [(1-KroneckerSymbol(-1,p)) div 2] ];
            A:=Matrix(GF(2),alpha);  
            b:=Matrix(GF(2),beta);              
        until IsConsistent(Transpose(A),Transpose(b)) eq false; 	
    end if;	

    return S;
end function;

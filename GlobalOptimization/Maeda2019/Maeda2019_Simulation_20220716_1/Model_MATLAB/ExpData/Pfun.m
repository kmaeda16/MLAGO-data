function P = Pfun( Pstd, H, K, f, NH4ext )

P = Pstd * ( f + ( NH4ext/K )^H ) / ( 1 + ( NH4ext/K )^H );

concrete AdverbZul of Adverb = CatZul ** open ResZul, Prelude in {

  lin
    PositAdvAdj a = {
      s = "ka" ++BIND++ a.s!A1 ;
      asp = Null ;
      reqLocS = False
    } ;
    -- ComparAdvAdj cadv a np = {
    --   s = cadv.s ! Pos ++ a.s ! AAdv ++ cadv.p ++ np.s ! npNom
    --   } ;
    -- ComparAdvAdjS cadv a s = {
    --   s = cadv.s ! Pos ++ a.s ! AAdv ++ cadv.p ++ s.s
    --   } ;
    --
    -- PrepNP prep np = {s = preOrPost prep.isPre prep.s (np.s ! NPAcc)} ;
    --
    -- AdAdv = cc2 ;
    -- PositAdAAdj a = {s = a.s ! AAdv} ;

    SubjS subj s = {
      s = subj.s ++ s.subjs ;
      asp = Null ;
      reqLocS = False
    } ;

    -- AdnCAdv cadv = {s = cadv.s ! Pos ++ cadv.p} ;

}

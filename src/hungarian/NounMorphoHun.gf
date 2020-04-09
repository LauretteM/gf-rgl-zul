resource NounMorphoHun = ParamHun ** open Prelude, Predef in {

oper
  Noun = {s : Number => Case => Str} ;

  -- Paradigm functions
  -- http://www.cse.chalmers.se/~aarne/articles/smart-preprint.pdf

  -- Words like alma, kefe:
  dAlma : Str -> Noun = \alma ->
    let almá : Str = lengthen alma ;

        -- Apply mkNoun to the lengthened stem "almá" or "kefé"
        nAlmá : Noun = mkNoun almá ;
     in {s = \\n,c => case <n,c> of {
                -- Singular nominative uses the given form, e.g. "alma" or "kefe"
                <Sg,Nom> => alma ;

                -- The rest of the forms are formed with the regular constructor,
                -- using "almá" or "kefé" as the stem.
                _ => nAlmá.s ! n ! c
              } ;
        } ;

  -- Handles words like "madár, nyár, név" with shortened stem vowel in plural
  -- No special <Sg,Sup> case here
  dMadár : Str -> Noun = \madár ->
    let r = last madár ;
        madá = init madár ;
        mada = shorten madá ; -- shortens vowels
        a = last mada ;
        madara = mada + r + a ;
        nMadara = mkNounHarm (getHarm madara) "k" madara ;
        nMadár = mkNoun madár ;
    in {s = \\n,c => case <n,c> of {
                -- All plural forms and Sg Acc use the "madara"/"neve" stem
                <Pl,_>|<Sg,Acc> => nMadara.s ! n ! c ;

                -- The rest of the forms are formed with the regular constructor,
                -- using "madár"/"név" as the stem.
                _ => nMadár.s ! n ! c

              } ;
        } ;

  --Handles words like "ló, lé, kő" which are "lovak, levek, kövek" in plural.
  -- <Sg,Sup> "lovon" instead of "lón" fixed but that gives the following problems:
  --TODO: special case <Sg,Sup> "lén" not "leven"
  --TODO: <Sg,Sup> also "kövön" not "köven", but that is due to H_e, which is needed for "köveket" so it's conflicting
  dLó : Str -> Noun = \ló ->
    let lo = shorten ló ;
        lov = lo + "v" ;
        ak : Str = case ló of {
          _ + ("ö" | "ő") => "ek" ;
          _ + ("o" | "ó") => "ak" ;
          lé => shorten (last lé) + "k"} ;
        harmonyPlural : Harm = case ló of {
          _ + ("ö" | "ő") => H_e ; -- All plural allomorphs have E harmony, singular ones have O.
          _ + ("o" | "ó") => H_a ;
          lé => getHarm (lé)} ;
        nLov = mkNounHarmAcc True harmonyPlural ak lov ;
        nLó = mkNoun ló ;
    in {s = \\n,c => case <n,c> of {

                -- All plural forms and Sg Acc, Sg Sup use the "lov" stem
                <Pl,_>| <Sg,Acc> | <Sg,Sup> => nLov.s ! n ! c ;

                -- The rest of the forms are formed with the regular constructor,
                -- using "ló" as the stem.
                _ => nLó.s ! n ! c

              } ;
        } ;

  --Handles words like "tó, hó"" which are "tavak, havak" in plural.
  --(Since I only have these examples for now I do a simplified case with ó, a)
  --<Sg,Sup> "tavon" instead of "tón" case fixed, works automatically with the Sup rules
  --TODO: szó special case which fulfills the plural cases but not the <Sg,Acc> or <Sg,Sup> case ("szót" not "szavat")
  dTó : Str -> Noun = \tó ->
    let t = init tó ;
        tav = t + "av" ;
        nTav = mkNounHarmAcc True H_a "ak" tav ;
        nTó = mkNoun tó ;
    in {s = \\n,c => case <n,c> of {

                -- All plural forms and Sg Acc use the "tav" stem
                <Pl,_>|<Sg,Acc>|<Sg,Sup> => nTav.s ! n ! c ;

                -- The rest of the forms are formed with the regular constructor,
                -- using "tó" as the stem.
                _ => nTó.s ! n ! c

              } ;
        } ;

  --Handles words like "gyomor, majom, retek" which are "gyomrot, majmot, retket" in accusative (wovel dropping base)
  --More examples: "bokor,  cukor,  csokor,  eper,  fészek,  fodor,  gödör,  iker,  izom,  kölyök,  köröm,  méreg,  piszok,  sarok,  selyem,  szeder,  szobor,  takony,  terem,  titok,  torok,  torony,  tükör,  vödör" ->
  --               "bokrot, cukrot, csokrot, epret, fészket, fodrot, gödröt, ikret, izmot, kölyköt, körmet, mérget, piszkot, sarkot, selymet, szedret, szobrot, taknyot, termet, titkot, torkot, tornyot, tükröt, vödröt"
  --<Sg,Sup> case handled
  dMajom : Str -> Noun = \majom ->
        -- Str*Str is syntactic sugar for {p1 : Str ; p2 : Str} ;
        -- confusing syntax: you can't write let <tako,ny> : Str*Str = …
        -- it has to be called something else, and then you
        -- can get "tako" and "ny" with p1, p2.
    let tako_ny : Str*Str = case majom of {
               x + dzs@#trigraph => <x,dzs> ;
               x + zs@#digraph => <x,zs> ;
                  -- ? pattern matches exactly 1 character
               x + s@? => <x,s> } ;
        tako = tako_ny.p1 ;
        ny = tako_ny.p2 ;

        nyo = ny + last tako ;
        tak = init tako ;
        taknyo = tak + nyo ;
        nMajmo = mkNounHarm (getHarm taknyo) "k" taknyo ;
        nMajom = mkNoun majom ;
    in {s = \\n,c => case <n,c> of {
        -- All plural forms and Sg Acc and Sg Sup use the "majmo" stem
        <Pl,_> | <Sg,Acc> | <Sg, Sup> => nMajmo.s ! n ! c ;

        -- The rest of the forms are formed with the regular constructor,
        -- using "majom" as the stem.
        _ => nMajom.s ! n ! c
      } ;
    } ;

  --Handles words like "sátor, ajak, álom, alkalom, farok, halom, haszon, vászon, bátor"

  -- More words not covered by current paradigms:
  -- https://cl.lingfil.uu.se/~bea/publ/megyesi-hungarian.pdf
  -- falu ~ falva-k
  -- sátor ~ sátrak
  -- TODO: do we need possessive forms? e.g. fiú ~ fia{m,d,tok}

  -- regNoun is a /smart paradigm/: it takes one or a couple of forms,
  -- and decides which (non-smart) paradigm is the most likely to match.
  regNoun : Str -> Noun = \sgnom -> case sgnom of {
    _ + "a"|"e"       => dAlma sgnom ;
    _ + ("á"|"é") + ? => dMadár sgnom ;
    _ + ("ó"|"ő")     => dLó sgnom ;

    -- TODO: more non-smart paradigms + more pattern matching
    -- TODO: smart paradigms with >1 form. Which forms are the most descriptive?

    _ => mkNoun sgnom -- Fall back to the regular paradigm
  } ;

--------------------------------------------------------------------------------
-- Following code by EG in 2009 (?), comments and some additions by IL 2020

param
  -- Harmony types
  Harm = H_a | H_e | H_o ;

oper

  -- Vowels as a pattern.
  v : pattern Str = #("a" | "e" | "i" | "o" | "u" | "ö" | "ü" |
                      "á" | "é" | "í" | "ó" | "ú" | "ő" | "ű") ;
  -- Digraphs
  digraph : pattern Str = #("cs"|"dz"|"gy"|"ly"|"ny"|"sz"|"ty"|"zs") ;

  -- Trigraphs
  trigraph : pattern Str = #("dzs") ;

  -- Function to test if a string ends in a vowel
  vowFinal : Str -> Bool = \str ->
    case str of {
      _ + #v => True ; -- Matching a string against a pattern.
      _ => False
    } ;

  lengthen : Str -> Str = \str -> case str of {
    x + "a" => x + "á" ;
    x + "e" => x + "é" ;
    x + "i" => x + "í" ;
    x + "o" => x + "ó" ;
    x + "u" => x + "ú" ;
    x + "ö" => x + "ő" ;
    x + "ü" => x + "ű" ;
    _   => Predef.error "Lengthening not applicable to" ++ str
  } ;

  shorten : Str -> Str = \str -> case str of {
    x + "á" => x + "a" ;
    x + "é" => x + "e" ;
    x + "í" => x + "i" ;
    x + "ó" => x + "o" ;
    x + "ú" => x + "u" ;
    x + "ő" => x + "ö" ;
    x + "ű" => x + "ü" ;
    _   => Predef.error "Shortening not applicable to" ++ str
  } ;

  -- Function to get a harmony from a string
  getHarm : Str -> Harm = \s -> case s of {
    _ + ("a" | "á" | "o" | "ó" | "u" | "ú") + _ => H_a ;
    _ + ("ö" | "ő" | "ü") + _                   => H_o ;
    _ => H_e
    } ;

  -- Used as a table of allomorphs for a give case.
  HarmForms : Type = Harm => Str ;

  -- Functions for constructing a HarmForms table.
  harm3 : Str -> Str -> Str -> HarmForms = \a,e,o -> table {
    H_a => a ;
    H_e => e ;
    H_o => o
    } ;
  harm  : Str -> Str -> HarmForms = \a,e -> harm3 a e e ;
  harm1 : Str -> HarmForms = \i -> harm i i ;

  -- Variant of case forms when the noun stem ends in consonant.
  endCaseCons : Case -> HarmForms = \c -> case c of {
    Nom => harm1 [] ;
    Acc => harm3 "ot" "et" "öt" ;
    Dat => harm "nak" "nek" ;
    Ill => harm "ba" "be" ;
    Ine => harm "ban" "ben" ;
    Ela => harm "ból" "ből" ;
    All => harm3 "hoz" "hez" "höz" ;
    Ade => harm "nál" "nél" ;
    Abl => harm "tól" "től" ;
    Sub => harm "ra" "re" ;
    Sup => harm3 "on" "en" "ön" ;
    Del => harm "ról" "ről" ;
    Cau => harm1 "ért" ;
    Ins => harm "al" "el" ;
    Tra => harm "á" "é"
    -- Ess => harm "stul" "stül" ;  -- Essive-modal 'with <the noun> and its parts'
    -- Ter => harm1 "ig" ; -- Terminative 'as far as <the noun>'
    -- For => harm1 "ként" ; -- Formal 'as <the noun>'
    -- Tem => harm1 "kor" -- Temporal 'at <numeral>'. Only used with numerals.
    } ;

  -- Variant where accusative has the allomorph -at
  endCaseConsAccAt : Case -> HarmForms = \c -> case c of {
    Acc => harm3 "at" "et" "öt" ;
    _   => endCaseCons c
    } ;

  -- Variant of case forms when the noun stem ends in vowel.
  endCaseVow : Case -> HarmForms = \c -> case c of {
    Acc => harm1 "t" ;
    Sup => harm1 "n" ;
    Ins => harm "val" "vel" ;
    Tra => harm "vá" "vé" ;

    -- Other forms are shared with endCaseCons.
    _   => endCaseCons c
  } ;

  -- Function to return a plural allomorph given the stem (e.g. név, almá).
  pluralAllomorph : (stem : Str) -> Str = \stem ->
    case vowFinal stem of {
      True  => "k" ;
      False => harm3 "ok" "ek" "ök" ! getHarm stem
    } ;


  -- Harmony and plural allomorph read from the singular nominative
  mkNoun : Str -> Noun = \w ->
    mkNounHarm (getHarm w) (pluralAllomorph w) w ;

  -- Harmony and plural allomorph given explicitly (check if the True makes it bad)
  mkNounHarm : Harm -> (plural : Str) -> Str -> Noun = mkNounHarmAcc True ;

  mkNounHarmAcc : (useAt : Bool) -> Harm -> (plural : Str) -> Str -> Noun = \useAt,h,plural,w ->
    let endCaseSg : Case -> HarmForms = case <vowFinal w, useAt> of {
                                          <True,_>  => endCaseVow ;
                                          <False,True> => endCaseConsAccAt ;
                                          _  => endCaseCons} ;
        endCasePl : Case -> HarmForms = case <plural, useAt> of {
                                          <"ak",_> => endCaseConsAccAt ;
                                          <_,True> => endCaseConsAccAt ;
                                          _    => endCaseCons } ;
        -- Last consonant doubles before instrumental and translative
        lastCons : Str = case vowFinal w of {
                           True  => [] ;
                           False => last w } ;

        -- Noun is {s : Number => Case => Str}, we construct nested tables.
     in {s = table {
               Sg => table {
                       -- Double the last letter (if consonant) before Ins, Tra
                       c@(Ins|Tra) => w + lastCons + endCaseSg c ! h ;
                       c@_         => w +            endCaseSg c ! h } ;

               Pl => table {
                       -- Double the plural k before Ins, Tra
                       c@(Ins|Tra) => w + plural + "k" + endCasePl c ! h ;

                       -- endCaseCons, because we only use -k as plural morpheme.
                       -- If we add possessive forms with allomorph -i, then revise.
                       c@_         => w + plural +       endCasePl c ! h }
             }
   } ;

}

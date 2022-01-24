--# -path=.:../abstract:../common:../../prelude

resource ResZul = open Prelude,Predef,ParamX in {

  param
    ClassGender = C1_2 | C1a_2a | C3_4 | C5_6 | C7_8 | C9_10 | C11_10 | C9_6 | C14 | C15 | C17 ;
    SemanticType = Human | Animate | Misc ;
    NForm = Full | Reduced | Poss | Loc ;
    Agr = First Number | Second Number | Third ClassGender Number ;

    -- SMood = SIndic | SPot | SSubj ; -- | SConsec ;
    DMood = Princ | Part ; -- mood dimension that depends on grammatical context: principal and participial
    CType = MainCl | RelCl ;
    Aspect = Null | Prog | Excl ;
    -- NOTE: removing the
    -- Tense = Absolute BasicTense | Relative BasicTense BasicTense ;
    -- NOTE: PerfTense maps to recent past, PastTense to remote past. Remote future not yet included.
    -- BasicTense = PerfTense | PastTense | PresTense | FutTense ;
    BasicTense = PresTense | FutTense ; -- | PerfTense | PastTense ;
    -- ZTense = Absolute BasicTense | Relative BasicTense BasicTense ;
    -- ImpForm = Imper | Polite ;
    -- Polarity = Pos | Neg ;

    -- NOTE: Although Poulos+Msimang use "verb form" instead of mood,
    -- we use VForm (verb form) to indicate combination of all parameters
    -- regarding the verb, and hence will use use "mood" for convenience.

    -- replacing BasicTense with Tense, just for now
    -- VForm = VFIndic DMood Polarity BasicTense Aspect | VFPot DMood Polarity Aspect | VFSubj Polarity ;
    -- VForm = VFIndic DMood Polarity BasicTense Aspect | VFPot DMood Polarity Aspect | VFSubj Polarity ;
    VForm = VFIndic CType Polarity BasicTense ;
    VPType = CopIdent | CopAssoc | CopDescr | CopEq | VNPCompl | NoComp | VSCompl | AdvComp ; -- VACompl |
    AuxType = PartAux ; -- TODO: add SubjAux, InfAux, ConsecAux etc (p327)
    AType = AdjType | RelType | EnumType ;

    AForm = AF1 | AF2 | AF3 ; -- two forms for implementing sound changes Poulos+Msimang p143, one for monosyllabic
    SCForm = SC | SCVow | SCNeg | SCPS | SCPart | SCVowP | SCBe ;
    OCForm = OC | OCAE | OCIOU | OCMono | OCThing ;
    RCForm = RelC | RelCA ;

    -- verb root characteristics
    RForm = R_a | R_ile | R_e | R_i | R_anga ;
    RInit = RA | RE | RI | RO | RU | RC ;
    Syl = SylMono | SylMult ;
    Voice = Active | Passive ;

    QuantDef = Article Specificity | Demonstrative Distance ;
    -- Definiteness = Indef | Def ;
    Specificity = Spec | Nonspec ;
    Distance = Dem1 | Dem2 | Dem3 ;

  oper

    prefix_nasal : Str -> Str = \r -> case r of {
      "ph"+x => "mp" + x ;
      "bh"+x => "mb" + x ;
      #nasal_de_asp+"h"+x => "n"+(take 1 r) + x ;
      "hl"+x => "nhl"+x ;
      "h"+x => "nk"+x ;
      "sh"+x => "ntsh"+x ;
      "l"+x => "nd"+x ;
      #nasal_m+x => "m"+r ;
      #nasal_ng+x => "ng"+r ;
      #nasal+x => r ;
      _ => "n"+r
    } ;
    --------------
    -- PRONOUNS --
    --------------
    -- mkFullPron : Str -> Agr -> { s : NForm => Str ; agr : Agr ; empty : Str ; proDrop : Bool } = \s,agr -> {
    --   s = s ;
    --   agr = agr ;
    --   empty = [] ;
    --   proDrop = False
    -- } ;

    mkPron : Agr -> { s : NForm => Str ; agr : Agr ; empty : Str ; proDrop : Bool } = \agr -> {
      s = table {
        Full => pron_stem!agr +"na" ;
        Reduced => pron_stem!agr ;
        Poss => poss_pron_stem!agr ;
        Loc => case agr of {
          First _ | Second Pl => "ki" ++BIND++ pron_stem!agr ;
          _ => "ku" ++BIND++ pron_stem!agr
        }
      } ;
      agr = agr ;
      empty = [] ;
      proDrop = False
    } ;

    full_pron : Str -> Str = \s -> s ++BIND++ "na" ;

    pron_stem : Agr => Str = table {
      First Sg => "mi" ;
      First Pl => "thi" ;
      Second Sg => "we" ;
      Second Pl => "ni" ;
      Third C1_2 Sg => "ye" ;
      Third C1_2 Pl => "bo" ;
      Third C1a_2a Sg => "ye" ;
      Third C1a_2a Pl => "bo" ;
      Third C3_4 Sg  => "wo" ;
      Third C3_4 Pl => "yo" ;
      Third C5_6 Sg => "lo" ;
      Third C5_6 Pl => "wo" ;
      Third C7_8 Sg => "so" ;
      Third C7_8 Pl => "zo" ;
      Third C9_10 Sg => "yo" ;
      Third C9_10 Pl => "zo" ;
      Third C11_10 Sg => "lo" ;
      Third C11_10 Pl => "zo" ;
      Third C9_6 Sg => "yo" ;
      Third C9_6 Pl => "wo" ;
      Third C14 _ => "bo" ;
      Third C15 _ => "kho" ;
      Third C17 _ => "kho"
    } ;

    poss_pron_stem : Agr => Str = table {
      First Sg => "mi" ;
      First Pl => "thu" ;
      Second Sg => "kho" ;
      Second Pl => "nu" ;
      Third C1_2 Sg => "khe" ;
      Third C1_2 Pl => "bo" ;
      Third C1a_2a Sg => "khe" ;
      Third C1a_2a Pl => "bo" ;
      Third C3_4 Sg  => "wo" ;
      Third C3_4 Pl => "yo" ;
      Third C5_6 Sg => "lo" ;
      Third C5_6 Pl => "wo" ;
      Third C7_8 Sg => "so" ;
      Third C7_8 Pl => "zo" ;
      Third C9_10 Sg => "yo" ;
      Third C9_10 Pl => "zo" ;
      Third C11_10 Sg => "lo" ;
      Third C11_10 Pl => "zo" ;
      Third C9_6 Sg => "yo" ;
      Third C9_6 Pl => "wo" ;
      Third C14 _ => "bo" ;
      Third C15 _ => "kho" ;
      Third C17 _ => "kho"
    } ;

    dem_pron : Distance => Agr => Str = table {
      Dem1 => table {
        First Sg => "lo" ;
        First Pl => "laba" ;
        Second Sg => "lo" ;
        Second Pl => "laba" ;
        Third C1_2 Sg => "lo" ;
        Third C1_2 Pl => "laba" ;
        Third C1a_2a Sg => "lo" ;
        Third C1a_2a Pl => "laba" ;
        Third C3_4 Sg => "lo" ;
        Third C3_4 Pl => "le" ;
        Third C5_6 Sg => "leli" ;
        Third C5_6 Pl => "la" ;
        Third C7_8 Sg => "lesi" ;
        Third C7_8 Pl => "lezi" ;
        Third C9_10 Sg => "le" ;
        Third C9_10 Pl => "lezi" ;
        Third C11_10 Sg => "lolu" ;
        Third C11_10 Pl => "lezi" ;
        Third C9_6 Sg => "le" ;
        Third C9_6 Pl => "la" ;
        Third C14 _ => "lobu" ;
        Third C15 _ => "lokhu" ;
        Third C17 _ => "lapha"
      } ;
      Dem2 => table {
        First Sg => "lowo" ;
        First Pl => "labo" ;
        Second Sg => "lowo" ;
        Second Pl => "labo" ;
        Third C1_2 Sg => "lowo" ;
        Third C1_2 Pl => "labo" ;
        Third C1a_2a Sg => "lowo" ;
        Third C1a_2a Pl => "labo" ;
        Third C3_4 Sg => "lowo" ;
        Third C3_4 Pl => "leyo" ;
        Third C5_6 Sg => "lelo" ;
        Third C5_6 Pl => "lawo" ;
        Third C7_8 Sg => "leso" ;
        Third C7_8 Pl => "lezo" ;
        Third C9_10 Sg => "leyo" ;
        Third C9_10 Pl => "lezo" ;
        Third C11_10 Sg => "lolo" ;
        Third C11_10 Pl => "lezo" ;
        Third C9_6 Sg => "leyo" ;
        Third C9_6 Pl => "lawo" ;
        Third C14 _ => "lobo" ;
        Third C15 _ => "lokho" ;
        Third C17 _ => "lapho"
      } ;
      Dem3 => table {
        First Sg => "loya" ;
        First Pl => "labaya" ;
        Second Sg => "loya" ;
        Second Pl => "labaya" ;
        Third C1_2 Sg => "loya" ;
        Third C1_2 Pl => "labaya" ;
        Third C1a_2a Sg => "loya" ;
        Third C1a_2a Pl => "labaya" ;
        Third C3_4 Sg => "loya" ;
        Third C3_4 Pl => "leya" ;
        Third C5_6 Sg => "leliya" ;
        Third C5_6 Pl => "lawaya" ;
        Third C7_8 Sg => "lesiya" ;
        Third C7_8 Pl => "leziya" ;
        Third C9_10 Sg => "leya" ;
        Third C9_10 Pl => "leziya" ;
        Third C11_10 Sg => "loluya" ;
        Third C11_10 Pl => "leziya" ;
        Third C9_6 Sg => "leya" ;
        Third C9_6 Pl => "lawaya" ;
        Third C14 _ => "lobuya" ;
        Third C15 _ => "lokhuya" ;
        Third C17 _ => "laphaya"
      }
    } ;

    -- dem_pron : Distance => ClassGender => Number => Str = table {
    --   Dem1 => table {
    --     C1_2 => table { Sg => "lo" ; Pl => "laba" } ;
    --     C1a_2a => table { Sg => "lo" ; Pl => "laba" } ;
    --     C3_4  => table { Sg => "lo" ; Pl => "le" } ;
    --     C5_6 => table { Sg => "leli" ; Pl => "la" } ;
    --     C7_8 => table { Sg => "lesi" ; Pl => "lezi" } ;
    --     C9_10 => table { Sg => "le" ; Pl => "lezi" } ;
    --     C11_10 => table { Sg => "lolu" ; Pl => "lezi" } ;
    --     C9_6 => table { Sg => "le" ; Pl => "la" } ;
    --     C14 => \\_ => "lobu" ;
    --     C15 => \\_ => "lokhu" ;
    --     C17 => \\_ => "lapha"
    --   } ;
    --   Dem2 => table {
    --     C1_2 => table { Sg => "lowo" ; Pl => "labo" } ;
    --     C1a_2a => table { Sg => "lowo" ; Pl => "labo" } ;
    --     C3_4  => table { Sg => "lowo" ; Pl => "leyo" } ;
    --     C5_6 => table { Sg => "lelo" ; Pl => "lawo" } ;
    --     C7_8 => table { Sg => "leso" ; Pl => "lezo" } ;
    --     C9_10 => table { Sg => "leyo" ; Pl => "lezo" } ;
    --     C11_10 => table { Sg => "lolo" ; Pl => "lezo" } ;
    --     C9_6 => table { Sg => "leyo" ; Pl => "lawo" } ;
    --     C14 => \\_ => "lobo" ;
    --     C15 => \\_ => "lokho" ;
    --     C17 => \\_ => "lapho"
    --   } ;
    --   Dem3 => table {
    --     C1_2 => table { Sg => "loya" ; Pl => "labaya" } ;
    --     C1a_2a => table { Sg => "loya" ; Pl => "labaya" } ;
    --     C3_4  => table { Sg => "loya" ; Pl => "leya" } ;
    --     C5_6 => table { Sg => "leliya" ; Pl => "lawaya" } ;
    --     C7_8 => table { Sg => "lesiya" ; Pl => "leziya" } ;
    --     C9_10 => table { Sg => "leya" ; Pl => "leziya" } ;
    --     C11_10 => table { Sg => "loluya" ; Pl => "leziya" } ;
    --     C9_6 => table { Sg => "leya" ; Pl => "lawaya" } ;
    --     C14 => \\_ => "lobuya" ;
    --     C15 => \\_ => "lokhuya" ;
    --     C17 => \\_ => "laphaya"
    --   }
    -- } ;

    -----------
    -- VERBS --
    -----------
    regVerb : Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice } = \root ->
    {
      s = table {
        R_a => root ++BIND++ "a" ;
        R_ile => case root of {
          _+"el" => root ++BIND++ "e" ;
          _ => root ++BIND++ "ile"
        } ;
        R_e => root ++BIND++ "e" ;
        R_i => root ++BIND++ "i" ;
        R_anga => root ++BIND++ "anga"
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active
    } ;

    th_Verb : Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice } = \th,thi ->
    {
      s = table {
        R_a => thi ;
        R_ile => th ++BIND++ "ile" ;
        R_e => th ++BIND++ "e" ;
        R_i => th ++BIND++ "i" ;
        R_anga => th ++BIND++ "anga"
      } ;
      r = case th of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case th of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active
    } ;

    three_Verb : Str -> Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice } = \root,r_a,r_ile -> {
      s = table {
        R_a => r_a ;
        R_ile => r_ile ;
        R_e => root ++BIND++ "e" ;
        R_i => root ++BIND++ "i" ;
        R_anga => root ++BIND++ "anga"
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active
    } ;

    four_Verb : Str -> Str -> Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice } = \root,r_a,r_ile,r_e -> {
      s = table {
        R_a => r_a ;
        R_ile => r_ile ;
        R_e => r_e ;
        R_i => root ++BIND++ "i" ;
        R_anga => root ++BIND++ "anga"
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active
    } ;

    -- irregVerb : Str -> Str -> Str -> Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice } = \hamba,hambile,hambe,hambi,hambanga -> {
    --   s = table {
    --     R_a => hamba ;
    --     R_ile => hambile ;
    --     R_e => hambe ;
    --     R_i => hambi ;
    --     R_anga => hambanga
    --   } ;
    --   r = case root of {
    --     "a"+_ => RA ;
    --     "e"+_ => RE ;
    --     "i"+_ => RI ;
    --     "o"+_ => RO ;
    --     "u"+_ => RU ;
    --     _ => RC
    --   } ;
    --   syl = case root of {
    --     _+#cons+#vowel+#cons+_ => SylMult ;
    --     _ => SylMono
    --   } ;
    --   voice = Active
    -- } ;

    passiveVerb : Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice } = \root ->
    {
      s = table {
        R_a => root ++BIND++ "a" ;
        R_ile => root ++BIND++ "ile" ;
        R_e => root ++BIND++ "e" ;
        R_i => root ++BIND++ "i" ;
        R_anga => root ++BIND++ "anga"
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Passive
    } ;

    -- Determine which form of the verb root to use
    -- we're keeping the case statement for when we add back -e and -ile
    rform : VForm -> Bool -> RForm = \vform,longform -> case longform of {
      True => case vform of {
        VFIndic _ Pos PresTense => R_a ;
        VFIndic MainCl Neg PresTense => R_i ;
        VFIndic RelCl Neg PresTense => R_i ;
        VFIndic _ _ FutTense => R_a
      } ;
      False => case vform of {
        VFIndic _ Pos PresTense => R_a ;
        VFIndic MainCl Neg PresTense => R_i ;
        VFIndic RelCl Neg PresTense => R_i ;
        VFIndic _ _ FutTense => R_a
      }
    } ;

    -- VERB MORPHEMES --

    -- tense prefix
    tensePref : VForm -> Str = \vform ->
      case vform of {
        VFIndic _ Pos FutTense => "zo" ++BIND ;
        VFIndic _ Neg FutTense => "zu" ++BIND ;
        -- VFIndic _ Pos PastTense _ => "a" ++BIND ;
        VFIndic _ _ _ => [] --;
        -- VFPot _ _ _ => [] ;
        -- VFSubj _ => []
      } ;

    -- negative prefix
    negPref : VForm -> Str = \vform ->
      case vform of {
        VFIndic _ Neg _ => "a"++BIND ;
        VFIndic _ _ _ => []
      } ;

      -- TODO : sound rules to choose between nge and nga
    -- negPref2 : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic Part Neg FutTense Null => "nga" ++BIND ; -- sometimes nge? p274
    --     -- VFIndic Part Neg _ _ => pre { "z" => "nge" ; _ => "nga" } ++BIND ;
    --     VFIndic Part Neg _ _ => "nga" ++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj Neg => pre { "z" => "nge" ; _ => "nga" } ++BIND ;
    --     VFSubj Pos => []
    --   } ;

    negPrefNga : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg _ => "nga" ;
      VFIndic _ Pos _ => []
    } ;

    negPrefNge : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg _ => "nge" ;
      VFIndic _ Pos _ => []
    } ;

    icompNeg1 : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg PresTense => "a"++BIND ;
      VFIndic _ _ _ => []
    } ;

    icompNeg2 : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg _ => "nga"++BIND ;
      VFIndic _ _ _ => []
    } ;

    -- -- progressive prefix
    -- progPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Pos PastTense Prog => nonExist ; -- progressive past does not occur
    --     VFIndic _ Pos PastTense _ => [] ;
    --     VFIndic _ Pos _ Prog => "sa" ++BIND ;
    --     VFIndic _ Pos _ _ => [] ;
    --     VFIndic _ Neg FutTense Prog => "se" ++BIND ;
    --     VFIndic _ Neg _ Prog => "sa" ++BIND ;
    --     VFIndic _ _ _ Prog => nonExist ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ Prog => "se" ++BIND ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj _ => []
    --
    --   } ;

    -- progressive prefix
    -- progPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Pos PastTense _ => nonExist ; -- progressive past does not occur
    --     -- VFIndic _ Pos PastTense _ => [] ;
    --     VFIndic _ Pos _ _ => "sa" ++BIND ;
    --     -- VFIndic _ Pos _ _ => [] ;
    --     VFIndic _ Neg FutTense _ => "se" ++BIND ;
    --     VFIndic _ Neg _ _ => "sa" ++BIND ;
    --     VFIndic _ _ _ _ => nonExist ;
    --     -- VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ _ => "se" ++BIND ;
    --     -- VFPot _ _ _ => [] ;
    --     VFSubj _ => nonExist
    --
    --   } ;

    -- exclusive se prefix
    -- exclSePref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Pos _ Excl => "se"++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ Pos Excl => "se"++BIND ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj _ => []
    --   } ;
    --
    -- -- exclusive ka prefix
    -- exclKaPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Neg (PresTense | FutTense) Excl => "ka" ++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj _ => []
    --   } ;

    -- potential prefix
    -- potPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFPot _ Pos _ => "nga" ++BIND ;
    --     VFPot _ Neg _ => "nge" ++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFSubj _ => []
    --   } ;

    -- VForm = VFIndic DMood Polarity BasicTense Aspect | VFPot DMood Polarity Aspect | VFSubj Polarity ;
    -- aux_be : VForm -> Agr -> Str = \vform,agr ->
    -- let
    --   sc = subjConc vform agr False ;
    --   scvow = subjConc vform agr True ;
    --   short_be = case agr of {
    --     -- Second Pl => sc ++ "bu" ;
    --     -- Third C3_4 Sg => sc ++ "bu" ;
    --     -- Third C3_4 Pl => sc ++ "bi" ;
    --     -- Third C9_6 Sg | Third C9_10 Sg => sc ++ "bi" ;
    --     First _ | Second _ | Third _ _ => subjConcLookup!agr!SCBe
    --   }
    -- in
    -- case vform of {
    --   VFIndic Princ Pos PresTense _ => [] ;
    --   VFIndic Princ Pos PerfTense _ => short_be ++BIND ; -- 2021-01-26, chose to only implement short form
    --   VFIndic Princ Pos FutTense _ => sc ++ "zobe" ;
    --   VFIndic Princ Pos PastTense _ => scvow ++ "abe" ;
    --
    --   VFIndic Princ Neg PresTense _ => [] ;
    --   VFIndic Princ Neg PerfTense _ => short_be ++BIND ;
    --   VFIndic Princ Neg FutTense _ => sc ++ "zobe" ;
    --   VFIndic Princ Neg PastTense _ => scvow ++ "abe" ;
    --
    --   VFIndic Part Pos PresTense _ => [] ;
    --   VFIndic Part Pos PerfTense _ => short_be ++BIND ;
    --   VFIndic Part Pos FutTense _ => sc ++ "zobe" ;
    --   VFIndic Part Pos PastTense _ => scvow ++ "abe" ;
    --
    --   VFIndic Part Neg PresTense _ => [] ;
    --   VFIndic Part Neg PerfTense _ => short_be ++BIND ;
    --   VFIndic Part Neg FutTense _ => sc ++ "zobe" ;
    --   VFIndic Part Neg PastTense _ => scvow ++ "abe" ;
    --
    --   VFPot _ Pos _ => sc ++ "ngaba" ;
    --   VFPot _ Neg _ => sc ++ "ngebe" ;
    --   VFSubj Pos => sc ++ "be" ++BIND ;
    --   VFSubj Neg => sc ++ "ngabi"
    -- } ;

    -------------
    -- ADVERBS --
    -------------
    regAdv : Str -> { s : Str ; asp : Aspect ; reqLocS : Bool } = \adv ->
    {
      s = adv ;
      asp = Null ;
      reqLocS = False
    } ;

    aspAdv : Str -> Aspect -> { s : Str ; asp : Aspect ; reqLocS : Bool } = \adv,asp ->
    {
      s = adv ;
      asp = asp ;
      reqLocS = False
    } ;

    -- together with
    withPref : RInit => Str = table {
      RU => "no" ;
      RI => "ne" ;
      RO => "no" ;
      _  => "na"
    } ;

    -- just like
    eqPref : RInit => Str = table {
      RU => "njengo" ;
      RI => "njenge" ;
      RO => "njengo" ;
      _  => "njenga"
    } ;

    -- as big as
    eqSizePref : RInit => Str = table {
      RU => "ngango" ;
      RI => "ngange" ;
      RO => "ngango" ;
      _  => "nganga"
    } ;

    -- with
    instrPref : RInit => Str = table {
      RU => "ngo" ;
      RI => "nge" ;
      RO => "ngo" ;
      _  => "nga"
    } ;

    --------------------
    -- QUALIFICATIVES --
    --------------------
    regAdj : Str -> { s : AForm => Str ; empty : Str ; t : AType } = \a ->
    {
      s = table {
        AF1 => a ;
        AF2 => prefix_nasal a ;
        AF3 => case a of {
          #cons+#cons*+#vowel => "u"+a ;
          _ => a
        }
      } ;
      -- b = case a of {
      --   ("kh"|"th"|"sh"|"b"|"f"|"hl")+_ => True ;
      --   ("m"|"n")+_ => True ;
      --   _ => False
      -- } ;
      empty = [] ;
      t = AdjType
    } ;

    relAdj : Str -> { s : AForm => Str ; empty : Str ; t : AType } = \a ->
    {
      s = \\_ => a ;
      -- b = case a of {
      --   ("kh"|"th"|"sh"|"b"|"f"|"hl")+_ => True ;
      --   ("m"|"n")+_ => True ;
      --   _ => False
      -- } ;
      empty = [] ;
      t = RelType
    } ;

    enumAdj : Str -> { s : AForm => Str ; empty : Str ; t : AType } = \a ->
    {
      s = \\_ => a ;
      -- b = case a of {
      --   ("kh"|"th"|"sh"|"b"|"f"|"hl")+_ => True ;
      --   ("m"|"n")+_ => True ;
      --   _ => False
      -- } ;
      empty = [] ;
      t = EnumType
    } ;

    -- relSuf : VForm -> Bool -> Str = \longform ->
    -- case longform of {
    --   True => pre { #vowel => [] ; #cons => [] ; "y" => [] ; _ => "yo" } ;
    --   False => []
    -- } ;

    rel_yo : Str = pre {
      #vowel => [] ;
      #cons => [] ;
      _ => BIND++"yo"
    } ;

    rel_yo_2 : Str = BIND++"yo" ;

    relSuf : VForm -> Str = \vform -> case vform of {
      VFIndic _ Pos PresTense => rel_yo_2 ;
      VFIndic _ Neg PresTense => [] ;
      VFIndic _ _ FutTense => []
    } ;

    -- chooses the form of the root to use for N-prefixes
    aformN : Agr -> AForm = \agr ->
      case agr of {
        Third C1_2 Sg => AF3 ;
        Third C1a_2a Sg => AF3 ;
        Third C3_4 Sg => AF3 ;
        Third C7_8 Pl => AF2 ;
        Third C9_10 Sg => AF2 ;
        Third C9_10 Pl => AF2 ;
        Third C9_6 Sg => AF2 ;
        Third C11_10 Pl => AF2 ;
        _ => AF1
      } ;

    adjPrefLookup : Agr => Str =
      table {
        Third C1_2 Sg => "m" ;
        Third C1_2 Pl => "ba" ;
        Third C1a_2a Sg => "m" ;
        Third C1a_2a Pl => "ba" ;
        Third C3_4 Sg  => "m" ;
        Third C3_4 Pl => "mi" ;
        Third C5_6 Sg => "li" ;
        Third C5_6 Pl => "ma" ;
        Third C7_8 Sg => "si" ;
        Third C7_8 Pl => "zi" ; -- nasal for 8,9,10 assumed to be fixed to root
        Third C9_10 Sg => "i" ;
        Third C9_10 Pl => "zi" ;
        Third C11_10 Sg => "lu" ;
        Third C11_10 Pl => "zi" ;
        Third C9_6 Sg => "i" ;
        Third C9_6 Pl => "ma" ;
        Third C14 _ => "bu" ;
        Third C15 _ => "ku" ;
        Third C17 _ => "ku" ;
        First Sg => "m" ;
        First Pl => "ba" ;
        Second Sg => "m" ;
        Second Pl => "om"
      } ;

    -- adjPrefLookup : Agr => AForm => Str =
    --   table {
    --     Third C1_2 Sg => \\_ => "m" ;
    --     Third C1_2 Pl => \\_ => "ba" ;
    --     Third C1a_2a Sg => \\_ => "m" ;
    --     Third C1a_2a Pl => \\_ => "ba" ;
    --     Third C3_4 Sg  => \\_ => "m" ;
    --     Third C3_4 Pl => \\_ => "mi" ;
    --     Third C5_6 Sg => \\_ => "li" ;
    --     Third C5_6 Pl => \\_ => "ma" ;
    --     Third C7_8 Sg => \\_ => "si" ;
    --     Third C7_8 Pl => table { AF1 => "zin" ; AF2 => "zi" } ;
    --     Third C9_10 Sg => table { AF1 => "in" ; AF2 => "i" } ;
    --     Third C9_10 Pl => table { AF1 => "zin" ; AF2 => "zi" } ;
    --     Third C11_10 Sg => \\_ => "lu" ;
    --     Third C11_10 Pl => table { AF1 => "zin" ; AF2 => "zi" } ;
    --     Third C9_6 Sg => table { AF1 => "in" ; AF2 => "i" } ;
    --     Third C9_6 Pl => \\_ => "ma" ;
    --     Third C14 _ => \\_ => "bu" ;
    --     Third C15 _ => \\_ => "ku" ;
    --     Third C17 _ => \\_ => "ku" ;
    --     First Sg => \\_ => "mu" ;
    --     First Pl => \\_ => "ba" ;
    --     Second Sg => \\_ => "mu" ;
    --     Second Pl => \\_ => "om"
    --   } ;

    atwhichPhiPref : Agr => Str =
      table {
        Third C1_2 Sg => "mu" ;
        Third C1_2 Pl => "ba" ;
        Third C1a_2a Sg => "mu" ;
        Third C1a_2a Pl => "ba" ;
        Third C3_4 Sg  => "mu" ;
        Third C3_4 Pl => "mi" ;
        Third C5_6 Sg => "li" ;
        Third C5_6 Pl => "ma" ;
        Third C7_8 Sg => "si" ;
        Third C7_8 Pl => "zi" ;
        Third C9_10 Sg => "yi" ;
        Third C9_10 Pl => "zi" ;
        Third C11_10 Sg => "lu" ;
        Third C11_10 Pl => "zi" ;
        Third C9_6 Sg => "yi" ;
        Third C9_6 Pl => "ma" ;
        Third C14 _ => "bu" ;
        Third C15 _ => "ku" ;
        Third C17 _ => "ku" ;
        First Sg => "mu" ;
        First Pl => "ba" ;
        Second Sg => "mu" ;
        Second Pl => "om"
      } ;

    -----------
    -- NOUNS --
    -----------
    -- worst case
    mkNoun : (noms,nomp,locs,locp : Str) -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str } =
      \noms,nomp,locs,locp,cg ->
      let
        sg_agr = Third cg Sg ;
        pl_agr = Third cg Pl ;
      in
      {
        s = table {
          Sg => table {
            Full => noms ;
            Reduced => (drop_init_vowel noms) ;
            Poss => (drop_init_vowel noms) ;
            Loc => locs
        } ;
          Pl => table {
            Full => nomp ;
            Reduced => (drop_init_vowel nomp) ;
            Poss => (drop_init_vowel nomp) ;
            Loc => locp
          }
        } ;
        c = cg ;
        empty = []
      } ;

    semiRegNoun : (root,locs,locp : Str) -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str } =
      \root,locs,locp,cg ->
      let
        noms : Str = nomNoun root Sg cg ;
        nomp : Str = nomNoun root Pl cg ;
      in
      mkNoun noms nomp locs locp cg ;

    regNoun : Str -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str } =
      \root,cg ->
      let
        noms : Str = nomNoun root Sg cg ;
        nomp : Str = nomNoun root Pl cg ;
        locs : Str = locNoun root Sg cg ;
        locp : Str = locNoun root Pl cg ;
        empty = []
      in
      mkNoun noms nomp locs locp cg ;

    kwaProperName : Str -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str } =
    \root,cg ->
    let
      noms : Str = nomNoun root Sg cg ;
      nomp : Str = nomNoun root Sg cg ;
      locs : Str = "Kwa"+root ;
      locp : Str = "Kwa"+root ;
    in
      mkNoun noms nomp locs locp cg ;

    initNP : Bool -> Agr -> RInit = \ispron,agr -> case ispron of {
      True => RC ;
      False => nominit!agr
    } ;

    nominit : Agr => RInit =
    table {
      Third C1_2 Sg => RU ;
      Third C1_2 Pl => RA ;
      Third C1a_2a Sg => RU ;
      Third C1a_2a Pl => RO ;
      Third C3_4 Sg  => RU ;
      Third C3_4 Pl => RI ;
      Third C5_6 Sg => RI ;
      Third C5_6 Pl => RA ;
      Third C7_8 Sg => RI ;
      Third C7_8 Pl => RI ;
      Third C9_10 Sg => RI ;
      Third C9_10 Pl => RI ;
      Third C11_10 Sg => RU ;
      Third C11_10 Pl => RI ;
      Third C9_6 Sg => RI ;
      Third C9_6 Pl => RA ;
      Third C14 _ => RU ;
      Third C15 _ => RU ;
      Third C17 _ => RU ;
      (First _ | Second _ )  => RC
    } ;

    locinit : Agr => RInit =
    table {
      Third C1_2 Sg => RC ;
      Third C1_2 Pl => RC ;
      Third C1a_2a Sg => RC ;
      Third C1a_2a Pl => RC ;
      Third _ _  => RE ;
      (First _ | Second _ )  => RC
    } ;

    -- Src: Doke
    addLocSuffix : Str -> Str = \root ->
      case root of
      {
        _+"bo" => (tk 2 root) + "tsheni" ;
        _+"pho" => (tk 3 root) + "sheni" ;
        _+"bho" => (tk 3 root) + "jeni" ;
        _+"bu" => (tk 2 root) + "tshini" ;
        _+"phu" => (tk 3 root) + "shini" ;
        _+"bhu" => (tk 3 root) + "jini" ;
        _+("a"|"e") => (init root)+"eni" ;
        _+"i" => (init root)+"ini" ;
        _+"o" => (init root)+"weni" ;
        _+"u" => (init root)+"wini" ;
        _ => (init root)+"ini"
      } ;

    drop_init_vowel : Str -> Str = \s ->
    case s of {
      ("a"|"e"|"i"|"o"|"u")+_ => (drop 1 s) ;
      _ => s
    } ;

    vowel : pattern Str = #("a"|"e"|"i"|"o"|"u") ;
    cons : pattern Str = #("b"|"c"|"d"|"f"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"t"|"v"|"w"|"x"|"y"|"z") ;
    labial_cons : pattern Str = #("p"|"b"|"f"|"v"|"w") ;
    alveolar_cons : pattern Str = #("s"|"d"|"t"|"z") ;
    nasal_de_asp : pattern Str = #("t"|"k"|"x"|"c"|"q") ;
    nasal_m : pattern Str = #("v"|"f"|"b") ;
    nasal_ng : pattern Str = #("x"|"c"|"q") ;
    nasal : pattern Str = #("n"|"m") ;

    nomNoun : Str -> Number -> ClassGender -> Str = \root,n,cg ->
      case <cg,n> of
      {
        <C1_2,Sg> => case root of {
          _+#cons+#vowel+#cons+_+#vowel+_ => "um"+root ;
          _ => "umu"+root
        } ; -- umu for single syllables, um for the rest
        <C1_2,Pl> => "aba"+root ; -- abe for tribes or guilds
        <C1a_2a,Sg> => "u"+root ;
        <C1a_2a,Pl> => "o"+root ;
        <C3_4,Sg> => case root of {
          ("m"|"n")+_+#vowel+#cons+_+#vowel+_ => "u"+root ;
          _+(#cons|"y")+#vowel+#cons+_+#vowel+_ => "um"+root ;
          "o"+_ => "um"+root ;
          _ => "umu"+root
        } ; -- umu for single syllables, um for the rest
        <C3_4,Pl> => "imi"+root ;
        <C5_6,Sg> => "i"+root ; -- ili long form (not used?)
        <C5_6,Pl> => case root of {
          "i"+_ => "ame"+root ;
          _ => "ama"+root
        } ; -- ame for roots starting with i
        <C7_8,Sg> => case root of {
          #vowel+_ => "is"+root ;
          _ => "isi"+root
        } ; -- is for roots starting with vowel
        <C7_8,Pl> => case root of {
          #vowel+_ => "iz"+root ;
          _ => "izi" + root
        } ;
        <C9_10,Sg> => "i" + prefix_nasal root ;
        <C9_10,Pl> => "izi" + prefix_nasal root ;
        <C11_10,Sg> => "u"+root ;
        <C11_10,Pl> => "izi" + prefix_nasal root ;
        <C9_6,Sg> => "i" + prefix_nasal root ;
        <C9_6,Pl> => case root of {
          "i"+_ => "ame"+root ;
          _ => "ama"+root
        } ; -- ame for roots starting with i
        <C14,_> => "ubu"+root ;
        <C15,_> => case root of {
          ("a"|"e")+_ => "ukw"+root ;
          (#cons|"y")+_ => "uku"+root ;
          _ => "uk"+root
        } ; -- ukw for roots starting with a/e, uk for roots starting with o
        <C17,_> => "uku"+root  -- sometimes ukw
      } ;

    locNoun : Str -> Number -> ClassGender -> Str = \root,n,cg ->
        case <cg,n> of
        {
          <C1_2,Sg> => case root of {
            _+#cons+#vowel+#cons+_+#vowel+_ => "kum"+root ;
            _ => "kumu"+root
          } ; -- umu for single syllables, um for the rest
          <C1_2,Pl> => "kuba"+root ; -- abe for tribes or guilds
          <C1a_2a,Sg> => "ku"+root ;
          <C1a_2a,Pl> => "ko"+root ;
          <C3_4,Sg> => case root of {
            ("m"|"n")+_ => "e"+(addLocSuffix root) ;
            -- #labial_cons+_ => "em"+(addLocSuffix root) ;
            -- "gw"+_ => "em"+(addLocSuffix root) ;
            -- "hl"+_ => "em"+(addLocSuffix root) ;
            _ => "em"+(addLocSuffix root)
          } ;
          <C3_4,Pl> => "emi"+(addLocSuffix root) ;
          <C5_6,Sg> => "e"+(addLocSuffix root) ; -- ili long form (not used?)
          <C5_6,Pl> => case root of {
            "i"+_ => "eme"+(addLocSuffix root) ;
            _ => "ema"+(addLocSuffix root)
          } ; -- ame for roots starting with i
          <C7_8,Sg> => case root of {
            #vowel+_ => "es"+(addLocSuffix root) ;
            _ => "esi"+(addLocSuffix root)
          } ; -- is for roots starting with vowel
          <C7_8,Pl> => case root of {
            #vowel+_ => "ez"+(addLocSuffix root) ;
            _ => "ezi"+(addLocSuffix root)  -- iz for roots starting with vowel
          } ;
          <C9_10,Sg> => "e"+(addLocSuffix (prefix_nasal root)) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
          <C9_10,Pl> => "ezi"+(addLocSuffix (prefix_nasal root)) ; -- izim for labial, izin for alveolar (TODO: does this correctly split options?)
          <C11_10,Sg> => "o"+(addLocSuffix root) ;
          <C11_10,Pl> => "ezi"+(addLocSuffix (prefix_nasal root)) ; -- izim for labial, izin for alveolar, izi(n|m)k for roots starting with kh
          <C9_6,Sg> => "e"+(addLocSuffix (prefix_nasal root)) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
          <C9_6,Pl> => case root of {
            "i"+_ => "eme"+(addLocSuffix root) ;
            _ => "ema"+(addLocSuffix root)
          } ; -- ame for roots starting with i
          <C14,_> => "ebu"+(addLocSuffix root) ;
          <C15,_> => case root of {
            ("a"|"e")+_ => "ekw"+(addLocSuffix root) ;
            (#cons|"y")+_ => "eku"+root ;
            _ => "ek"+(addLocSuffix root)
            } ; -- ukw for roots starting with a/e, uk for roots starting with o
          <C17,_> => "eku"+(addLocSuffix root)  -- sometimes ukw
        } ;

      lin_NP : {
        empty : Str ;
        s : NForm => Str ;
        mod : Str ;
        dem : Str ;
        predet_pre : Str ;
        predet_post : Str ;
        agr : Agr ;
        proDrop : Bool ;
        isPron : Bool ;
        -- reqLocS : Bool ;
        qdef : QuantDef
      } -> Str = \np ->
      np.predet_pre ++
      case <np.qdef,np.isPron> of {
        <Article d,_> => np.s ! Full ++ np.mod ;
        <Demonstrative d,False> => np.dem ++ np.s ! Reduced ++ np.mod ;
        <Demonstrative d,True> => np.dem ++ np.s ! Full ++ np.mod
      }
      ++ np.predet_post ;

      loc_NP : {
        empty : Str ;
        s : NForm => Str ;
        mod : Str ;
        dem : Str ;
        predet_pre : Str ;
        predet_post : Str ;
        agr : Agr ;
        proDrop : Bool ;
        isPron : Bool ;
        -- reqLocS : Bool ;
        qdef : QuantDef
      } -> Str = \np -> np.s!Loc ++ np.dem ++ np.mod ++ np.predet_pre ++ np.predet_post ;

      poss_NP : {
        empty : Str ;
        s : NForm => Str ;
        -- mod : Str ;
        -- dem : Str ;
        -- predet_pre : Str ;
        -- predet_post : Str ;
        agr : Agr ;
        proDrop : Bool ;
        isPron : Bool
        -- reqLocS : Bool ;
        -- qdef : QuantDef
      } -> Str = \np -> np.s!Poss ;

      pref_lin_NP : {
        empty : Str ;
        s : NForm => Str ;
        mod : Str ;
        dem : Str ;
        predet_pre : Str ;
        predet_post : Str ;
        agr : Agr ;
        proDrop : Bool ;
        isPron : Bool ;
        -- reqLocS : Bool ;
        qdef : QuantDef
      } -> Str = \np -> np.s ! Reduced ++ np.dem ++ np.mod
      ++ np.predet_pre ++ np.predet_post ;

    ----------------
    -- CONGRUENCE --
    ----------------

    -- SUBJECT AGREEMENT MORPHEME --

    -- NOTE : the empty SCVow for class 6 might produce a dangling BIND token, causing bugs
    -- TODO: SC following vowel
    subjConcLookup : Agr => SCForm => Str =
      table {
        -- agr                     default        before vowel     after neg pref    sit/part         potential/subjunct/indirect relative
        First Sg =>         table {SC => "ngi" ;  SCVow => "ng"++BIND ;  SCNeg => "ngi" ; SCPart => "ngi" ; SCPS => "ngi" ; SCVowP => "ngi" ; SCBe => "bengi" } ;
        Second Sg =>        table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "wu" ;  SCPart => "u" ;   SCPS => "u" ;   SCVowP => "wu" ;  SCBe => "ubu" } ;
        First Pl =>         table {SC => "si" ;   SCVow => "s"++BIND ;   SCNeg => "si" ;  SCPart => "si" ;  SCPS => "si" ;  SCVowP => "si" ;  SCBe => "besi" } ;
        Second Pl =>        table {SC => "ni" ;   SCVow => "n"++BIND ;   SCNeg => "ni" ;  SCPart => "ni" ;  SCPS => "ni" ;  SCVowP => "ni" ;  SCBe => "beni" } ;
        Third C1_2 Sg =>    table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "ka" ;  SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wu" ;  SCBe => "ube" } ;
        Third C1_2 Pl =>    table {SC => "ba" ;   SCVow => "b"++BIND ;   SCNeg => "ba" ;  SCPart => "be" ;  SCPS => "ba" ;  SCVowP => "ba" ;  SCBe => "bebe" } ;
        Third C1a_2a Sg =>  table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "ka" ;  SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wu" ;  SCBe => "ube" } ;
        Third C1a_2a Pl =>  table {SC => "ba" ;   SCVow => "b"++BIND ;   SCNeg => "ba" ;  SCPart => "be" ;  SCPS => "ba" ;  SCVowP => "ba" ;  SCBe => "bebe" } ;
        Third C3_4 Sg =>    table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "wu" ;  SCPart => "u" ;   SCPS => "u" ;   SCVowP => "wu" ;  SCBe => "ubu" } ;
        Third C3_4 Pl =>    table {SC => "i" ;    SCVow => "y"++BIND ;   SCNeg => "yi" ;  SCPart => "i" ;   SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" } ;
        Third C5_6 Sg =>    table {SC => "li" ;   SCVow => "l"++BIND ;   SCNeg => "li" ;  SCPart => "li" ;  SCPS => "li" ;  SCVowP => "li" ;  SCBe => "beli" } ;
        Third C5_6 Pl =>    table {SC => "a" ;    SCVow => [] ;          SCNeg => "wa" ;  SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wa" ;  SCBe => "abe" } ;
        Third C7_8 Sg =>    table {SC => "si" ;   SCVow => "s"++BIND ;   SCNeg => "si" ;  SCPart => "si" ;  SCPS => "si" ;  SCVowP => "si" ;  SCBe => "besi" } ;
        Third C7_8 Pl =>    table {SC => "zi" ;   SCVow => "z"++BIND ;   SCNeg => "zi" ;  SCPart => "zi" ;  SCPS => "zi" ;  SCVowP => "zi" ;  SCBe => "bezi" } ;
        Third C9_10 Sg =>   table {SC => "i" ;    SCVow => "y"++BIND ;   SCNeg => "yi" ;  SCPart => "yi" ;  SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" } ;
        Third C9_10 Pl =>   table {SC => "zi" ;   SCVow => "z"++BIND ;   SCNeg => "zi" ;  SCPart => "zi" ;  SCPS => "zi" ;  SCVowP => "zi" ;  SCBe => "bezi" } ;
        Third C11_10 Sg =>  table {SC => "lu" ;   SCVow => "lw"++BIND ;  SCNeg => "lu" ;  SCPart => "lu" ;  SCPS => "lu" ;  SCVowP => "lu" ;  SCBe => "belu" } ;
        Third C11_10 Pl =>  table {SC => "zi" ;   SCVow => "z"++BIND ;   SCNeg => "zi" ;  SCPart => "zi" ;  SCPS => "zi" ;  SCVowP => "zi" ;  SCBe => "bezi" } ;
        Third C9_6 Sg =>    table {SC => "i" ;    SCVow => "y"++BIND ;   SCNeg => "yi" ;  SCPart => "yi" ;  SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" } ;
        Third C9_6 Pl =>    table {SC => "a" ;    SCVow => [] ;          SCNeg => "wa" ;  SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wa" ;  SCBe => "abe" } ;
        Third C14 _ =>      table {SC => "bu" ;   SCVow => "b"++BIND ;   SCNeg => "bu" ;  SCPart => "bu" ;  SCPS => "bu" ;  SCVowP => "bu" ;  SCBe => "bebu" } ;
        Third C15 _ =>      table {SC => "ku" ;   SCVow => "kw"++BIND ;  SCNeg => "ku" ;  SCPart => "ku" ;  SCPS => "ku" ;  SCVowP => "ku" ;  SCBe => "beku" } ;
        Third C17 _ =>      table {SC => "ku" ;   SCVow => "kw"++BIND ;  SCNeg => "ku" ;  SCPart => "ku" ;  SCPS => "ku" ;  SCVowP => "ku" ;  SCBe => "beku" }
      } ;

    -- scvow_bind : Agr -> Str = \agr -> case agr of {
    --   (Third C5_6 Pl|Third C9_6 Pl) => [] ;
    --   _ => subjConcLookup ! agr ! SCVow ++BIND
    -- } ;

    subjConc : VForm -> Agr -> Bool -> Str = \vform,agr,prevow ->
      case prevow of {
        True => subjConcLookup ! agr ! SCVow ;
        False => case vform of {
          VFIndic _ Neg _ => subjConcLookup ! agr ! SCNeg ++BIND ;
          VFIndic _ _ _   => subjConcLookup ! agr ! SC ++BIND
        }
      } ;

    -- -be aux: reference time in relation to coding time
    -- relSubjConc : BasicTense -> Agr -> Str = \tense,agr ->
    -- relSubjConc : BasicTense -> Agr -> Str = \tense,agr ->
    --   case tense of {
    --     PastTense => (subjConcLookup ! agr ! SCVow) ++ "a" ++BIND++ case agr of {
    --       Second Sg | Third C3_4 Sg => "w" ++BIND ;
    --       Third C1_2 Sg | Third C1a_2a Sg | Third C3_4 Pl | Third C5_6 Pl | Third C9_10 Sg => "y" ++BIND ;
    --       First _ | Second _ | Third _ _ => []
    --     } ;
    --     PerfTense | PresTense => subjConcLookup ! agr ! SC ++BIND++ "be" ; -- NOTE: present tense doesn't make much sense here, so default to perf
    --     FutTense => subjConcLookup ! agr ! SC ++BIND++ "zobe"
    --   } ;

    icomp_pref : VForm -> Agr -> Str = \vform,agr ->
    let
      neg1 = icompNeg1 vform ;
      neg2 = icompNeg2 vform ;
    in
    case vform of {
      VFIndic _ Pos PresTense => subjConcLookup ! agr ! SC ++BIND ;
      VFIndic _ Neg PresTense => neg1 ++ subjConcLookup ! agr ! SCNeg ++BIND ++ neg2 ;
      VFIndic _ _ FutTense => "icomp_pref_fut"
    } ;

    -- OBJECT AGREEMENT MORPHEME --

    objConcLookup : Agr => OCForm => Str =
      table {
        First Sg =>         table {OC => "ngi" ;  OCAE => "ng" ;  OCIOU => "ng" ; OCMono => "ngi" ; OCThing => "ngi" } ;
        Second Sg =>        table {OC => "ku" ;   OCAE => "k" ;   OCIOU => "k" ;  OCMono => "ku" ;  OCThing => "ku" } ;
        First Pl =>         table {OC => "si" ;   OCAE => "s" ;   OCIOU => "s" ;  OCMono => "si" ;  OCThing => "si" } ;
        Second Pl =>        table {OC => "ni" ;   OCAE => "n" ;   OCIOU => "n" ;  OCMono => "ni" ;  OCThing => "ni" } ;
        Third C1_2 Sg =>    table {OC => "m" ;    OCAE => "m" ;   OCIOU => "m" ;  OCMono => "mu" ;  OCThing => "wu" } ;
        Third C1_2 Pl =>    table {OC => "ba" ;   OCAE => "b" ;   OCIOU => "b" ;  OCMono => "ba" ;  OCThing => "ba" } ;
        Third C1a_2a Sg =>  table {OC => "m" ;    OCAE => "m" ;   OCIOU => "m" ;  OCMono => "mu" ;  OCThing => "wu" } ;
        Third C1a_2a Pl =>  table {OC => "ba" ;   OCAE => "b" ;   OCIOU => "b" ;  OCMono => "ba" ;  OCThing => "ba" } ;
        Third C3_4 Sg =>    table {OC => "wu" ;   OCAE => "w" ;   OCIOU => "w" ;  OCMono => "wu" ;  OCThing => "wu" } ;
        Third C3_4 Pl =>    table {OC => "yi" ;   OCAE => "y" ;   OCIOU => "y" ;  OCMono => "yi" ;  OCThing => "yi" } ;
        Third C5_6 Sg =>    table {OC => "li" ;   OCAE => "l" ;   OCIOU => "l" ;  OCMono => "li" ;  OCThing => "li" } ;
        Third C5_6 Pl =>    table {OC => "wa" ;   OCAE => "w" ;   OCIOU => "w" ;  OCMono => "wa" ;  OCThing => "wa" } ;
        Third C7_8 Sg =>    table {OC => "si" ;   OCAE => "s" ;   OCIOU => "s" ;  OCMono => "si" ;  OCThing => "si" } ;
        Third C7_8 Pl =>    table {OC => "zi" ;   OCAE => "z" ;   OCIOU => "z" ;  OCMono => "zi" ;  OCThing => "zi" } ;
        Third C9_10 Sg =>   table {OC => "yi" ;   OCAE => "y" ;   OCIOU => "y" ;  OCMono => "yi" ;  OCThing => "yi" } ;
        Third C9_10 Pl =>   table {OC => "zi" ;   OCAE => "z" ;   OCIOU => "z" ;  OCMono => "zi" ;  OCThing => "zi" } ;
        Third C11_10 Sg =>  table {OC => "lu" ;   OCAE => "lw" ;  OCIOU => "l" ;  OCMono => "lu" ;  OCThing => "lu" } ;
        Third C11_10 Pl =>  table {OC => "zi" ;   OCAE => "z" ;   OCIOU => "z" ;  OCMono => "zi" ;  OCThing => "zi" } ;
        Third C9_6 Sg =>    table {OC => "yi" ;   OCAE => "y" ;   OCIOU => "y" ;  OCMono => "yi" ;  OCThing => "yi" } ;
        Third C9_6 Pl =>    table {OC => "wa" ;   OCAE => "w" ;   OCIOU => "w" ;  OCMono => "wa" ;  OCThing => "wa" } ;
        Third C14 _ =>      table {OC => "bu" ;   OCAE => "bw" ;  OCIOU => "b" ;  OCMono => "bu" ;  OCThing => "bu" } ;
        Third C15 _ =>      table {OC => "ku" ;   OCAE => "kw" ;  OCIOU => "k" ;  OCMono => "ku" ;  OCThing => "ku" } ;
        Third C17 _ =>      table {OC => "ku" ;   OCAE => "kw" ;  OCIOU => "k" ;  OCMono => "ku" ;  OCThing => "ku" }
      } ;

    -- ignoring the thing thing for now, must probably add something like gender to nouns...
    objConc : Agr -> RInit -> Syl -> Str = \agr,rinit,syl ->
      case rinit of {
        (RA|RE) => objConcLookup ! agr ! OCAE ++BIND ;
        (RI|RO|RU) => objConcLookup ! agr ! OCIOU ++BIND ;
        RC => case syl of {
          SylMono => objConcLookup ! agr ! OCMono ++BIND ;
          _ => objConcLookup ! agr ! OC ++BIND
        }
      } ;

    -- ADJECTIVE ANTECEDENT AGREEMENT MORPHEME --

    relAdjPrefLookup : Agr => Str = --table {
      -- Pos =>
      table {
        Third C1_2 Sg => "m" ;
        Third C1_2 Pl => "" ;
        Third C1a_2a Sg => "m" ;
        Third C1a_2a Pl => "" ;
        Third C3_4 Sg  => "m" ;
        Third C3_4 Pl => "mi" ;
        Third C5_6 Sg => "" ;
        Third C5_6 Pl => "ma" ;
        Third C7_8 Sg => "" ;
        Third C7_8 Pl => "" ;
        Third C9_10 Sg => "" ;
        Third C9_10 Pl => "" ;
        Third C11_10 Sg => "" ;
        Third C11_10 Pl => "" ;
        Third C9_6 Sg => "" ;
        Third C9_6 Pl => "ma" ;
        Third C14 _ => "bu" ;
        Third C15 _ => "ku" ;
        Third C17 _ => "ku" ;
        (First _ | Second _ )  => "m"
      -- } ;
      -- Neg => table {
      --   Third C1_2 Sg => "ongem" ;
      --   Third C1_2 Pl => "angeba" ;
      --   Third C1a_2a Sg => "ongem" ;
      --   Third C1a_2a Pl => "angeba" ;
      --   Third C3_4 Sg  => "ongem" ;
      --   Third C3_4 Pl => "engemi" ;
      --   Third C5_6 Sg => "engeli" ;
      --   Third C5_6 Pl => "angema" ;
      --   Third C7_8 Sg => "engesi" ;
      --   Third C7_8 Pl => "engezi" ;
      --   Third C9_10 Sg => "enge" ;
      --   Third C9_10 Pl => "engezi" ;
      --   Third C11_10 Sg => "ongelu" ;
      --   Third C11_10 Pl => "engezi" ;
      --   Third C9_6 Sg => "enge" ;
      --   Third C9_6 Pl => "angema" ;
      --   Third C14 _ => "ongebu" ;
      --   Third C15 _ => "ongeku" ;
      --   Third C17 _ => "ongeku" ;
      --   (First _ | Second _ )  => "ongem"
      -- }
    } ;

    -- RELATIVE ANTECEDENT AGREEMENT MORPHEME --

    relConc : Polarity -> Agr -> Str = \p,a -> case p of {
      Pos => relConcLookup!a!RelC ++BIND ;
      Neg => relConcLookup!a!RelC ++BIND++ "nga" ++BIND
    } ;

    relConcCop : Polarity -> Agr -> Str = \p,a -> case p of {
      Pos => relConcLookup!a!RelC ++BIND ;
      Neg => relConcLookup!a!RelC ++BIND++ "nge" ++BIND
    } ;

    relConcLookup : Agr => RCForm => Str =
      table {
        Third C1_2 Sg => table { RelC => "o" ; RelCA => "ow" } ;
        Third C1_2 Pl => table { _ => "aba" } ;
        Third C1a_2a Sg => table { RelC => "o" ; RelCA => "ow" } ;
        Third C1a_2a Pl => table { _ => "aba" } ;
        Third C3_4 Sg  => table { RelC => "o" ; RelCA => "ow" } ;
        Third C3_4 Pl => table { RelC => "e" ; RelCA => "ey" } ;
        Third C5_6 Sg => table { RelC => "eli" ; RelCA => "el" } ;
        Third C5_6 Pl => table { _ => "a" } ;
        Third C7_8 Sg => table { RelC => "esi" ; RelCA => "es" } ;
        Third C7_8 Pl => table { RelC => "ezi" ; RelCA => "ez" } ;
        Third C9_10 Sg => table { RelC => "e" ; RelCA => "ey" } ;
        Third C9_10 Pl => table { RelC => "ezi" ; RelCA => "ez" } ;
        Third C11_10 Sg => table { RelC => "olu" ; RelCA => "olw" } ;
        Third C11_10 Pl => table { RelC => "ezi" ; RelCA => "ez" } ;
        Third C9_6 Sg => table { RelC => "e" ; RelCA => "ey" } ;
        Third C9_6 Pl => table { _ => "a" } ;
        Third C14 _ => table { RelC => "obu" ; RelCA => "ob" } ;
        Third C15 _ => table { RelC => "oku" ; RelCA => "okw" } ;
        Third C17 _ => table { RelC => "oku" ; RelCA => "okw" } ;
        First Sg => table { RelC => "engi" ; RelCA => "eng" } ;
        First Pl => table { RelC =>  "esi" ; RelCA => "es" } ;
        Second Sg  => table { RelC => "o" ; RelCA => "ow" } ;
        Second Pl => table { RelC => "eni" ; RelCA => "en" }
    } ;

    -- ENUMERATIVE ANTECEDENT AGREEMENT MORPHEME --

    enumConc : Polarity -> Agr -> Str = \pol,agr -> case pol of {
      Pos => enumConcLookup!agr ;
      Neg => "nge" ++BIND++ enumConcLookup!agr
    } ;

    enumConcLookup : Agr => Str =
      table {
        Third C1_2 Sg => "mu" ;
        Third C1_2 Pl => "ba" ;
        Third C1a_2a Sg => "mu" ;
        Third C1a_2a Pl => "ba" ;
        Third C3_4 Sg  => "mu" ;
        Third C3_4 Pl => "mi" ;
        Third C5_6 Sg => "li" ;
        Third C5_6 Pl => "ma" ;
        Third C7_8 Sg => "si" ;
        Third C7_8 Pl => "zi" ;
        Third C9_10 Sg => "yi" ;
        Third C9_10 Pl => "zi" ;
        Third C11_10 Sg => "lu" ;
        Third C11_10 Pl => "zi" ;
        Third C9_6 Sg => "yi" ;
        Third C9_6 Pl => "ma" ;
        Third C14 _ => "bu" ;
        Third C15 _ => "ku" ;
        Third C17 _ => "ku" ;
        (First _ | Second _ )  => "mu"
      } ;

    shortRelConc : Agr => Str =
      table {
        Third C1_2 Sg => "o" ;
        Third C1_2 Pl => "a" ;
        Third C1a_2a Sg => "o" ;
        Third C1a_2a Pl => "a" ;
        Third C3_4 Sg  => "o" ;
        Third C3_4 Pl => "e" ;
        Third C5_6 Sg => "e" ;
        Third C5_6 Pl => "a" ;
        Third C7_8 Sg => "e" ;
        Third C7_8 Pl => "e" ;
        Third C9_10 Sg => "e" ;
        Third C9_10 Pl => "e" ;
        Third C11_10 Sg => "o" ;
        Third C11_10 Pl => "e" ;
        Third C9_6 Sg => "e" ;
        Third C9_6 Pl => "a" ;
        Third C14 _ => "o" ;
        Third C15 _ => "o" ;
        Third C17 _ => "o" ;
        First Sg => "e" ;
        First Pl => "e" ;
        Second Sg  => "o" ;
        Second Pl => "e"
      } ;

    -- POSSESSIVE ANTECEDENT AGREEMENT MORPHEME --

    poss_concord_agr : Agr => RInit => Str =
      table {
        First Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
        First Pl => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" } ;
        Second Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
        Second Pl => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" } ;
        Third C1_2 Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
        Third C1_2 Pl => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" } ;
        Third C1a_2a Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
        Third C1a_2a Pl => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" } ;
        Third C3_4 Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
        Third C3_4 Pl => table {(RA|RC) => "ya" ; (RE|RI) => "ye" ; (RO|RU) => "yo" } ;
        Third C5_6 Sg => table {(RA|RC) => "la" ; (RE|RI) => "le" ; (RO|RU) => "lo" } ;
        Third C5_6 Pl => table {(RA|RC) => "a" ; (RE|RI) => "e" ; (RO|RU) => "o" } ;
        Third C7_8 Sg => table {(RA|RC) => "sa" ; (RE|RI) => "se" ; (RO|RU) => "so" } ;
        Third C7_8 Pl => table {(RA|RC) => "za" ; (RE|RI) => "ze" ; (RO|RU) => "zo" } ;
        Third C9_10 Sg => table {(RA|RC) => "ya" ; (RE|RI) => "ye" ; (RO|RU) => "yo" } ;
        Third C9_10 Pl => table {(RA|RC) => "za" ; (RE|RI) => "ze" ; (RO|RU) => "zo" } ;
        Third C11_10 Sg => table {(RA|RC) => "lwa" ; (RE|RI) => "lwe" ; (RO|RU) => "lo" } ;
        Third C11_10 Pl => table {(RA|RC) => "za" ; (RE|RI) => "ze" ; (RO|RU) => "zo" } ;
        Third C9_6 Sg => table {(RA|RC) => "ya" ; (RE|RI) => "ye" ; (RO|RU) => "yo" } ;
        Third C9_6 Pl => table {(RA|RC) => "a" ; (RE|RI) => "e" ; (RO|RU) => "o" } ;
        Third C14 _ => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" } ;
        Third C15 _ => table {(RA|RC) => "kwa" ; (RE|RI) => "kwe" ; (RO|RU) => "ko" } ;
        Third C17 _ => table {(RA|RC) => "kwa" ; (RE|RI) => "kwe" ; (RO|RU) => "ko" }
      } ;

    poss_concord : ClassGender => Number => RInit => Str =
      table {
        C1_2 => table {
          Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
          Pl => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" }
        } ;
        C1a_2a => table {
          Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
          Pl => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" }
        } ;
        C3_4 => table {
          Sg => table {(RA|RC) => "wa" ; (RE|RI) => "we" ; (RO|RU) => "wo" } ;
          Pl => table {(RA|RC) => "ya" ; (RE|RI) => "ye" ; (RO|RU) => "yo" }
        } ;
        C5_6 => table {
          Sg => table {(RA|RC) => "la" ; (RE|RI) => "le" ; (RO|RU) => "lo" } ;
          Pl => table {(RA|RC) => "a" ; (RE|RI) => "e" ; (RO|RU) => "o" }
        } ;
        C7_8 => table {
          Sg => table {(RA|RC) => "sa" ; (RE|RI) => "se" ; (RO|RU) => "so" } ;
          Pl => table {(RA|RC) => "za" ; (RE|RI) => "ze" ; (RO|RU) => "zo" }
        } ;
        C9_10 => table {
          Sg => table {(RA|RC) => "ya" ; (RE|RI) => "ye" ; (RO|RU) => "yo" } ;
          Pl => table {(RA|RC) => "za" ; (RE|RI) => "ze" ; (RO|RU) => "zo" }
        } ;
        C11_10 => table {
          Sg => table {(RA|RC) => "lwa" ; (RE|RI) => "lwe" ; (RO|RU) => "lo" } ;
          Pl => table {(RA|RC) => "za" ; (RE|RI) => "ze" ; (RO|RU) => "zo" }
        } ;
        C9_6 => table {
          Sg => table {(RA|RC) => "ya" ; (RE|RI) => "ye" ; (RO|RU) => "yo" } ;
          Pl => table {(RA|RC) => "a" ; (RE|RI) => "e" ; (RO|RU) => "o" }
        } ;
        C14 => table {
          _ => table {(RA|RC) => "ba" ; (RE|RI) => "be" ; (RO|RU) => "bo" }
        } ;
        C15 => table {
          _ => table {(RA|RC) => "kwa" ; (RE|RI) => "kwe" ; (RO|RU) => "ko" }
        } ;
        C17 => table {
          _ => table {(RA|RC) => "kwa" ; (RE|RI) => "kwe" ; (RO|RU) => "ko" }
        }
      } ;

    poss_concord_c1a : ClassGender => Number => RInit => Str =
      table {
        C1_2 => table {
          Sg => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" } ;
          Pl => table {(RA|RC) => "baka" ; (RE|RI) => "bake" ; (RO|RU) => "bako" }
        } ;
        C1a_2a => table {
          Sg => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" } ;
          Pl => table {(RA|RC) => "baka" ; (RE|RI) => "bake" ; (RO|RU) => "bako" }
        } ;
        C3_4 => table {
          Sg => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" } ;
          Pl => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" }
        } ;
        C5_6 => table {
          Sg => table {(RA|RC) => "lika" ; (RE|RI) => "like" ; (RO|RU) => "liko" } ;
          Pl => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" }
        } ;
        C7_8 => table {
          Sg => table {(RA|RC) => "sika" ; (RE|RI) => "sike" ; (RO|RU) => "siko" } ;
          Pl => table {(RA|RC) => "zika" ; (RE|RI) => "zike" ; (RO|RU) => "ziko" }
        } ;
        C9_10 => table {
          Sg => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" } ;
          Pl => table {(RA|RC) => "zika" ; (RE|RI) => "zike" ; (RO|RU) => "ziko" }
        } ;
        C11_10 => table {
          Sg => table {(RA|RC) => "luka" ; (RE|RI) => "luke" ; (RO|RU) => "luko" } ;
          Pl => table {(RA|RC) => "zika" ; (RE|RI) => "zike" ; (RO|RU) => "ziko" }
        } ;
        C9_6 => table {
          Sg => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" } ;
          Pl => table {(RA|RC) => "ka" ; (RE|RI) => "ke" ; (RO|RU) => "ko" }
        } ;
        C14 => table {
          _ => table {(RA|RC) => "buka" ; (RE|RI) => "buke" ; (RO|RU) => "buko" }
        } ;
        C15 => table {
          _ => table {(RA|RC) => "kuka" ; (RE|RI) => "kuke" ; (RO|RU) => "kuko" }
        } ;
        C17 => table {
          _ => table {(RA|RC) => "kuka" ; (RE|RI) => "kuke" ; (RO|RU) => "kuko" }
        }
      } ;

    -- QUANTITATIVE AGREEMENT MORPHEME --
    -- (demonstatives)

    quantConc : Agr => Str = table {
      Third C1_2 Sg => "ye" ;
      Third C1_2 Pl => "bo" ;
      Third C1a_2a Sg => "ye" ;
      Third C1a_2a Pl => "bo" ;
      Third C3_4 Sg  => "wo" ;
      Third C3_4 Pl => "yo" ;
      Third C5_6 Sg => "lo" ;
      Third C5_6 Pl => "o" ;
      Third C7_8 Sg => "so" ;
      Third C7_8 Pl => "zo" ;
      Third C9_10 Sg => "yo" ;
      Third C9_10 Pl => "zo" ;
      Third C11_10 Sg => "lo" ;
      Third C11_10 Pl => "zo" ;
      Third C9_6 Sg => "yo" ;
      Third C9_6 Pl => "o" ;
      Third C14 _ => "bo" ;
      Third C15 _ => "ko" ;
      Third C17 _ => "ko" ;
      First Sg => "nge" ;
      First Pl => "so" ;
      Second Sg  => "we" ;
      Second Pl => "no"
    } ;

    -----------------
    -- COPULATIVES --
    -----------------

    pre_cop_pref : VForm -> Agr -> Str = \vform,agr ->
    let
      sc = subjConc vform agr False ;
      scvow = subjConc vform agr True
    in
      case vform of {
        VFIndic _ Pos PresTense => sc ;
        VFIndic _ Neg PresTense => "a" ++BIND++ subjConcLookup!agr!SCNeg ++BIND ;
        VFIndic _ _ FutTense => sc ++ (tensePref vform) ++ "ba"
        -- VFIndic _ Neg PresTense => case agr of {
        --   (First _ | Second _ ) => "ka" ++BIND++ sc ;
        --   Third _ _ => "akusi" ++BIND
        -- }
    } ;

    ap_cop_pref : VForm -> Agr -> Str = \vform,agr ->
    let
      sc = subjConc vform agr False ;
      scvow = subjConc vform agr True
    in
      case vform of {
        VFIndic MainCl Pos PresTense => sc ++BIND ;
        VFIndic MainCl Neg PresTense => "a" ++BIND++ subjConcLookup!agr!SCNeg ++BIND ;
        VFIndic RelCl _ PresTense => [] ;

        VFIndic MainCl _ FutTense => sc ++ (tensePref vform) ++ "ba" ++BIND ;
        VFIndic RelCl _ FutTense => (tensePref vform) ++ "ba" ++BIND
        -- VFIndic _ Neg PresTense => case agr of {
        --   (First _ | Second _ ) => "ka" ++BIND++ sc ;
        --   Third _ _ => "akusi" ++BIND
        -- }
    } ;

      -- REF: Poulos & Msimang p355
      -- id_cop_pref has the following forms
      -- ngu:
      --     - absolute pronoun of 2nd person sg
      --     - class 1
      --     - all other a-, o-, u- commencing absolute pronouns and nouns except class 11
      --
      -- y:
      --     - i- commencing absolute pronouns and nouns
      --
      -- ngu:
      --     - everything else?

      id_pre_cop_pref : VForm -> Agr -> Str = \vform,agr -> let
        sc = subjConc vform agr False
      in case vform of {
        VFIndic MainCl Pos PresTense => sc ;
        VFIndic MainCl Neg PresTense => "aku" ++BIND ;
        VFIndic RelCl _ PresTense => [] ;

        VFIndic MainCl Pos FutTense => sc ++ "zoba" ;
        VFIndic MainCl Neg FutTense => sc ++ "zoba_neg" ;
        VFIndic RelCl Pos FutTense => "zoba" ;
        VFIndic RelCl Neg FutTense => "zoba_neg"
      } ;

      assoc_pre_cop_pref : VForm -> Agr -> Str = \vform,agr -> let
        sc = subjConc vform agr False
      in case vform of {
        VFIndic MainCl Pos PresTense => sc ;
        VFIndic MainCl Neg PresTense => "a" ++BIND++ subjConcLookup!agr!SCNeg ++BIND ;
        VFIndic RelCl _ PresTense => [] ;

        VFIndic MainCl Pos FutTense => sc ++ "zoba" ;
        VFIndic MainCl Neg FutTense => sc ++ "zoba_neg" ;
        VFIndic RelCl Pos FutTense => "zoba" ;
        VFIndic RelCl Neg FutTense => "zoba_neg"
      } ;

      id_cop_pref : Agr -> Str = \agr -> case agr of {
        Third C1_2 Sg => "ng"++BIND ;
        Third C1_2 Pl => "ng"++BIND ;
        Third C1a_2a Sg => "ng"++BIND ;
        Third C1a_2a Pl => "ng"++BIND ;
        Third C3_4 Sg  => "ng"++BIND ;
        Third C3_4 Pl => "y"++BIND ;
        Third C5_6 Sg => "y"++BIND ;
        Third C5_6 Pl => "ng"++BIND ;
        Third C7_8 Sg => "y"++BIND ;
        Third C7_8 Pl => "y"++BIND ;
        Third C9_10 Sg => "y"++BIND ;
        Third C9_10 Pl => "y"++BIND ;
        Third C11_10 Sg => "w"++BIND ;
        Third C11_10 Pl => "y"++BIND ;
        Third C9_6 Sg => "y"++BIND ;
        Third C9_6 Pl => "ng"++BIND ;
        Third C14 _ => "ng"++BIND ;
        Third C15 _ => "ng"++BIND ;
        Third C17 _ => "ng"++BIND ;
        First Sg => "y"++BIND ;
        First Pl => "y"++BIND ;
        Second Sg  => "ng"++BIND ;
        Second Pl => "y"++BIND
      } ;

      assoc_cop_pref : Polarity -> Agr -> Str = \pol,agr -> case pol of {
        Neg => "na"++BIND ;
        Pos => case agr of {
          Third C1_2 Sg => "no" ;
          Third C1_2 Pl => "na" ;
          Third C1a_2a Sg => "no" ;
          Third C1a_2a Pl => "na" ;
          Third C3_4 Sg  => "no" ;
          Third C3_4 Pl => "ne" ;
          Third C5_6 Sg => "ne" ;
          Third C5_6 Pl => "na" ;
          Third C7_8 Sg => "ne" ;
          Third C7_8 Pl => "ne" ;
          Third C9_10 Sg => "ne" ;
          Third C9_10 Pl => "ne" ;
          Third C11_10 Sg => "no" ;
          Third C11_10 Pl => "ne" ;
          Third C9_6 Sg => "ne" ;
          Third C9_6 Pl => "na" ;
          Third C14 _ => "no" ;
          Third C15 _ => "no" ;
          Third C17 _ => "no" ;
          First Sg => "na" ;
          First Pl => "na" ;
          Second Sg  => "na" ;
          Second Pl => "na"
        } ++BIND
      } ;

    ----------------------------------------
    -- OTHER
    ----------------------------------------

    link_conj : Str -> Str -> Str -> Bool -> Str = \conj,s_full,s_novow,fix -> case fix of {
      True => conj ++BIND ++ s_novow ;
      False => conj ++ s_full
    } ;
}

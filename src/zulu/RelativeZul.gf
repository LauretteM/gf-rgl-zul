concrete RelativeZul of Relative = CatZul ** open ResZul,Prelude,ParamX in {

  flags optimize=all_subs ;

  lin

--     RelCl cl = {
--       s = \\t,a,p,_ => "such" ++ "that" ++ cl.s ! t ! a ! p ! oDir ;
--       c = npNom
--       } ;

    RelVP rp vp = case vp.vptype of {
      CopIdent => rcl_with_id_cop_predicate rp vp ;
      CopAssoc => rcl_with_ass_cop_predicate rp vp ;
      CopEq => rcl_with_eq_cop_predicate rp vp ;
      CopDescr => rcl_with_descr_predicate rp vp ;
      _ => rcl_with_verb_predicate rp vp
    } ;

-- -- Pied piping: "that we are looking at". Pied piping and empty
-- -- relative are defined in $ExtraZul.gf$ ("at which we are looking",
-- -- "we are looking at").
--
--     RelSlash rp slash = {
--       s = \\t,a,p,ag =>
--         rp.s ! RC (fromAgr ag).g NPAcc ++ slash.s ! t ! a ! p ! oDir ++ slash.c2 ;
--       c = NPAcc
--       } ;
--
--     FunRP p np rp = {
--       s = \\c => np.s ! NPAcc ++ p.s ++ rp.s ! RPrep (fromAgr np.a).g ;
--       a = RAg np.a
--       } ;

    IdRP = { s = [] } ;

    oper
      rcl_with_verb_predicate : RP -> VP -> { s : Polarity => ZTense => Agr => Str } = \rp,vp -> {
        s = \\p,t,a =>
          let
            aux_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b1
            } ;
            main_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b2
            } ;
            vform_aux = VFIndic Part p aux_tense vp.asp ;
            vform_main = VFIndic Part p main_tense vp.asp ;
            aux = case t of {
              Absolute _ => [] ;
              Relative _ _ => (subjConcLookup!a!ResZul.SC) ++BIND++ "k" ++BIND++ (vtermSuff vform_aux False "e" "a")
            } ;
            vow = case <vp.r,p,main_tense> of {
              <RC,Pos,PresTense> => False ;
              <RC,Pos,PerfTense> => False ;
              <_,Pos,PresTense> => True ;
              <_,Pos,PerfTense> => True ;
              <_,_,_> => False
            } ;
            reqLF = case vp.hasComp of {
              True => False ;
              False => True
            } ;
            -- reqRelLF = case main_tense of {
            --   PerfResZul.Tense => False ;
            --   _ => True
            -- } ;
            relsuf = case vp.hasComp of {
              True => [] ;
              False => relSuf vform_main
            } ;
            rcform = case vform_main of {
              VFIndic Part Pos PastTense _ => RelCA ;
              VFIndic _ _ _ _ => RelC ;
              VFPot _ _ _ => RelC ;
              VFSubj _ => RelC
            } ;
          in
            -- naively only took out the subject
            rp.s
            ++ aux
            ++ (negPref vform_main a)
            ++ (exclSePref vform_main)
            ++ relConc!a!rcform ++BIND
            ++ (negPref2 vform_main)
            ++ vp.asp_pref!vform_main
            -- ++ (exclKaPref vform)
            ++ (tensePref vform_main)
            ++ vp.oc
            -- ++ vp.s ++ BIND
            -- ++ (vtermSuff vform_main reqLF vp.perfSuff vp.suff)
            ++ vp.s!(rform vform_main reqLF)
            ++ relsuf
            ++ vp.iadv
            ++ vp.comp!p
            ++ vp.advs
      } ;

      rcl_with_id_cop_predicate : RP -> VP -> { s : Polarity => ZTense => Agr => Str } = \rp,vp -> {
        s = \\p,t,a =>
          let
            aux_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b1
            } ;
            main_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b2
            } ;
            vform_aux = VFIndic Part p aux_tense vp.asp ;
            vform_main = VFIndic Part p main_tense vp.asp ;
            aux = case t of {
              Absolute _ => [] ;
              Relative _ _ => (subjConcLookup!a!ResZul.SC) ++BIND++ "b" ++BIND++ (vtermSuff vform_aux False "e" "a")
            } ;
            pcp = relConc!a!RelC ++BIND ;
            cp = id_cop_pref vp.comp_agr ;
            cb = vp.comp!p ;
            -- asp = case vp.asp of {
            --   Prog => progPref vform_main ;
            --   _ => []
            -- } ;
          in
            -- naively removed subject
            rp.s ++
            aux ++
            pcp ++
            cp ++ BIND ++
            vp.asp_pref!vform_main ++
            cb ++
            vp.iadv ++
            vp.advs
      } ;

      rcl_with_ass_cop_predicate : RP -> VP -> { s : Polarity => ZTense => Agr => Str } = \rp,vp -> {
        s = \\p,t,a =>
          let
            aux_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b1
            } ;
            main_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b2
            } ;
            vform_aux = VFIndic Part p aux_tense vp.asp ;
            vform_main = VFIndic Part p main_tense vp.asp ;
            aux = case t of {
              Absolute _ => [] ;
              Relative _ _ => (subjConcLookup!a!ResZul.SC) ++BIND++ "b" ++BIND++ (vtermSuff vform_aux False "e" "a")
            } ;
            pcp = relConc!a!RelC ++BIND;
            cp = (assoc_cop_pref vp.comp_agr)!p ;
            cb = (withPref ! vp.r) ++ BIND ++ vp.comp!p ;
            -- asp = case vp.asp of {
            --   Prog => progPref vform_main ;
            --   _ => []
            -- } ;
          in
            -- naively removed subject
            rp.s ++
            aux ++
            pcp ++
            vp.asp_pref!vform_main ++
            cb ++
            vp.iadv ++
            vp.advs
      } ;

      rcl_with_eq_cop_predicate : RP -> VP -> { s : Polarity => ZTense => Agr => Str } = \rp,vp -> {
        s = \\p,t,a =>
          let
            aux_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b1
            } ;
            main_tense = case t of {
              Absolute bt => bt ;
              Relative b1 b2 => b2
            } ;
            vform_aux = VFIndic Part p aux_tense vp.asp ;
            vform_main = VFIndic Part p main_tense vp.asp ;
            aux = case t of {
              Absolute _ => [] ;
              Relative _ _ => (subjConcLookup!a!ResZul.SC) ++BIND++ "b" ++BIND++ (vtermSuff vform_aux False "e" "a")
            } ;
            pcp = relConc!a!RelC ++BIND;
            -- cp = cop_pref vp.comp_agr ;
            cb = (eqPref ! vp.r) ++ BIND ++ vp.comp!p ;
            -- asp = case vp.asp of {
            --   Prog => progPref vform_main ;
            --   _ => []
            -- } ;
          in
            -- naively removed subject
            rp.s ++
            aux ++
            pcp ++
            vp.asp_pref!vform_main ++
            cb ++
            vp.iadv ++
            vp.advs
      } ;

      rcl_with_descr_predicate : RP -> VP -> { s : Polarity => ZTense => Agr => Str } = \rp,vp -> {
      s = \\p,t,a =>
        let
          aux_tense = case t of {
            Absolute bt => bt ;
            Relative b1 b2 => b1
          } ;
          main_tense = case t of {
            Absolute bt => bt ;
            Relative b1 b2 => b2
          } ;
          vform_aux = VFIndic Part p aux_tense vp.asp ;
          vform_main = case t of {
            Absolute bt => VFIndic Part p bt vp.asp ;
            Relative b1 b2 => VFIndic Part p b2 vp.asp
          } ;
          aux = case t of {
            Absolute bt => case vp.hasAux of {
              True => (subjConcLookup!a!SC) ++BIND++ vp.aux_root ;
              False => aux_be vform_aux a
            } ;
            Relative _ _ => case vp.hasAux of {
              True => (subjConcLookup!a!SC) ++BIND++ vp.aux_root ;
              False => aux_be vform_aux a -- relSubjConc aux_tense np.agr --
            }
          } ;
          pcp = pre_cop_pref vform_main a ;
          adjf = aformN a ;
          adjpref =  adjPrefLookup!a ++BIND ;
          -- asp = case vp.asp of {
          --   Prog => "se" ++BIND ; -- p339
          --   _ => []
          -- } ;
          comp = vp.ap_comp!adjf ++ vp.comp!p
        in
          aux ++
          pcp ++
          adjpref ++
          vp.asp_pref!vform_main ++
          comp
          ++ vp.iadv ++ vp.advs
        } ;

}

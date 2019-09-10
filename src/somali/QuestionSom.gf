concrete QuestionSom of Question = CatSom ** open
  Prelude, ResSom, (VS=VerbSom), (NS=NounSom), (AS=AdverbSom) in {

-- A question can be formed from a clause ('yes-no question') or
-- with an interrogative.

  lin
  -- : Cl -> QCl ;
  QuestCl = cl2qcl ;

  -- : IP -> VP -> QCl ;
  QuestVP ip vp = -- TODO: if we want to contract baa + subj. pronoun, change ResSom.predVP
    let clRaw : ClSlash = predVP ip vp ;
        cl : ClSlash = clRaw ** {
                stm = \\clt,p => case <clt,p> of {
                                    <_,Pos> => "baa" ;
                                    _ => clRaw.stm ! clt ! p }
                }
     in cl2qcl cl ;

  -- : IP -> ClSlash -> QCl ; -- whom does John love
  --QuestSlash ip cls = ;

  -- : IAdv -> Cl -> QCl ;    -- why does John walk
  QuestIAdv iadv cls =
    let clRaw : ClSlash = insertIAdv iadv cls ;
        sbj = clRaw.subj ;
        cl : ClSlash = clRaw ** {
            stm = \\clt,p => case <clt,p> of {
                                -- IAdv is focused with baa, and subject comes after
                                <_,Pos> => "baa" ++ sbj.pron ++ sbj.noun;
                                -- TODO how do negative questions work
                                _ => clRaw.stm ! Question ! p ++ sbj.pron ++ sbj.noun } ;
            subj = sbj ** {noun, pron = []}  -- to force subject after baa
        } ;
     in cl2qcl cl ;

  -- : IComp -> NP -> QCl ;   -- where is John?
  -- QuestIComp icomp np = ;

-- Interrogative pronouns can be formed with interrogative
-- determiners, with or without a noun.

  -- : IDet -> CN -> IP ;       -- which five songs
  IdetCN = NS.DetCN ;

  -- : IDet       -> IP ;       -- which five
  IdetIP = NS.DetNP ;

-- They can be modified with adverbs.
  -- : IP -> Adv -> IP ;        -- who in Paris
  --AdvIP = NS.AdvNP ;

-- Interrogative quantifiers have number forms and can take number modifiers.

  -- : IQuant -> Num -> IDet ;  -- which (five)
  IdetQuant = NS.DetQuant ;

-- Interrogative adverbs can be formed prepositionally.
  -- : Prep -> IP -> IAdv ;     -- with whom
  PrepIP = AS.PrepNP ;

-- They can be modified with other adverbs.

  -- : IAdv -> Adv -> IAdv ;    -- where in Paris
  --  AdvIAdv iadv adv = iadv ** {s = iadv.s ++ adv.berri} ; -- TODO do we need PrepCombination in IAdv?

-- Interrogative complements to copulas can be both adverbs and
-- pronouns.

  -- : IAdv -> IComp ;
  --CompIAdv iadv = iadv ;          -- where (is it)

  -- : IP -> IComp ;
  --CompIP ip = { s = ip.s ! Abs } ;  -- who (is it)

{-
-- More $IP$, $IDet$, and $IAdv$ are defined in $Structural$.

-- Wh questions with two or more question words require a new, special category.

  cat
    QVP ;          -- buy what where
  fun
    ComplSlashIP  : VPSlash -> IP -> QVP ;   -- buys what
    AdvQVP        : VP  ->   IAdv -> QVP ;   -- lives where
    AddAdvQVP     : QVP ->   IAdv -> QVP ;   -- buys what where

    QuestQVP      : IP -> QVP -> QCl ;       -- who buys what where
-}

}

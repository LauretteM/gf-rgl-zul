abstract ExtraZulAbs =
  Grammar[NP,VP,CN,V,Temp,Pol,S,Cl,Adv,Pron,QCl,QS,A,RS] ** {

  fun
    PotQS : Pol -> QCl -> QS ;

    AssocCop : NP -> VP ;
    EqCop : NP -> VP ;

    DescrNP : CN -> NP -> CN ;
    PossLocNP : CN -> NP -> CN ;
    PossPronZul : CN -> Pron -> CN ; -- of you (yours)
    -- RelV : CN -> V -> Temp -> Pol -> CN ; -- lights that flash

    InstrNPAdv : NP -> Adv ; -- ngokuhlinzwa
    InstrAdvNPAdv : Adv -> NP -> Adv ; -- cishe ngehora
    LocNPAdv : NP -> Adv ;   -- emahoreni
    LocAdvNPAdv : Adv -> NP -> Adv ;   -- cishe emahoreni
    KwaNPAdv : Adv -> NP -> Adv ; -- ngaphezu kwamahora amabili adlule
    KuNPAdv : NP -> Adv ; -- kwixesha [elingangeyure enye egqithileyo]
    KuAdvNPAdv : Adv -> NP -> Adv ; -- ngaphezu kwamahora amabili adlule
    NaNPAdv : NP -> Adv ;

    -- InstrAdvNP   : NP -> NP -> NP ; -- questions about your pregnancy

    RelAdv : Adv -> RS ;

    ProgVP : VP -> VP ;

    QuantRS : QuantStem -> RS ; -- elilodwa
    RelRS : RelStem -> RS ; -- elibuhlungu

    QuantCN : QuantStem -> CN -> NP ;

    NumAdjCN : A -> CN -> CN ;

    only_QuantStem : QuantStem ;
    all_QuantStem : QuantStem ;
    painful_RelStem : RelStem ;
    sharp_RelStem : RelStem ;

    TPerfPast : Temp ;
    TPastPast : Temp ;
    TPresPres : Temp ;
    TPastPres : Temp ;
    TPastPerf : Temp ;
    TPerfPerf : Temp ;

    PredNP : NP -> Cl ;
    IAdvQCl : NP -> IAdv -> QCl ; -- (the pregnancy) (in which year)


    ComplVAux : VAux -> VP -> VP ;

    ConjAdv : ConjN -> S -> Adv ; -- lapho kunobuhlungu khona

    where_ConjN : ConjN ;

    it3_Pron : Pron ;
    they4_Pron : Pron ;
    it5_Pron : Pron ;
    they6_Pron : Pron ;
    it7_Pron : Pron ;
    they8_Pron : Pron ;
    it9_Pron : Pron ;
    they10_Pron : Pron ;
    it11_Pron : Pron ;
    it14_Pron : Pron ;
    it15_Pron : Pron ;
    it17_Pron : Pron ;

    all_Det : Det ;

    at_which_IAdv : NP -> IAdv ;

    about_NP_Adv : NP -> Adv ;

    how_many_IAdj : IAdj ;

    IAdjIAdv : NP -> IAdj -> IAdv ;

}

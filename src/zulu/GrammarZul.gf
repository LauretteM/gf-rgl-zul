--# -path=.:../abstract:../common:prelude

concrete GrammarZul of Grammar =
  NounZul,
  VerbZul,
  AdjectiveZul,
  AdverbZul,
  NumeralZul,
  SentenceZul,
  QuestionZul,
  RelativeZul,
  ConjunctionZul,
  PhraseZul,
  TextX - [Temp,Adv],
  StructuralZul,
  IdiomZul,
  TenseX - [Temp,Adv]
  ** open ResZul, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;

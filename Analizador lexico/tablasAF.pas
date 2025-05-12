
Unit tablasAF;

Interface

Type 
  Sigma = (Letra, Digito, Guion, Otro);
  Q = 0..3;
  TipoDelta = Array[Q,Sigma] Of Q;

Procedure AFIdentificador(Var delta: TipoDelta);

Implementation

Procedure AFIdentificador(Var delta: TipoDelta);
Begin
  Delta[0,Letra] := 1;
  Delta[0,Digito] := 3;
  Delta[0,Guion] := 3;
  Delta[0,Otro] := 3;
  Delta[1,Letra] := 1;
  Delta[1,Digito] := 1;
  Delta[1,Guion] := 1;
  Delta[1,Otro] := 2;
End;
End.

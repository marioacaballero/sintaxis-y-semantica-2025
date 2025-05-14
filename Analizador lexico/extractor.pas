
Unit extractor;

Interface

Uses 
validadores, auxiliares;

Procedure ObtenerSiguienteCompLex(Var Fuente:FileOfChar;Var Control:Longint; Var
                                  CompLex:TipoSimboloGramatical;Var Lexema:
                                  String;Var TS:
                                  TablaDeSimbolos);

Implementation

Procedure ObtenerSiguienteCompLex(Var Fuente:FileOfChar;Var Control:Longint; Var
                                  CompLex:TipoSimboloGramatical;Var Lexema:
                                  String;Var TS:
                                  TablaDeSimbolos);

Var 
  car: char;
  controlAux: LongInt;
Begin
  Lexema := '';
  car := #0;
  LeerCar(fuente, control, car);
  While car In [#1..#32] Do
    Begin
      control := control + 1;
      LeerCar(Fuente, control, car);
    End;
  controlAux := control;
  If EsIdentificador(Fuente,Control,Lexema) Then
    Begin
      InstalarEnTS(Lexema,TS,CompLex);
    End
  Else If EsConstanteCadena(Fuente,Control,Lexema) Then
         CompLex := Tccadena
  Else If EsConstanteReal(Fuente,Control,Lexema) Then
         CompLex := Tcreal
  Else If EsConstanteEntera(Fuente,Control,Lexema) Then
         Begin
           CompLex := Tcentera;
         End
  Else If EsSimboloEspecial(Fuente,Control) Then
         SimboloEspecial(Fuente, control, Lexema, CompLex)
  Else
    Begin
      Lexema := car;
      CompLex := ErrorGramatical;
    End;
  If controlAux = Control Then
    Control := control + 1;
  If car = FinArch Then
    WriteLn(Pesos, ' $')
  Else
    WriteLn(CompLex, ' | ', Lexema);
End;

End.

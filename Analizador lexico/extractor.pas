
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
Begin
  LeerCar(fuente, control, car);
  While car <= #32 Do
    Begin
      control := control + 1;
      LeerCar(Fuente, control, car);
    End;
  If EsIdentificador(Fuente,Control,Lexema) Then
    Begin
      // WriteLn('contrl ', Control);
      InstalarEnTS(Lexema,TS,CompLex);
    End;
  // Else If EsConstanteReal(Fuente,Control,Lexema) Then
  //        CompLex := Tcreal
  // Else If EsConstanteCadena(Fuente,Control,Lexema) Then
  //        CompLex := Tccadena
  // Else If EsConstanteCadena(Fuente,Control,Lexema) Then
  //        CompLex := Tccadena
  // Else If Not EsSimboloEspecial(Fuente,Control,Lexema,CompLex) Then
  //        CompLex := ErrorGramatical
  // Else
  //   Begin
  //     CompLex := ErrorGramatical;
  //   End;
  WriteLn(CompLex, Lexema);
End;

End.

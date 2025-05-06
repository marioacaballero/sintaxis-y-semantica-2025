
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

Begin
  If EsIdentificador(Fuente,Control,Lexema) Then
    InstalarEnTS(Lexema,TS,CompLex)
    // Else If EsConstanteReal(Fuente,Control,Lexema) Then
    //        CompLex := Tcreal
    // Else If EsConstanteCadena(Fuente,Control,Lexema) Then
    //        CompLex := Tccadena
    // Else If EsConstanteCadena(Fuente,Control,Lexema) Then
    //        CompLex := Tccadena
    // Else If Not EsSimboloEspecial(Fuente,Control,Lexema,CompLex) Then
    //        CompLex := ErrorGramatical
End;

End.

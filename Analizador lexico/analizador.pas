
Program analizador;

Uses 
auxiliares,validadores, extractor;

Var 
  control: longint;
  fuente: FileOfChar;
  lexema: string;
  TS: TablaDeSimbolos;
  complex: TipoSimboloGramatical;
  i: byte;
Begin
  Assign(fuente, './fuente.txt');
  Reset(fuente);
  control := 0;
  cargarPalRes(TS);
  ObtenerSiguienteCompLex(fuente, control, complex, lexema, ts);
  For i:= 1 To ts.cant Do
    Begin
      Writeln(TS.elem[i].compLex, ' | ', ts.elem[i].Lexema)
    End;
  Close(fuente);
End.

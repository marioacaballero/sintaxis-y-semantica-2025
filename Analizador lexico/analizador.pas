
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
  car: char;
Begin
  Assign(fuente, './fuente.txt');
  Reset(fuente);
  control := 0;
  cargarPalRes(TS);
  ObtenerSiguienteCompLex(fuente, control, complex, lexema, ts);
  LeerCar(fuente, control, car);
  While (car <> FinArch) Do
    Begin
      // WriteLn('control ', control);
      // WriteLn('car ', car);
      ObtenerSiguienteCompLex(fuente, control, complex, lexema, ts);
      LeerCar(fuente, control, car);
      // WriteLn('car f', car);
      // WriteLn('control ', control);
    End;
  // WriteLn('car sal', car);
  // WriteLn('control ', control);
  If car = FinArch Then
    WriteLn(Pesos, '$');
  For i:= 1 To ts.cant Do
    Begin
      Writeln(TS.elem[i].compLex, ' | ', ts.elem[i].Lexema)
    End;
  Close(fuente);
End.

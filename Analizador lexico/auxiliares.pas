
Unit auxiliares;

Interface

Const 
  q0 = 0;
  F = [2];
  Fr = [6,12];
  FinArch = #0;
  maxsim = 200;
  palres: array[1..10] Of string = ('program', 'begin', 'end', 'if', 'then',
                                    'else', 'while', 'do', 'read', 'write');

Type 
  Sigma = (Letra, Digito, Guion, Otro, OtroEsp);
  SigmaReal = (Dig, Signo, Punto, Coma, OtraC);
  FileOfChar = file Of Char;
  Q = 0..3;
  Qr = 0..13;
  TipoDelta = Array[Q,Sigma] Of Q;
  TipoDeltaReal = Array[Q,SigmaReal] Of Qr;

  TipoSimboloGramatical = (Tid,Tcreal,Tccadena,Tparentesisabre,Tparentisiscierra
                           ,Tmas,Tmenos,TProducto,T_division,Tptoycoma,Tcoma,
                           Tpunto,Toperadorrealacional,Toperadorasignacion,
                           ErrorGramatical, Pesos, TparReservada);
  TElemTS = Record
    compLex: TipoSimboloGramatical;
    Lexema: String;
  End;
  TablaDeSimbolos = Record
    elem: Array[1..MaxSim] Of TElemTS;
    cant: 0..maxsim;
  End;

Procedure LeerCar(Var Fuente:FileOfChar;Var control:
                  Longint; Var car:char);
Function CarASimb(Car:Char): Sigma;
Procedure InstalarEnTS(Lexema: String; Var TS:TablaDeSimbolos; Var CompLex:
                       TipoSimboloGramatical);
Procedure cargarPalRes(Var TS: TablaDeSimbolos);


Implementation

Function CarASimb(Car:Char): Sigma;
Begin
  Case Car Of 
    'a'..'z', 'A'..'Z': CarASimb := Letra;
    '0'..'9'      : CarASimb := Digito;
    '_': CarASimb := Guion;
    '(': CarASimb := OtroEsp;
    ')': CarASimb := OtroEsp;
    ';': CarASimb := OtroEsp;
    '.': CarASimb := OtroEsp;
    ',': CarASimb := OtroEsp;
    '<': CarASimb := OtroEsp;
    '>': CarASimb := OtroEsp;
    '=': CarASimb := OtroEsp;
    '+': CarASimb := OtroEsp;
    '-': CarASimb := OtroEsp;
    '*': CarASimb := OtroEsp;
    '/': CarASimb := OtroEsp;
    '"': CarASimb := OtroEsp;
    ':': CarASimb := OtroEsp;
    Else
      CarASimb := Otro
  End;
End;

Function carasimbReal(cha:char): SigmaReal;
Begin
  Case cha Of 
    '0'..'9' : carasimbReal := Dig;
    '.'      : carasimbReal := Punto;
    ','      : carasimbReal := Coma;
    '-'      : carasimbReal := Signo;
    Else
      carasimbReal := OtraC;
  End;
End;

Procedure LeerCar(Var Fuente:FileOfChar;Var control:Longint; Var car:char);
Begin
  If control < filesize(Fuente) Then
    Begin
      seek(FUENTE,control);
      read(fuente,car);
    End
  Else
    car := FinArch;
End;

Procedure initTS(Var TS: TablaDeSimbolos);

Var 
  i: byte;
Begin
  ts.cant := 0;
  For i := 1 To maxsim Do
    Begin
      TS.elem[i].compLex := TparReservada;
      TS.elem[i].Lexema := '';
    End;
End;

Procedure cargarPalRes(Var TS: TablaDeSimbolos);

Var i: byte;
Begin
  initTS(TS);

  For i:= 1 To 10 Do
    Begin
      TS.elem[i].compLex := TparReservada;
      TS.elem[i].Lexema := palres[i];
    End;
  ts.cant := 10;
End;

Procedure buscarenTS(TS: TablaDeSimbolos; lexema: String; Var complex:
                     TipoSimboloGramatical);

Var 
  i: byte;
  flag: Boolean;
Begin
  i := 1;
  flag := true;
  While (i <= ts.cant) And flag Do
    Begin
      If ts.elem[i].Lexema = lexema Then
        Begin
          flag := false;
          complex := ts.elem[i].compLex;
        End;
      inc(i);
    End;
End;

Procedure InstalarEnTS(Lexema: String; Var TS:TablaDeSimbolos; Var CompLex:
                       TipoSimboloGramatical);
Begin
  buscarenTS(TS, lexema, CompLex);
  If (CompLex <> TparReservada) Then
    Begin
      CompLex := Tid;
      ts.cant := ts.cant + 1;
      ts.elem[ts.cant].compLex := Tid;
      ts.elem[ts.cant].Lexema := Lexema;
    End;
End;

End.

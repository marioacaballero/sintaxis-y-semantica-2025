
Program test;

Uses sysutils;

Const 
  q0 = 0;
  F = [3];
  FinArch = #0;
  maxsim = 200;
  palres: array[1..10] Of string = ('program', 'begin', 'end', 'if', 'then',
                                    'else', 'while', 'do', 'read', 'write');

Type 
  TipoSimboloGramatical = (Tid,Tcreal,Tccadena,Tparentesisabre,Tparentisiscierra
                           ,Tmas,Tmenos,TProducto,T_division,Tptoycoma,Tcoma,
                           Tpunto,Toperadorrealacional,Toperadorasignacion,
                           ErrorGramatical, Pesos);
  Q = 0..3;
  Sigma = (Letra, Digito, Otro);
  TipoDelta = Array[Q,Sigma] Of Q;
  FileOfChar = file Of Char;
  TElemTS = Record
    compLex: TipoSimboloGramatical;
    Lexema: string;
  End;
  TablaDeSimbolos = Record
    elem: array[1..MaxSim] Of TElemTS;
    cant: 0..maxsim;
  End;

Function CarASimb(Car:Char): Sigma;
Begin
  Case Car Of 
    'a'..'z', 'A'..'Z': CarASimb := Letra;
    '0'..'9'      : CarASimb := Digito;
    Else
      CarASimb := Otro
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
    Begin
      car := FinArch;
    End;
End;

Function EsIdentificador(Var Fuente:FileOfChar; Var Control:LongInt; Var Lexema:
                         String): Boolean;

Var 
  ControlAux: LongInt;
  EstadoActual: Q;
  Delta: TipoDelta;
  Car: Char;
Begin
  {Cargar la tabla de transiciones}
  Delta[0,Letra] := 2;
  Delta[0,Digito] := 1;
  Delta[0,Otro] := 1;
  Delta[2,Letra] := 2;
  Delta[2,Digito] := 2;
  Delta[2,Otro] := 3;

  {Recorrer la cadena de entrada y cambiar estados}
  ControlAux := Control;
  EstadoActual := q0;
  Lexema := '';
  While (EstadoActual <> 1) And (EstadoActual <> 3) Do
    Begin
      LeerCar(Fuente, ControlAux, Car);
      EstadoActual := Delta[EstadoActual,CarASimb(Car)];
      ControlAux := ControlAux+1;
      If EstadoActual<>3 Then
        Lexema := Lexema+Car;
    End;
  If EstadoActual In F Then
    Begin
      EsIdentificador := True;
      Control := ControlAux;
    End
  Else
    EsIdentificador := False;
End;

Procedure InstalarEnTS(Lexema: String; Var TS:TablaDeSimbolos;CompLex:
                       TipoSimboloGramatical);
Begin
  ts.cant = Inc(ts.cant);
  ts.elem[ts.cant].compLex := CompLex;
  ts.elem[ts.cant].Lexema := Lexema;
End;

Function EsConstanteReal(Var Fuente:FileOfChar; Control: Longint;Lexema: String)
: Boolean;

Var 
Begin

End;

Procedure ObtenerSiguienteCompLex(Var Fuente:FileOfChar;Var Control:Longint; Var
                                  CompLex:TipoSimboloGramatical;Var Lexema:
                                  String;Var TS:
                                  TablaDeSimbolos);

Begin
  If EsIdentificador(Fuente,Control,Lexema) Then
    InstalarEnTS(Lexema,TS,CompLex)
  Else If EsConstanteReal(Fuente,Control,Lexema) Then
         CompLex := Tcreal
  Else If EsConstanteCadena(Fuente,Control,Lexema) Then
         CompLex := Tccadena
  Else If EsConstanteCadena(Fuente,Control,Lexema) Then
         CompLex := Tccadena
  Else If Not EsSimboloEspecial(Fuente,Control,Lexema,CompLex) Then
         CompLex := ErrorGramatical
End;

Procedure cargarPR(Var TS: TablaDeSimbolos);

Var i: byte;
Begin
  For i:= 1 To 10 Do
    Begin
      TS.elem[i].compLex := palres[i];
      TS.elem[i].Lexema := palres[i];
    End;
  ts.cant := 10;
End;

Var complex: TipoSimboloGramatical;

Begin
  While (complex <> ErrorGramatical) And (complex <> Pesos) Do
    Begin

    End;
End.

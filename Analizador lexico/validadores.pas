
Unit validadores;

Interface

Uses 
auxiliares, tablasAF;

Function EsIdentificador(Var Fuente:FileOfChar; Var Control:LongInt; Var Lexema:
                         String): Boolean;

Implementation

Function EsIdentificador(Var Fuente:FileOfChar; Var Control:LongInt; Var Lexema:
                         String): Boolean;

Const 
  q0 = 0;
  F = [2];

Function CarASimb(Car:Char): Sigma;

Begin
  Case Car Of 
    'a'..'z', 'A'..'Z': CarASimb := Letra;
    '0'..'9'      : CarASimb := Digito;
    '_': CarASimb := Guion;
    Else
      CarASimb := Otro
  End;
End;

Var 
  ControlAux: LongInt;
  EstadoActual: Q;
  Delta: TipoDelta;
  Car: Char;
Begin
  {Cargar la tabla de transiciones}
  AFIdentificador(Delta);
  {Recorrer la cadena de entrada y cambiar estados}
  ControlAux := Control;
  EstadoActual := q0;
  Lexema := '';
  While (EstadoActual <> 2) And (EstadoActual <> 3) Do
    Begin
      LeerCar(Fuente, ControlAux, Car);
      EstadoActual := Delta[EstadoActual,CarASimb(Car)];
      ControlAux := ControlAux + 1;
      If (EstadoActual<>2) And (EstadoActual<>3) Then
        Lexema := Lexema + Car;
    End;
  If EstadoActual In F Then
    Begin
      EsIdentificador := True;
      Control := ControlAux;
    End
  Else
    Begin
      EsIdentificador := False;
      Control := ControlAux;
    End;

End;




// Function EsConstanteReal(Var Fuente:FileOfChar; Control: Longint;Lexema: String)
// : Boolean;

// Var 
//   ControlAux: LongInt;
//   EstadoActual: Qr;
//   Delta: TipoDeltaReal;
//   Car: Char;
// Begin
//     {Cargar la tabla de transiciones}
//   Delta[0,Dig] := 2;
//   Delta[0,Punto] := 13;
//   Delta[0,Coma] := 13;
//   Delta[0,Signo] := 1;
//   Delta[0,OtraC] := 13;
//   Delta[1,Dig] := 2;
//   Delta[1,Punto] := 13;
//   Delta[1,Coma] := 13;
//   Delta[1,Signo] := 13;
//   Delta[1,OtraC] := 13;
//   Delta[2,Dig] := 3;
//   Delta[2,Punto] := 5;
//   Delta[2,Coma] := 7;
//   Delta[2,Signo] := 13;
//   Delta[2,OtraC] := 13;
//   Delta[3,Dig] := 4;
//   Delta[3,Punto] := 5;
//   Delta[3,Coma] := 7;
//   Delta[3,Signo] := 13;
//   Delta[3,OtraC] := 13;
//   Delta[4,Dig] := 13;
//   Delta[4,Punto] := 5;
//   Delta[4,Coma] := 7;
//   Delta[4,Signo] := 13;
//   Delta[4,OtraC] := 13;
//   Delta[5,Dig] := 6;
//   Delta[5,Punto] := 13;
//   Delta[5,Coma] := 13;
//   Delta[5,Signo] := 13;
//   Delta[5,OtraC] := 13;
//   Delta[6,Dig] := 6;
//   Delta[6,Punto] := 13;
//   Delta[6,Coma] := 13;
//   Delta[6,Signo] := 13;
//   Delta[6,OtraC] := 13;
//   Delta[7,Dig] := 8;
//   Delta[7,Punto] := 13;
//   Delta[7,Coma] := 13;
//   Delta[7,Signo] := 13;
//   Delta[7,OtraC] := 13;
//   Delta[8,Dig] := 9;
//   Delta[8,Punto] := 13;
//   Delta[8,Coma] := 13;
//   Delta[8,Signo] := 13;
//   Delta[8,OtraC] := 13;
//   Delta[9,Dig] := 10;
//   Delta[9,Punto] := 13;
//   Delta[9,Coma] := 13;
//   Delta[9,Signo] := 13;
//   Delta[9,OtraC] := 13;
//   Delta[10,Dig] := 13;
//   Delta[10,Punto] := 11;
//   Delta[10,Coma] := 7;
//   Delta[10,Signo] := 13;
//   Delta[10,OtraC] := 13;
//   Delta[11,Dig] := 12;
//   Delta[11,Punto] := 13;
//   Delta[11,Coma] := 13;
//   Delta[11,Signo] := 13;
//   Delta[11,OtraC] := 13;
//   Delta[12,Dig] := 12;
//   Delta[12,Punto] := 13;
//   Delta[12,Coma] := 13;
//   Delta[12,Signo] := 13;
//   Delta[12,OtraC] := 13;
//   Delta[13,Dig] := 13;
//   Delta[13,Punto] := 13;
//   Delta[13,Coma] := 13;
//   Delta[13,Signo] := 13;
//   Delta[13,OtraC] := 13;

//   {Recorrer la cadena de entrada y cambiar estados}
//   ControlAux := Control;
//   EstadoActual := q0;
//   Lexema := '';
//   While (EstadoActual <> 2) And (EstadoActual <> 13) Do
//     Begin
//       LeerCar(Fuente, ControlAux, Car);
//       EstadoActual := Delta[EstadoActual,CarASimb(Car)];
//       ControlAux := ControlAux+1;
//       If (EstadoActual<>2) And (EstadoActual<>3) Then
//         Lexema := Lexema+Car;
//     End;
//   If EstadoActual In F Then
//     Begin
//       EsConstanteReal := True;
//       Control := ControlAux;
//     End
//   Else
//     EsConstanteReal := False;
// End;

End.

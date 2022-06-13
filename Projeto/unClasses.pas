unit unClasses;

interface

Uses System.Classes, SysUtils, unDataModule;

type TClasses = class

private
// atributos e metodos privados
protected
// atributos e metodos protegidos
public
// atibutos e metodos publicos

// metodos da classe

//function Divisores(iNumero :Integer ):TStringList;

end;

implementation

{ Tpessoa }

(*
Function  TNumDivisor.Divisores(iNumero :Integer ):TStringList;
Var arrNumero: Array of Integer;
    i, iPosicao: Integer;
    strLstResultado: TStringList;
Begin

   strLstResultado := TStringList.Create();

   iPosicao := 1;
   SetLength(arrNumero, iPosicao);
   arrNumero[(iPosicao - 1)] := 1;
   For i := 2 To iNumero Do Begin
      If (iNumero mod i) = 0 Then Begin
         Inc(iPosicao);
         SetLength(arrNumero, iPosicao);
         arrNumero[(iPosicao - 1)] := i;
      End;
   End;

   For i := 0 To (Length(arrNumero) - 1) Do Begin
      strLstResultado.Add(IntToStr(arrNumero[i]));
   End;

   Result := strLstResultado;

End;
*)


end.





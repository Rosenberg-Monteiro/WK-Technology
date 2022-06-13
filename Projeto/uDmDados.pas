unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

Var
   //Declaração das variáveis públicas a todo o sistema (dessa forma, nao é necessário se referir ao formulário onde foram criadas
   sNomeAdmin, sLoginAdmin, sSenhaAdmin,
   sServer, sUserName, sPassword,
   sDatabase, sPort, sNomeUsuario: String;
   iNivelAcesso: Integer;

type
  TdmDados = class(TDataModule)
    fdConexaoBD: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    fdQryPesquisa: TFDQuery;
  function XorDecode(Source, Key: String): String;
  function XorEncode(Source, Key: String): String;
  function SoNumeros(const Texto: String): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Function TdmDados.SoNumeros(Const Texto: String): String;
Var I: integer;
    S: string;
Begin
   //Valida o Parâmetro Texto Somente com Números
   S := '';
   For I := 1 To Length(Texto) Do Begin
      If (Texto[I] in ['0' .. '9']) Then
         S := S + Copy(Texto, I, 1);
   End;
   Result := S;
End;

//Função para criptografar. Necessita de uma chave pública e outra privada.  Só o Desenvolvedor sabe qual é essa chave privada
Function TdmDados.XorEncode(Source, Key: String): String;
Var I: Integer;
    C: Byte;
Begin
   Result := '';
   For I := 1 To Length(Source) Do Begin
      If Length(Key) > 0 Then
         C := Byte(Key[1 + ((I - 1) mod Length(Key))]) xor Byte(Source[I])
      Else
         C := Byte(Source[I]);
      Result := Result + AnsiLowerCase(IntToHex(C, 2));
   End;
End;

//Função para descriptografar. Necessita de uma chave pública e outra privada.  Só o Desenvolvedor sabe qual é essa chave privada
Function TdmDados.XorDecode(Source, Key: String): String;
Var I: Integer;
    C: Char;
Begin
   Result := '';
   For I := 0 To Length(Source) div 2 - 1 Do Begin
      C := Chr(StrToIntDef('$' + Copy(Source, (I * 2) + 1, 2), Ord(' ')));
      If Length(Key) > 0 Then
         C := Chr(Byte(Key[1 + (I mod Length(Key))]) xor Byte(C));
      Result := Result + C;
   End;
End;

End.

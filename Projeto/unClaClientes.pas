unit unClaClientes;

interface

Uses System.Classes, SysUtils, unDataModule, Data.DB;

type
   TCliente = class

private
   // atributos e metodos privados
   pCodigo: Integer;
   pNome : string;
   pCidade : string;
   pUF : string;

protected
   // atributos e metodos protegidos

public
   // atibutos e metodos publicos

   property Codigo:  Integer read pCodigo write pCodigo;
   property Nome :   string  read pNome   write pNome;
   property Cidade : string  read pCidade write pCidade;
   property UF :     string  read pUF     write pUF;

   // metodos da classe

   function PesquisaTodosCliente: TDataSet;
   Procedure FechaConexao;
   Function IncluirCliente(aCliente: TCliente): String;
   Function AlterarCliente(aCliente: TCliente): String;
   Function ExcluirCliente(aCliente: TCliente): String;

end;

implementation

{ TCliente }

function TCliente.AlterarCliente(aCliente: TCliente): String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `AlterarCliente` ('+IntToStr(aCliente.Codigo)+', '+
                                            QuotedStr(aCliente.Nome)+', '+
                                            QuotedStr(aCliente.Cidade)+', '+
                                            QuotedStr(aCliente.UF)+'); ';
      Try
         ExecSQL;
         DataModule1.FDConnection.CommitRetaining;
         Result := '';
      Except On E: Exception Do
         Begin
            DataModule1.FDConnection.RollbackRetaining;
            Result := E.Message;
         End;
      End;
   End;
end;

function TCliente.ExcluirCliente(aCliente: TCliente): String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `ExcluirCliente` ('+IntToStr(aCliente.Codigo)+'); ';
      Try
         ExecSQL;
         DataModule1.FDConnection.CommitRetaining;
         Result := '';
      Except On E: Exception Do
         Begin
            DataModule1.FDConnection.RollbackRetaining;
            Result := E.Message;
         End;
      End;
   End;
End;

procedure TCliente.FechaConexao;
begin
   With DataModule1.FDConnection Do Begin
      If Connected Then
         Connected := False;
   End;
end;

function TCliente.PesquisaTodosCliente: TDataSet;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;
   With DataModule1.fdQryPesquisa1 Do Begin
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `PesquisaTodosClientes`(null, null);';
      Open;
      Result := DataModule1.fdQryPesquisa1;
   End;
end;

Function TCliente.IncluirCliente(aCliente: TCliente): String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `IncluirCliente` ('+QuotedStr(aCliente.Nome)+', '+
                                            QuotedStr(aCliente.Cidade)+', '+
                                            QuotedStr(aCliente.UF)+'); ';
      Try
         ExecSQL;
         DataModule1.FDConnection.CommitRetaining;
         Result := '';
      Except On E: Exception Do
         Begin
            DataModule1.FDConnection.RollbackRetaining;
            Result := E.Message;
         End;
      End;
   End;
end;

end.

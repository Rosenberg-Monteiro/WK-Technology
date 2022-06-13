unit unClaProdutos;

interface

Uses System.Classes, SysUtils, unDataModule, Data.DB;

type
   TProduto = class

private
   // atributos e metodos privados
   pCodigo: Integer;
   pDescricao : string;
   pPrecoVenda : Real;

protected
   // atributos e metodos protegidos

public
   // atibutos e metodos publicos

   property Codigo:     Integer read pCodigo     write pCodigo;
   property Descricao:  string  read pDescricao  write pDescricao;
   property PrecoVenda: Real    read pPrecoVenda write pPrecoVenda;

   // metodos da classe

   function PesquisaTodosProdutos: TDataSet;
   Procedure FechaConexao;
   Function IncluirProduto(aProduto: TProduto): String;
   Function AlterarProduto(aProduto: TProduto): String;
   Function ExcluirProduto(aProduto: TProduto): String;

end;

implementation

{ TProduto }

function TProduto.AlterarProduto(aProduto: TProduto): String;
Var sPrecoVenda: String;
begin
If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin

      sPrecoVenda := FormatFloat('########0.00', aProduto.pPrecoVenda);
      sPrecoVenda := StringReplace(sPrecoVenda, ',', '.', [rfReplaceAll]);
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `AlterarProduto` ('+IntToStr(aProduto.Codigo)+', '+
                                            QuotedStr(aProduto.pDescricao)+', '+
                                            sPrecoVenda+'); ';
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

function TProduto.ExcluirProduto(aProduto: TProduto): String;
begin
If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `ExcluirProduto` ('+IntToStr(aProduto.Codigo)+'); ';
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


function TProduto.IncluirProduto(aProduto: TProduto): String;
Var sPrecoVenda: String;
begin
If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin
      sPrecoVenda := FormatFloat('########0.00', aProduto.pPrecoVenda);
      sPrecoVenda := StringReplace(sPrecoVenda, ',', '.', [rfReplaceAll]);

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `IncluirProduto` ('+QuotedStr(aProduto.Descricao)+', '+
                                            sPrecoVenda+'); ';
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

function TProduto.PesquisaTodosProdutos: TDataSet;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;
   With DataModule1.fdQryPesquisa1 Do Begin
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `PesquisaTodosProdutos`(null, null);';
      Open;
      Result := DataModule1.fdQryPesquisa1;
   End;

end;

procedure TProduto.FechaConexao;
begin
   With DataModule1.FDConnection Do Begin
      If Connected Then
         Connected := False;
   End;
end;

end.

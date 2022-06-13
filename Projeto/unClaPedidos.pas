unit unClaPedidos;

interface

Uses System.Classes, SysUtils, unDataModule, Data.DB;

type
   TPedido = class

private
   // atributos e metodos privados

   pNumeroPedido:  Integer;
   pCodigoCliente: Integer;
   pValorTotal:    Real;
   pDataEmissao:   TDateTime;
   pNomeCliente:   String;

protected
   // atributos e metodos protegidos

public
   // atibutos e metodos publicos

   property NumeroPedido:  Integer   Read pNumeroPedido  Write pNumeroPedido;
   property CodigoCliente: Integer   Read pCodigoCliente Write pCodigoCliente;
   property ValorTotal:    Real      Read pValorTotal    Write pValorTotal;
   property DataEmissao:   TDateTime Read pDataEmissao   Write pDataEmissao;
   property NomeCliente:   String    Read pNomeCliente   Write pNomeCliente;

   // metodos da classe

   Procedure FechaConexao;
   function PesquisaTodosPedidos: TDataSet;
   Function PesquisaCliente(aPedido: TPedido): TPedido;
   Function IncluirPedido(aPedido: TPedido): String;
   Function AlterarPedido(aPedido: TPedido): String;
   Function ExcluirPedido(aPedido: TPedido): String;

end;

implementation

function TPedido.AlterarPedido(aPedido: TPedido): String;
Var sValorTotal, sDataPedido: String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin
      sValorTotal := FormatFloat('########0.00', aPedido.ValorTotal);
      sValorTotal := StringReplace(sValorTotal, ',', '.', [rfReplaceAll]);

      sDataPedido := FormatDateTime('yyyy-mm-dd', aPedido.pDataEmissao);

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `AlterarPedido` ('+IntToStr(aPedido.NumeroPedido)+', '+
                                           QuotedStr(sDataPedido)+', '+
                                           IntToStr(aPedido.CodigoCliente)+', '+
                                           sValorTotal+'); ';
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

function TPedido.ExcluirPedido(aPedido: TPedido): String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `ExcluirPedido` ('+IntToStr(aPedido.NumeroPedido)+'); ';
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


procedure TPedido.FechaConexao;
begin
   With DataModule1.FDConnection Do Begin
      If Connected Then
         Connected := False;
   End;
end;

function TPedido.IncluirPedido(aPedido: TPedido): String;
Var sValorTotal, sDataPedido: String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin
      sValorTotal := FormatFloat('########0.00', aPedido.ValorTotal);
      sValorTotal := StringReplace(sValorTotal, ',', '.', [rfReplaceAll]);

      sDataPedido := FormatDateTime('yyyy-mm-dd', aPedido.pDataEmissao);

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `IncluirPedido` ('+QuotedStr(sDataPedido)+', '+
                                           IntToStr(aPedido.CodigoCliente)+', '+
                                           sValorTotal+'); ';
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

function TPedido.PesquisaCliente(aPedido: TPedido): TPedido;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   With DataModule1.fdQryPesquisa1 Do Begin
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `PesquisaClientePorCodigo`('+IntToStr(aPedido.pCodigoCliente)+');';
      Open;
      aPedido.NomeCliente := FieldByName('NOme').AsString;
      Result := aPedido;
   End;
end;

function TPedido.PesquisaTodosPedidos: TDataSet;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;
   With DataModule1.fdQryPesquisa1 Do Begin
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `PesquisaTodosPedidos`(0);';
      Open;
      Result := DataModule1.fdQryPesquisa1;
   End;

end;

end.

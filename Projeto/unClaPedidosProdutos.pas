unit unClaPedidosProdutos;

interface

Uses System.Classes, SysUtils, unDataModule, Data.DB;

type
   TPedidoProduto = class

private
   // atributos e metodos privados

   pidPedidosProdutos:  Integer;
   pNumeroPedido:       Integer;
   pCodigoProduto:      Integer;
   pDescricao:          String;
   pQuantidade:         Real;
   pValorUnitario:      Real;
   pValorTotal:         Real;

protected
   // atributos e metodos protegidos

public
   // atibutos e metodos publicos

   property idPedidosProdutos:  Integer Read pidPedidosProdutos  Write pidPedidosProdutos;
   property NumeroPedido:       Integer Read pNumeroPedido       Write pNumeroPedido;
   property CodigoProduto:      Integer Read pCodigoProduto      Write pCodigoProduto;
   property Descricao:          String  Read pDescricao          Write pDescricao;
   property Quantidade:         Real    Read pQuantidade         Write pQuantidade;
   property ValorUnitario:      Real    Read pValorUnitario      Write pValorUnitario;
   property ValorTotal:         Real    Read pValorTotal         Write pValorTotal;
   // metodos da classe

   Procedure FechaConexao;
   function PesquisaTodosPedidosProdutos(aPedidoProduto: TPedidoProduto): TDataSet;
   Function PesquisaProduto(aPedidoProduto: TPedidoProduto): TPedidoProduto;
   Function IncluirPedidoProduto(aPedidoProduto: TPedidoProduto): String;
   Function AlterarPedidoProduto(aPedidoProduto: TPedidoProduto): String;
   Function ExcluirPedidoProduto(aPedidoProduto: TPedidoProduto): String;
   Function TotalizaPedido(aPedidoProduto: TPedidoProduto): String;

end;

implementation

function TPedidoProduto.AlterarPedidoProduto(aPedidoProduto: TPedidoProduto): String;
Var sQuantidade, sValorUnitario, sValorTotal: String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin
      sQuantidade    := FormatFloat('########0.##', aPedidoProduto.Quantidade);
      sValorUnitario := FormatFloat('########0.##', aPedidoProduto.ValorUnitario);
      sValorTotal    := FormatFloat('########0.##', (aPedidoProduto.ValorUnitario * aPedidoProduto.Quantidade));

      sQuantidade    := StringReplace(sQuantidade, ',', '.', [rfReplaceAll]);
      sValorUnitario := StringReplace(sValorUnitario, ',', '.', [rfReplaceAll]);
      sValorTotal    := StringReplace(sValorTotal, ',', '.', [rfReplaceAll]);

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `AlterarPedidoProduto` ('+IntToStr(aPedidoProduto.idPedidosProdutos)+', '+
                                                  IntToStr(aPedidoProduto.NumeroPedido)+', '+
                                                  IntToStr(aPedidoProduto.CodigoProduto)+', '+
                                                  sQuantidade+', '+
                                                  sValorUnitario+', '+
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

function TPedidoProduto.IncluirPedidoProduto(aPedidoProduto: TPedidoProduto): String;
Var sQuantidade, sValorUnitario, sValorTotal: String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin
      sQuantidade    := FormatFloat('########0.##', aPedidoProduto.Quantidade);
      sValorUnitario := FormatFloat('########0.##', aPedidoProduto.ValorUnitario);
      sValorTotal    := FormatFloat('########0.##', (aPedidoProduto.ValorUnitario * aPedidoProduto.Quantidade));

      sQuantidade    := StringReplace(sQuantidade, ',', '.', [rfReplaceAll]);
      sValorUnitario := StringReplace(sValorUnitario, ',', '.', [rfReplaceAll]);
      sValorTotal    := StringReplace(sValorTotal, ',', '.', [rfReplaceAll]);

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `IncluirPedidoProduto` ('+IntToStr(aPedidoProduto.NumeroPedido)+', '+
                                                  IntToStr(aPedidoProduto.CodigoProduto)+', '+
                                                  sQuantidade+', '+
                                                  sValorUnitario+', '+
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


function TPedidoProduto.PesquisaProduto(aPedidoProduto: TPedidoProduto): TPedidoProduto;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   With DataModule1.fdQryPesquisa1 Do Begin
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `PesquisaProdutoProCodigo`('+IntToStr(aPedidoProduto.CodigoProduto)+');';
      Open;
      aPedidoProduto.CodigoProduto := FieldByName('Codigo').AsInteger;
      aPedidoProduto.Descricao     := FieldByName('Descricao').AsString;
      aPedidoProduto.ValorUnitario := FieldByName('PrecoVenda').AsFloat;
      Result := aPedidoProduto;
   End;
end;

function TPedidoProduto.PesquisaTodosPedidosProdutos(aPedidoProduto: TPedidoProduto): TDataSet;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;
   With DataModule1.fdQryPesquisa1 Do Begin
      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `PesquisaTodosPedidosProdutos`('+IntToStr(aPedidoProduto.NumeroPedido)+');';
      Open;
      Result := DataModule1.fdQryPesquisa1;
   End;

end;

function TPedidoProduto.TotalizaPedido(aPedidoProduto: TPedidoProduto): String;
Var sComando: String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin

      sComando := 'call TotalizaPedido`('+IntToStr(aPedidoProduto.NumeroPedido)+'); ';

      If Active then Close;
      SQL.Clear;
      SQL.Text := sComando;
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

function TPedidoProduto.ExcluirPedidoProduto(aPedidoProduto: TPedidoProduto): String;
Var sQuantidade, sValorUnitario, sValorTotal: String;
begin
   If Not DataModule1.FDConnection.Connected Then
      DataModule1.FDConnection.Open;

   DataModule1.FDConnection.StartTransaction;

   With DataModule1.fdQryPesquisa1 Do Begin
      sQuantidade    := FormatFloat('########0.##', aPedidoProduto.Quantidade);
      sValorUnitario := FormatFloat('########0.##', aPedidoProduto.ValorUnitario);
      sValorTotal    := FormatFloat('########0.##', (aPedidoProduto.ValorUnitario * aPedidoProduto.Quantidade));

      sQuantidade    := StringReplace(sQuantidade, ',', '.', [rfReplaceAll]);
      sValorUnitario := StringReplace(sValorUnitario, ',', '.', [rfReplaceAll]);
      sValorTotal    := StringReplace(sValorTotal, ',', '.', [rfReplaceAll]);

      If Active then Close;
      SQL.Clear;
      SQL.Text := 'call `ExcluirPedidoProduto` ('+IntToStr(aPedidoProduto.idPedidosProdutos)+'); ';
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

procedure TPedidoProduto.FechaConexao;
begin
   With DataModule1.FDConnection Do Begin
      If Connected Then
         Connected := False;
   End;
end;

end.

unit unPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons,
  unClaPedidos, unClaPedidosProdutos, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, unFramBotoes;

type
  TfrmPedidos = class(TForm)
    dsPedidos: TDataSource;
    fdMemPedidosProdutos: TFDMemTable;
    fdMemPedidosProdutosidPedidosProdutos: TIntegerField;
    fdMemPedidosProdutosNumeroPedido: TIntegerField;
    fdMemPedidosProdutosCodigoProduto: TIntegerField;
    fdMemPedidosProdutosQuantidade: TFloatField;
    fdMemPedidosProdutosValorUnitario: TFloatField;
    fdMemPedidosProdutosValorTotal: TFloatField;
    dsPedidosProdutos: TDataSource;
    fdMemPedidosProdutosDescricao: TStringField;
    pgcPedidos: TPageControl;
    tabPedidosLancados: TTabSheet;
    dbGrdPedidos: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    btAbrirPedido: TSpeedButton;
    tabPedido: TTabSheet;
    pnlDadosPedido: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    dbEdDataEmissao: TDBEdit;
    dbEdCodigoCliente: TDBEdit;
    dbEdNomeClente: TDBEdit;
    Panel2: TPanel;
    Label4: TLabel;
    dbTxtVaalorTotal: TDBText;
    Panel3: TPanel;
    framBotoes1: TframBotoes;
    pnlDadosProdutos: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnNovoPedidoProduto: TSpeedButton;
    mnuGravarPedidoProdto: TSpeedButton;
    dbEdProduto: TDBEdit;
    dbEdDescricao: TDBEdit;
    dbEdValorUnitario: TDBEdit;
    dbEdQuantidade: TDBEdit;
    dbEdValorTotal: TDBEdit;
    dbGrdPedidosProdutos: TDBGrid;
    fdMemPedidos: TFDMemTable;
    fdMemPedidosNumeroPedido: TIntegerField;
    fdMemPedidosDataEmissao: TDateTimeField;
    fdMemPedidosCodigoCliente: TIntegerField;
    fdMemPedidosNome: TStringField;
    fdMemPedidosValorTotal: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure framBotoes1btIncluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbEdDataEmissaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbEdCodigoClienteExit(Sender: TObject);
    procedure framBotoes1btGravarClick(Sender: TObject);
    procedure framBotoes1btCancelarClick(Sender: TObject);
    procedure framBotoes1btAlterarClick(Sender: TObject);
    procedure btAbrirPedidoClick(Sender: TObject);
    procedure btnNovoPedidoProdutoClick(Sender: TObject);
    procedure framBotoes1btExcluirClick(Sender: TObject);
    procedure mnuGravarPedidoProdtoClick(Sender: TObject);
    procedure dbGrdPedidosCellClick(Column: TColumn);
    procedure dbEdProdutoExit(Sender: TObject);
    procedure dbGrdPedidosProdutosDblClick(Sender: TObject);
    procedure dbGrdPedidosProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AbrirPesquisa;
    procedure AbrirPesquisaProdutos;
    procedure ExcluirPedidosProduto;
    procedure TotalizarPedidoAtual;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;
  sOperacao: String;

implementation

{$R *.dfm}

procedure TfrmPedidos.AbrirPesquisa;
Var sPedido: TPedido;
begin
   sPedido := TPedido.Create();
   If Not fdMemPedidos.Active Then
      fdMemPedidos.Open;
   fdMemPedidos.EmptyDataSet;
   fdMemPedidos.CopyDataSet(sPedido.PesquisaTodosPedidos);
   fdMemPedidos.Open;

   (*
   If Not FDMemTable1.Active Then
      FDMemTable1.Open;
   FDMemTable1.EmptyDataSet;
   FDMemTable1.CopyDataSet(sPedido.PesquisaTodosPedidos);
   FDMemTable1.Open;
   *)

   AbrirPesquisaProdutos;
   FreeAndNIl(sPedido);
   sPedido.FechaConexao;

end;

procedure TfrmPedidos.AbrirPesquisaProdutos;
Var sPedidoProduto: TPedidoProduto;
begin
   sPedidoProduto := TPedidoProduto.Create();
   If Not fdMemPedidosProdutos.Active Then
      fdMemPedidosProdutos.Open;

   sPedidoProduto.NumeroPedido := fdMemPedidos.FieldByName('NumeroPedido').AsInteger;
   fdMemPedidosProdutos.EmptyDataSet;
   fdMemPedidosProdutos.CopyDataSet(sPedidoProduto.PesquisaTodosPedidosProdutos(sPedidoProduto));
   fdMemPedidosProdutos.Open;
   FreeAndNil(sPedidoProduto);
end;

procedure TfrmPedidos.btnNovoPedidoProdutoClick(Sender: TObject);
begin
   If fdMemPedidos.FieldByName('NumeroPedido').AsInteger = 0 Then
      Application.MessageBox('Por favor, informe um pedido válido.  Verifique se os dados foram gravados antes de incluir um produto ao referido pedido.', 'Pedido Inválido', mb_Ok+Mb_IconInformation)
   Else Begin
      fdMemPedidosProdutos.Append;
      sOperacao := 'IP';
      dbEdProduto.ReadOnly := False;
      dbEdProduto.SetFocus;
   End;
end;

procedure TfrmPedidos.dbEdCodigoClienteExit(Sender: TObject);
Var aPedido: TPedido;
begin
   If (sOperacao = 'I') Or (sOperacao = 'A') Then Begin
      aPedido := TPedido.Create;
      aPedido.CodigoCliente := dbEdCodigoCliente.Field.AsInteger;
      aPedido := aPedido.PesquisaCliente(aPedido);
      dbEdNomeClente.Field.AsString := aPedido.NomeCliente;
   End;
end;

procedure TfrmPedidos.dbEdDataEmissaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   If key <> 8 Then Begin
      If Length(dbEdDataEmissao.Text) < 10 Then Begin
         case Length(dbEdDataEmissao.Text) of
           2 : dbEdDataEmissao.Text := dbEdDataEmissao.Text + '/';
           5 : dbEdDataEmissao.Text := dbEdDataEmissao.Text + '/';
         end;
         dbEdDataEmissao.SelStart := Length(dbEdDataEmissao.Text);
      End Else Begin
         Try
            StrToDate(dbEdDataEmissao.Text);
         Except
            Application.MessageBox('A Data informada não é uma data valida. Verifique', 'Data Inválida', mb_Ok+mb_IconInformation);

         End;
      End;
   End;
end;

procedure TfrmPedidos.dbEdProdutoExit(Sender: TObject);
Var aPedidoProduto: TPedidoProduto;
begin
   If (sOperacao = 'IP') Or (sOperacao = 'AP') Then Begin
      aPedidoProduto := TPedidoProduto.Create;
      aPedidoProduto.CodigoProduto    := StrToInt(dbEdProduto.Text);
      aPedidoProduto                  := aPedidoProduto.PesquisaProduto(aPedidoProduto);
      If aPedidoProduto.CodigoProduto = 0 Then Begin
         Application.MessageBox('Produto não localizado.  Por favor, verifique.', 'Produto Não Localizado', mb_Ok+Mb_IconInformation);
         dbEdProduto.SetFocus;
      End Else Begin
         dbEdDescricao.Field.AsString    := aPedidoProduto.Descricao;
         If dbEdValorUnitario.Field.AsFloat = 0 Then Begin
            dbEdValorUnitario.Field.AsFloat := aPedidoProduto.ValorUnitario;
            dbEdValorTotal.Field.AsFloat    := aPedidoProduto.ValorTotal;
         End;
      End;
      FreeAndNIl(aPedidoProduto);
   End;
end;

procedure TfrmPedidos.dbGrdPedidosCellClick(Column: TColumn);
begin
   AbrirPesquisaProdutos;
end;

procedure TfrmPedidos.dbGrdPedidosProdutosDblClick(Sender: TObject);
begin
   sOperacao := 'AP';
   dbEdProduto.ReadOnly := True;
   fdMemPedidosProdutos.Edit;
   dbEdValorUnitario.SetFocus;
end;

procedure TfrmPedidos.ExcluirPedidosProduto;
begin
   If Application.MessageBox('Deseja realmente EXCLUIR o registro atual ?', 'Solicitação de Exclusão', mb_YesNO+Mb_IconQuestion+Mb_DefButton2) = mrYes  Then Begin
      sOperacao := 'EP';
      mnuGravarPedidoProdtoClick(self);
   End Else Begin
      sOperacao := '';
      fdMemPedidosProdutos.Cancel;
   End;
   AbrirPesquisaProdutos;
end;

procedure TfrmPedidos.dbGrdPedidosProdutosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var bAltera: Boolean;
begin
   bAltera := True;
   If (fdMemPedidosProdutos.State In [dsInsert, dsEdit]) Then Begin
      If Application.MessageBox('Existem dados ainda não gravados.  Deseja cancelar essa operação ?', 'Confirmação de Operação', mb_YesNo+Mb_IconQuestion+mb_DefButton2) = mrYes Then
         fdMemPedidosProdutos.Cancel
      Else
         bAltera := False;
   End;

   If bAltera Then Begin
      If (key = 13) Then Begin
         dbGrdPedidosProdutosDblClick(Sender);
         dbEdProduto.SetFocus;
      End Else if (key = 46) then
         ExcluirPedidosProduto;
   End;

end;

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   frmPedidos := Nil;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
   Top := 0;
   Left := 0;
   pgcPedidos.ActivePageIndex := 0;
   sOperacao := '';
   AbrirPesquisa;
end;

procedure TfrmPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   {
   If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
   End;
   }
end;

procedure TfrmPedidos.framBotoes1btAlterarClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   sOperacao := 'A';
   dbEdDataEmissao.SetFocus;
   pnlDadosPedido.Enabled := True;
   fdMemPedidos.Edit;
end;

procedure TfrmPedidos.framBotoes1btCancelarClick(Sender: TObject);
begin
  framBotoes1.btGravarClick(Sender);
  framBotoes1.btGravarClick(Sender);
  pnlDadosPedido.Enabled := False;
  fdMemPedidos.Cancel;
  sOperacao := '';
end;

procedure TfrmPedidos.framBotoes1btExcluirClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   sOperacao := 'E';
   If Application.MessageBox('Deseja realmente EXCLUIR o Pedido atual ?', 'Solicitação de Exclusão', mb_YesNO+Mb_IconQuestion+Mb_DefButton2) = mrYes  Then Begin
      sOperacao := 'E';
      framBotoes1btGravarClick(Self);
   End Else
      framBotoes1btCancelarClick(Self);

end;

procedure TfrmPedidos.framBotoes1btGravarClick(Sender: TObject);
Var sPedido: TPedido;
    sRetorno: String;
begin
   framBotoes1.btGravarClick(Sender);
   sPedido := TPedido.Create();
   sPedido.NumeroPedido  := fdMemPedidos.FieldByName('NUmeroPedido').AsInteger;
   sPedido.DataEmissao   := fdMemPedidos.FieldByName('DataEmissao').AsDateTime;
   sPedido.CodigoCliente := fdMemPedidos.FieldByName('CodigoCliente').AsInteger;
   sPedido.ValorTotal    := fdMemPedidos.FieldByName('ValorTotal').AsFloat;

   If sOperacao = 'I' Then
      sRetorno := sPedido.IncluirPedido(sPedido)
   Else If sOperacao = 'A' Then
      sRetorno := sPedido.AlterarPedido(sPedido)
   Else If sOperacao = 'E' Then
      sRetorno := sPedido.ExcluirPedido(sPedido);

   If sRetorno = '' Then Begin
      AbrirPesquisa;
      fdMemPedidos.Locate('NumeroPedido', sPedido.NumeroPedido, []);
   End Else
      Application.MessageBox(PChar('Ocorreu um erro ao gravar os dados.  Verifique.'+#13+
                             sRetorno), 'Erro ao Gravar Dados', mb_Ok+Mb_IconInformation);
   sOperacao := '';

   FreeAndNil(sPedido);

   sPedido.FechaConexao;

end;

procedure TfrmPedidos.framBotoes1btIncluirClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   sOperacao := 'I';
   dbEdDataEmissao.SetFocus;
   pnlDadosPedido.Enabled := True;
   fdMemPedidos.Append;
end;

procedure TfrmPedidos.mnuGravarPedidoProdtoClick(Sender: TObject);
Var sPedidoProduto: TPedidoProduto;
    sRetorno: String;
begin
   framBotoes1.btGravarClick(Sender);
   sPedidoProduto := TPedidoProduto.Create();
   sPedidoProduto.NumeroPedido      := fdMemPedidos.FieldByName('NumeroPedido').AsInteger;
   sPedidoProduto.idPedidosProdutos := fdMemPedidosProdutos.FieldByName('idPedidosProdutos').AsInteger;
   sPedidoProduto.CodigoProduto     := fdMemPedidosProdutos.FieldByName('CodigoProduto').AsInteger;
   sPedidoProduto.Quantidade        := fdMemPedidosProdutos.FieldByName('Quantidade').AsFloat;
   sPedidoProduto.ValorUnitario     := fdMemPedidosProdutos.FieldByName('ValorUnitario').AsFloat;
   sPedidoProduto.ValorTotal        := sPedidoProduto.ValorUnitario * sPedidoProduto.Quantidade;

   If sOperacao = 'IP' Then
      sRetorno := sPedidoProduto.IncluirPedidoProduto(sPedidoProduto)
   Else If sOperacao = 'AP' Then
      sRetorno := sPedidoProduto.AlterarPedidoProduto(sPedidoProduto)
   Else If sOperacao = 'EP' Then
      sRetorno := sPedidoProduto.ExcluirPedidoProduto(sPedidoProduto);

   If sRetorno = '' Then Begin
      fdMemPedidos.Locate('NumeroPedido', sPedidoProduto.NumeroPedido, []);
      AbrirPesquisaProdutos;
      fdMemPedidosProdutos.Locate('idPedidosProdutos', sPedidoProduto.idPedidosProdutos, []);
   End Else
      Application.MessageBox(PChar('Ocorreu um erro ao gravar os dados.  Verifique.'+#13+
                             sRetorno), 'Erro ao Gravar Dados', mb_Ok+Mb_IconInformation);
   sOperacao := '';

   If sRetorno <> '' Then
      Application.MessageBox(PChar('Ocorreu um erro ao gravar os dados.  Verifique.'+#13+
                             sRetorno), 'Erro ao Gravar Dados', mb_Ok+Mb_IconInformation);

   FreeAndNIl(sPedidoProduto);
   sPedidoProduto.FechaConexao;

   TotalizarPedidoAtual;

end;

Procedure TfrmPedidos.TotalizarPedidoAtual;
Var vTotalPedido: Real;
    bkmPonteiro: TBookMark;
    iNumeroPedido: Integer;
begin
   With fdMemPedidosProdutos Do Begin
      vTotalPedido := 0;
      bkmPonteiro := GetBookmark;
      DisableControls;
      First;
      While Not Eof Do Begin
         vTotalPedido := vTotalPedido + FieldByName('ValorTotal').AsFloat;
         Next;
      End;
      GotoBookmark(bkmPonteiro);
      FreeBookmark(bkmPonteiro);
      EnableControls;

      fdMemPedidos.Edit;
      fdMemPedidos.FieldByName('ValorTotal').AsFloat := vTotalPedido;
      fdMemPedidos.Post;
      framBotoes1btGravarClick(Self);
      AbrirPesquisa;
      fdMemPedidos.Locate('NumeroPedido', iNumeroPedido, []);

   End;

end;

procedure TfrmPedidos.SpeedButton1Click(Sender: TObject);
begin
   pgcPedidos.SelectNextPage(True);
   framBotoes1btIncluirClick(Self);
end;

procedure TfrmPedidos.btAbrirPedidoClick(Sender: TObject);
begin
   pgcPedidos.SelectNextPage(True);
end;

end.

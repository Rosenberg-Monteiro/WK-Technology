unit unProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  unFramBotoes, Vcl.ExtCtrls, unClaProdutos;

type
  TfrmProdutos = class(TForm)
    fdMemProdutos: TFDMemTable;
    fdMemProdutosCodigo: TIntegerField;
    dsProdutos: TDataSource;
    Panel1: TPanel;
    framBotoes1: TframBotoes;
    dbGrdClientes: TDBGrid;
    pnlDados: TPanel;
    Label1: TLabel;
    dbEdCodigo: TDBEdit;
    Label2: TLabel;
    dbEdDescricao: TDBEdit;
    Label3: TLabel;
    fdMemProdutosDescricao: TStringField;
    fdMemProdutosPrecoVenda: TCurrencyField;
    dbEdPrecoVenda: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure framBotoes1btIncluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure framBotoes1btGravarClick(Sender: TObject);
    procedure AbrirPesquisa;
    procedure framBotoes1btAlterarClick(Sender: TObject);
    procedure dbGrdClientesDblClick(Sender: TObject);
    procedure framBotoes1btCancelarClick(Sender: TObject);
    procedure dbGrdClientesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure framBotoes1btExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;
  sOperacao: String;
implementation
{$R *.dfm}

Uses unClasses;

procedure TfrmProdutos.AbrirPesquisa;
Var sProduto: TProduto;
begin
   sProduto := TProduto.Create();
   If Not fdMemProdutos.Active Then
      fdMemProdutos.Open;
   fdMemProdutos.EmptyDataSet;
   fdMemProdutos.CopyDataSet(sProduto.PesquisaTodosProdutos);
   fdMemProdutos.Open;
   sProduto.FechaConexao;
end;

procedure TfrmProdutos.dbGrdClientesDblClick(Sender: TObject);
begin
   framBotoes1btAlterarClick(Self);
end;

procedure TfrmProdutos.dbGrdClientesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var bAltera: Boolean;
begin
   bAltera := True;
   If (fdMemProdutos.State In [dsInsert, dsEdit]) Then Begin
      If Application.MessageBox('Existem dados ainda não gravados.  Deseja cancelar essa operação ?', 'Confirmação de Operação', mb_YesNo+Mb_IconQuestion+mb_DefButton2) = mrYes Then
         fdMemProdutos.Cancel
      Else
         bAltera := False;
   End;

   If bAltera Then Begin
      If (key = 13) Then
         framBotoes1btAlterarClick(Self)
      Else if (key = 46) then
         framBotoes1btExcluirClick(Self);
   End;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   frmProdutos := Nil;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
   Top := 0;
   Left := 0;
   pnlDados.Enabled := False;
   sOperacao := '';
   AbrirPesquisa;
end;

Procedure TfrmProdutos.FormKeyPress(Sender: TObject; var Key: Char);
Begin
   If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
   End;
End;

procedure TfrmProdutos.framBotoes1btAlterarClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   pnlDados.Enabled := True;
   dbEdCodigo.ReadOnly := True;
   dbEdDescricao.SetFocus;
   sOperacao := 'A';
   fdMemProdutos.Edit;
end;

procedure TfrmProdutos.framBotoes1btCancelarClick(Sender: TObject);
begin
  framBotoes1.btGravarClick(Sender);
  pnlDados.Enabled := False;
  fdMemProdutos.Cancel;
  sOperacao := '';
end;

procedure TfrmProdutos.framBotoes1btExcluirClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   If Application.MessageBox('Deseja realmente EXCLUIR o registro atual ?', 'Solicitação de Exclusão', mb_YesNO+Mb_IconQuestion+Mb_DefButton2) = mrYes  Then Begin
      sOperacao := 'E';
      framBotoes1btGravarClick(Self);
   End Else
      framBotoes1btCancelarClick(Self);
end;

procedure TfrmProdutos.framBotoes1btGravarClick(Sender: TObject);
Var sProduto: TProduto;
    sRetorno: String;
begin
   framBotoes1.btGravarClick(Sender);
   pnlDados.Enabled := False;
   sProduto := TProduto.Create();

   sProduto.Codigo     := fdMemProdutos.FieldByName('Codigo').AsInteger;
   sProduto.Descricao  := fdMemProdutos.FieldByName('Descricao').AsString;
   sProduto.PrecoVenda := fdMemProdutos.FieldByName('PrecoVenda').AsFloat;

   If sOperacao = 'I' Then
      sRetorno := sProduto.IncluirProduto(sProduto)
   Else If sOperacao = 'A' Then
      sRetorno := sProduto.AlterarProduto(sProduto)
   Else If sOperacao = 'E' Then
      sRetorno := sProduto.ExcluirProduto(sProduto);

   If sRetorno = '' Then Begin
      AbrirPesquisa;
      fdMemProdutos.Locate('Descricao', sProduto.Descricao, []);
   End Else
      Application.MessageBox(PChar('Ocorreu um erro ao gravar os dados.  Verifique.'+#13+
                             sRetorno), 'Erro ao Gravar Dados', mb_Ok+Mb_IconInformation);
   sOperacao := '';

   sProduto.FechaConexao;

end;

procedure TfrmProdutos.framBotoes1btIncluirClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   pnlDados.Enabled := True;
   dbEdDescricao.SetFocus;
   dbEdCodigo.ReadOnly := True;
   sOperacao := 'I';
   fdMemProdutos.Append;
end;

end.

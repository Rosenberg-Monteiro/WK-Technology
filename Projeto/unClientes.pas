unit unClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  unFramBotoes, Vcl.ExtCtrls, unClaClientes;

type
  TfrmClientes = class(TForm)
    fdMemClientes: TFDMemTable;
    fdMemClientesCodigo: TIntegerField;
    fdMemClientesNome: TStringField;
    fdMemClientesCidade: TStringField;
    fdMemClientesUF: TStringField;
    dsClientes: TDataSource;
    Panel1: TPanel;
    framBotoes1: TframBotoes;
    dbGrdClientes: TDBGrid;
    pnlDados: TPanel;
    Label1: TLabel;
    dbEdCodigo: TDBEdit;
    Label2: TLabel;
    dbEdNome: TDBEdit;
    Label3: TLabel;
    dbEdCidade: TDBEdit;
    Label4: TLabel;
    dbEdUF: TDBEdit;
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
  frmClientes: TfrmClientes;
  sOperacao: String;
implementation
{$R *.dfm}

Uses unClasses;

procedure TfrmClientes.AbrirPesquisa;
Var sCliente: TCliente;
begin
   sCliente := TCliente.Create();
   If Not fdMemClientes.Active Then
      fdMemClientes.Open;
   fdMemClientes.EmptyDataSet;
   fdMemClientes.CopyDataSet(sCliente.PesquisaTodosCliente);
   fdMemClientes.Open;
   sCliente.FechaConexao;
end;

procedure TfrmClientes.dbGrdClientesDblClick(Sender: TObject);
begin
   framBotoes1btAlterarClick(Self);
end;

procedure TfrmClientes.dbGrdClientesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var bAltera: Boolean;
begin
   bAltera := True;
   If (fdMemClientes.State In [dsInsert, dsEdit]) Then Begin
      If Application.MessageBox('Existem dados ainda não gravados.  Deseja cancelar essa operação ?', 'Confirmação de Operação', mb_YesNo+Mb_IconQuestion+mb_DefButton2) = mrYes Then
         fdMemClientes.Cancel
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

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   frmClientes := Nil;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
   Top := 0;
   Left := 0;
   pnlDados.Enabled := False;
   sOperacao := '';
   AbrirPesquisa;
end;

Procedure TfrmClientes.FormKeyPress(Sender: TObject; var Key: Char);
Begin
   If Key = #13 Then Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
   End;
End;

procedure TfrmClientes.framBotoes1btAlterarClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   pnlDados.Enabled := True;
   dbEdCodigo.ReadOnly := True;
   dbEdNome.SetFocus;
   sOperacao := 'A';
   fdMemClientes.Edit;
end;

procedure TfrmClientes.framBotoes1btCancelarClick(Sender: TObject);
begin
  framBotoes1.btGravarClick(Sender);
  pnlDados.Enabled := False;
  fdMemClientes.Cancel;
  sOperacao := '';
end;

procedure TfrmClientes.framBotoes1btExcluirClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   If Application.MessageBox('Deseja realmente EXCLUIR o registro atual ?', 'Solicitação de Exclusão', mb_YesNO+Mb_IconQuestion+Mb_DefButton2) = mrYes  Then Begin
      sOperacao := 'E';
      framBotoes1btGravarClick(Self);
   End Else
      framBotoes1btCancelarClick(Self);
end;

procedure TfrmClientes.framBotoes1btGravarClick(Sender: TObject);
Var sCliente: TCliente;
    sRetorno: String;
begin
   framBotoes1.btGravarClick(Sender);
   pnlDados.Enabled := False;
   sCliente := TCliente.Create();

   sCliente.Codigo := fdMemClientes.FieldByName('Codigo').AsInteger;
   sCliente.Nome   := fdMemClientes.FieldByName('Nome').AsString;
   sCliente.Cidade := fdMemClientes.FieldByName('Cidade').AsString;
   sCliente.UF     := fdMemClientes.FieldByName('UF').AsString;

   If sOperacao = 'I' Then
      sRetorno := sCliente.IncluirCliente(sCliente)
   Else If sOperacao = 'A' Then
      sRetorno := sCliente.AlterarCliente(sCliente)
   Else If sOperacao = 'E' Then
      sRetorno := sCliente.ExcluirCliente(sCliente);

   If sRetorno = '' Then Begin
      AbrirPesquisa;
      fdMemClientes.Locate('Nome', sCliente.Nome, []);
   End Else
      Application.MessageBox(PChar('Ocorreu um erro ao gravar os dados.  Verifique.'+#13+
                             sRetorno), 'Erro ao Gravar Dados', mb_Ok+Mb_IconInformation);
   sOperacao := '';

   sCliente.FechaConexao;

end;

procedure TfrmClientes.framBotoes1btIncluirClick(Sender: TObject);
begin
   framBotoes1.btIncluirClick(Sender);
   pnlDados.Enabled := True;
   dbEdNome.SetFocus;
   dbEdCodigo.ReadOnly := True;
   sOperacao := 'I';
   fdMemClientes.Append;
end;

end.

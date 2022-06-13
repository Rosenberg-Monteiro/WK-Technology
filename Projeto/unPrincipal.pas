unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastros: TMenuItem;
    mnuClientes: TMenuItem;
    mnuProdutos: TMenuItem;
    N1: TMenuItem;
    mnuPedidos: TMenuItem;
    mnuSair: TMenuItem;
    procedure mnuClientesClick(Sender: TObject);
    procedure mnuProdutosClick(Sender: TObject);
    procedure mnuSairClick(Sender: TObject);
    procedure mnuPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
Uses unClientes, unProdutos, unPedidos;

{$R *.dfm}

procedure TfrmPrincipal.mnuClientesClick(Sender: TObject);
begin
   If FrmClientes = Nil Then Begin
      Application.CreateForm(TfrmClientes, frmclientes);
      frmClientes.Show;
   End;
end;

procedure TfrmPrincipal.mnuPedidosClick(Sender: TObject);
begin
   If FrmPedidos = Nil Then Begin
      Application.CreateForm(TfrmPedidos, frmPedidos);
      FrmPedidos.Show;
   End;
end;

procedure TfrmPrincipal.mnuProdutosClick(Sender: TObject);
begin
   If FrmProdutos = Nil Then Begin
      Application.CreateForm(TfrmProdutos, frmProdutos);
      FrmProdutos.Show;
   End;
end;

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

end.

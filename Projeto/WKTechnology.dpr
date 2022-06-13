program WKTechnology;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unDataModule in 'unDataModule.pas' {DataModule1: TDataModule},
  unClientes in 'unClientes.pas' {frmClientes},
  unFramBotoes in 'unFramBotoes.pas' {framBotoes: TFrame},
  unClaClientes in 'unClaClientes.pas',
  unProdutos in 'unProdutos.pas' {frmProdutos},
  unClaProdutos in 'unClaProdutos.pas',
  unPedidos in 'unPedidos.pas' {frmPedidos},
  unClaPedidos in 'unClaPedidos.pas',
  unClaPedidosProdutos in 'unClaPedidosProdutos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.

unit unFramBotoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  TframBotoes = class(TFrame)
    btIncluir: TSpeedButton;
    btAlterar: TSpeedButton;
    btExcluir: TSpeedButton;
    btGravar: TSpeedButton;
    btCancelar: TSpeedButton;
    procedure btIncluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    procedure HabilitarBotoes(aGrupoBotoes: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TframBotoes.btGravarClick(Sender: TObject);
begin
   HabilitarBotoes(2);
end;

procedure TframBotoes.btIncluirClick(Sender: TObject);
begin
   HabilitarBotoes(1);
end;

Procedure TframBotoes.HabilitarBotoes(aGrupoBotoes: integer);
Begin

   If aGrupoBotoes = 1 Then Begin
      btIncluir.Enabled  := False;
      btAlterar.Enabled  := False;
      btExcluir.Enabled  := False;
      btGravar.Enabled   := True;
      btCancelar.Enabled := True;
   End Else if aGrupoBotoes = 2 Then Begin
      btIncluir.Enabled  := True;
      btAlterar.Enabled  := True;
      btExcluir.Enabled  := True;
      btGravar.Enabled   := False;
      btCancelar.Enabled := false;
   End;
End;

end.

object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'WK Technology - Teste'
  ClientHeight = 344
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 8
    Top = 240
    object mnuCadastros: TMenuItem
      Caption = 'Cadastros'
      object mnuClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mnuClientesClick
      end
      object mnuProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = mnuProdutosClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuPedidos: TMenuItem
        Caption = 'Pedidos'
        OnClick = mnuPedidosClick
      end
    end
    object mnuSair: TMenuItem
      Caption = 'Sair'
      OnClick = mnuSairClick
    end
  end
end

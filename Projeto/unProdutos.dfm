object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Produtos'
  ClientHeight = 351
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 39
    Align = alTop
    TabOrder = 0
    inline framBotoes1: TframBotoes
      Left = 1
      Top = 1
      Width = 203
      Height = 37
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 37
      inherited btIncluir: TSpeedButton
        OnClick = framBotoes1btIncluirClick
      end
      inherited btAlterar: TSpeedButton
        OnClick = framBotoes1btAlterarClick
      end
      inherited btExcluir: TSpeedButton
        Left = 79
        OnClick = framBotoes1btExcluirClick
        ExplicitLeft = 79
      end
      inherited btGravar: TSpeedButton
        OnClick = framBotoes1btGravarClick
      end
      inherited btCancelar: TSpeedButton
        OnClick = framBotoes1btCancelarClick
      end
    end
  end
  object dbGrdClientes: TDBGrid
    Left = 0
    Top = 136
    Width = 463
    Height = 215
    Align = alBottom
    DataSource = dsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbGrdClientesDblClick
    OnKeyUp = dbGrdClientesKeyUp
  end
  object pnlDados: TPanel
    Left = 0
    Top = 39
    Width = 463
    Height = 97
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 121
    object Label1: TLabel
      Left = 50
      Top = 9
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 37
      Top = 36
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object Label3: TLabel
      Left = 8
      Top = 63
      Width = 79
      Height = 13
      Caption = 'Pre'#231'o de Venda:'
    end
    object dbEdCodigo: TDBEdit
      Left = 89
      Top = 6
      Width = 46
      Height = 21
      DataField = 'Codigo'
      DataSource = dsProdutos
      TabOrder = 0
    end
    object dbEdDescricao: TDBEdit
      Left = 89
      Top = 33
      Width = 361
      Height = 21
      DataField = 'Descricao'
      DataSource = dsProdutos
      TabOrder = 1
    end
    object dbEdPrecoVenda: TDBEdit
      Left = 89
      Top = 60
      Width = 121
      Height = 21
      DataField = 'PrecoVenda'
      DataSource = dsProdutos
      TabOrder = 2
    end
  end
  object fdMemProdutos: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 112
    Top = 192
    object fdMemProdutosCodigo: TIntegerField
      DisplayWidth = 6
      FieldName = 'Codigo'
    end
    object fdMemProdutosDescricao: TStringField
      DisplayWidth = 51
      FieldName = 'Descricao'
      Size = 80
    end
    object fdMemProdutosPrecoVenda: TCurrencyField
      DisplayLabel = 'Preco de Venda'
      DisplayWidth = 11
      FieldName = 'PrecoVenda'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
      currency = False
    end
  end
  object dsProdutos: TDataSource
    DataSet = fdMemProdutos
    Left = 144
    Top = 192
  end
end

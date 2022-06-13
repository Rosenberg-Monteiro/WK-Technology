object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Clientes'
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
    ExplicitWidth = 446
    inline framBotoes1: TframBotoes
      Left = 1
      Top = 1
      Width = 203
      Height = 37
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 241
      ExplicitTop = 2
      inherited btIncluir: TSpeedButton
        OnClick = framBotoes1btIncluirClick
      end
      inherited btAlterar: TSpeedButton
        OnClick = framBotoes1btAlterarClick
      end
      inherited btExcluir: TSpeedButton
        OnClick = framBotoes1btExcluirClick
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
    Top = 160
    Width = 463
    Height = 191
    Align = alBottom
    DataSource = dsClientes
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
    Height = 121
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 122
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 14
      Top = 36
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label3: TLabel
      Left = 8
      Top = 63
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object Label4: TLabel
      Left = 28
      Top = 90
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object dbEdCodigo: TDBEdit
      Left = 51
      Top = 6
      Width = 46
      Height = 21
      DataField = 'Codigo'
      DataSource = dsClientes
      TabOrder = 0
    end
    object dbEdNome: TDBEdit
      Left = 51
      Top = 33
      Width = 380
      Height = 21
      DataField = 'Nome'
      DataSource = dsClientes
      TabOrder = 1
    end
    object dbEdCidade: TDBEdit
      Left = 51
      Top = 60
      Width = 289
      Height = 21
      DataField = 'Cidade'
      DataSource = dsClientes
      TabOrder = 2
    end
    object dbEdUF: TDBEdit
      Left = 51
      Top = 87
      Width = 46
      Height = 21
      CharCase = ecUpperCase
      DataField = 'UF'
      DataSource = dsClientes
      TabOrder = 3
    end
  end
  object fdMemClientes: TFDMemTable
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
    object fdMemClientesCodigo: TIntegerField
      DisplayWidth = 6
      FieldName = 'Codigo'
    end
    object fdMemClientesNome: TStringField
      DisplayWidth = 31
      FieldName = 'Nome'
      Size = 80
    end
    object fdMemClientesCidade: TStringField
      DisplayWidth = 28
      FieldName = 'Cidade'
      Size = 45
    end
    object fdMemClientesUF: TStringField
      DisplayWidth = 2
      FieldName = 'UF'
      Size = 2
    end
  end
  object dsClientes: TDataSource
    DataSet = fdMemClientes
    Left = 144
    Top = 192
  end
end

object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedidos'
  ClientHeight = 450
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPedidos: TPageControl
    Left = 0
    Top = 0
    Width = 596
    Height = 450
    ActivePage = tabPedidosLancados
    Align = alClient
    TabOrder = 0
    object tabPedidosLancados: TTabSheet
      Caption = 'Pedidos Lan'#231'ados'
      object dbGrdPedidos: TDBGrid
        Left = 0
        Top = 33
        Width = 588
        Height = 389
        Align = alClient
        DataSource = dsPedidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbGrdPedidosCellClick
        OnDblClick = btAbrirPedidoClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 588
        Height = 33
        Align = alTop
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 2
          Width = 89
          Height = 25
          Cursor = crHandPoint
          Caption = 'Novo Pedido'
          OnClick = SpeedButton1Click
        end
        object btAbrirPedido: TSpeedButton
          Left = 95
          Top = 2
          Width = 89
          Height = 25
          Cursor = crHandPoint
          Caption = 'Abrir Pedido'
          OnClick = btAbrirPedidoClick
        end
      end
    end
    object tabPedido: TTabSheet
      Caption = 'Dados do Pedido'
      ImageIndex = 1
      object pnlDadosPedido: TPanel
        Left = 0
        Top = 41
        Width = 588
        Height = 64
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 22
          Top = 13
          Width = 51
          Height = 13
          Caption = 'N'#186' Pedido:'
        end
        object Label2: TLabel
          Left = 248
          Top = 13
          Width = 83
          Height = 13
          Caption = 'Data da Emiss'#227'o:'
        end
        object Label3: TLabel
          Left = 36
          Top = 40
          Width = 37
          Height = 13
          Caption = 'Cliente:'
        end
        object DBEdit1: TDBEdit
          Left = 79
          Top = 10
          Width = 40
          Height = 21
          DataField = 'NumeroPedido'
          DataSource = dsPedidos
          TabOrder = 0
        end
        object dbEdDataEmissao: TDBEdit
          Left = 337
          Top = 10
          Width = 72
          Height = 21
          DataField = 'DataEmissao'
          DataSource = dsPedidos
          MaxLength = 10
          TabOrder = 1
          OnKeyUp = dbEdDataEmissaoKeyUp
        end
        object dbEdCodigoCliente: TDBEdit
          Left = 79
          Top = 37
          Width = 40
          Height = 21
          DataField = 'CodigoCliente'
          DataSource = dsPedidos
          TabOrder = 2
          OnExit = dbEdCodigoClienteExit
        end
        object dbEdNomeClente: TDBEdit
          Left = 122
          Top = 37
          Width = 287
          Height = 21
          DataField = 'Nome'
          DataSource = dsPedidos
          ReadOnly = True
          TabOrder = 3
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 397
        Width = 588
        Height = 25
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object Label4: TLabel
          Left = 282
          Top = 1
          Width = 183
          Height = 23
          Align = alRight
          Caption = 'Valor Total do Pedido:'
          ExplicitLeft = 194
          ExplicitTop = 4
          ExplicitHeight = 19
        end
        object dbTxtVaalorTotal: TDBText
          Left = 465
          Top = 1
          Width = 122
          Height = 23
          Align = alRight
          Alignment = taRightJustify
          DataField = 'ValorTotal'
          DataSource = dsPedidos
          ExplicitLeft = 383
          ExplicitTop = 4
          ExplicitHeight = 17
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 588
        Height = 41
        Align = alTop
        TabOrder = 2
        inline framBotoes1: TframBotoes
          Left = 0
          Top = 2
          Width = 203
          Height = 39
          TabOrder = 0
          ExplicitTop = 2
          inherited btGravar: TSpeedButton
            OnClick = framBotoes1btGravarClick
          end
        end
      end
      object pnlDadosProdutos: TPanel
        Left = 0
        Top = 105
        Width = 588
        Height = 64
        Align = alTop
        TabOrder = 3
        object Label5: TLabel
          Left = 36
          Top = 9
          Width = 42
          Height = 13
          Caption = 'Produto:'
        end
        object Label6: TLabel
          Left = 2
          Top = 36
          Width = 71
          Height = 13
          Caption = 'Pre'#231'o Unit'#225'rio:'
        end
        object Label7: TLabel
          Left = 166
          Top = 36
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
        end
        object Label8: TLabel
          Left = 273
          Top = 36
          Width = 55
          Height = 13
          Caption = 'Valor Total:'
        end
        object btnNovoPedidoProduto: TSpeedButton
          Left = 497
          Top = 14
          Width = 33
          Height = 33
          Cursor = crHandPoint
          Hint = 'Incluir Produto no Pedido'
          Glyph.Data = {
            66090000424D660900000000000036000000280000001C0000001C0000000100
            18000000000030090000000000000000000000000000000000007139197D421B
            7B411A7B411B7B411B7B411B7B411B7B411B7B411B7B411B7B411B7B411B7B41
            1B7B411B7B411B7B411B7B411B7B411B7B411B7B411B7B411B7B411B7B411B7B
            411B7B411B7B411B7B3F187C4A327E431A803D167F3C157F3C157F3C157F3C15
            7F3C157F3C157F3C157F3C157F3C157F3C157F3C157F3C157F3C157F3C157F3C
            157F3C157F3C157F3C157F3C157F3C157F3C157F3C157F3C157F3C15803E1585
            51367C421B803D17803D17803D17803D17803D17803D17803D17803D17803D17
            803D17803D17803D17803D17803D17803D17803D17803D17803D17803D17803D
            17803D17803D17803D17803D177F3D17803C158551367D431B803E19803F1980
            3F19803F19803F19803F19803F19803F19803F19803F19803F19803F19803F19
            803F19803F19803F19803F19803F19803F19803F19803F19803F19803F19803F
            19803E19803E178551367D431C813F1A813F1A813F1A813F1A813F1A813F1A81
            3F1A813F1A813F1A813F1A813F1A813F1A813F1A813F1A813F1A813F1A813F1A
            813F1A813F1A813F1A813F1A813F1A813F1A813F1A803F1A813E188552377D44
            1C813F1B80401B80401B80401B80401B80401B80401B803E1A7A36107F3D1880
            401B80401B80401B80401B80401B80401B7F3E197A350F7F3E1980401B80401B
            80401B80401B80401B80401B813F198553367D441D82401C82411C82411C8241
            1C82411C82411C813F1B7E3D17C1A18F7E3C177B371182411C82411C82411C82
            411C7C38117C3712C8AC9B82431F803E1A82411C82411C82411C82411C81401C
            82401A8651377D451E82411D81411D81411D81411D81411D81411D7C3913B088
            72FFFFFFFFFFFFA06F54732B0381401C81411D732C049B684BFFFFFFFFFFFFBF
            9F8D7B371181411D81411D81411D81411D81411D82411C8652387E451E83411F
            83421F83421F83421F83421F83421F803E1A8B4F2EFFFFFFFFFFFFFFFFFFD1B8
            AB742B03722902CCB2A3FFFFFFFFFFFFFFFFFF8F5435803D1983421F83421F83
            421F83421F82421F83411D8653377E451F834220824320824320824320824320
            824320824320732B03F4EFECFFFFFFFFFFFFFFFFFFEFE7E3EBE1DCFFFFFFFFFF
            FFFFFFFFF8F6F4732B0582422082432082432082432082432082422083421E86
            53377E461F8443218443218443218443218443218443218443217B3713BF9F8D
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6A99A7A36108443
            218443218443218443218443218343218543208653387E462084442384442284
            442284442284442284442284442281401E894D2DFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF8E553781401D8444228444228444228444228444
            228344228543218653387F472185452485452485452484452484442483442483
            442478320E8F5536FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            945C3F77310C8344248444248445248545248545248445248645238753397E46
            218444268142257F41258142268647268C4B24853B07C2A18EFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5A796843907884823
            8344267F41258142258344258545258754397D452298592AA3612BAB692BB06D
            2CAD6926A96420F6EDE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F2E9AC6725AD6925AD6B2CA3632B9B5A29
            9050288653397C4423AA672DAD6A2CAB692CA96729AE6E34FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFAD6D33AA6729AC6A2CAD6B2CA7652B8451397C4524A8652D
            AB692DAA682DA9672AAB6A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE6F37A9
            662AAA682DAB692DA5632B84523A7C4525A9662DAC6A2CAB692CAC692DAA682A
            A35A15A25915A25915A25915A0550FB3773FFFFFFFFFFFFFFFFFFFFFFFFFB77E
            48A0540FA25915A25915A25915A25814AA6729AC692DAB692CAC6A2CA6642C84
            523A7D4526AA682DAD6B2CAC6A2CAC6A2CAC6A2CAC6A2DAC6A2CAC6A2CAC6A2C
            AC6A2CA35A16FDFCFAFFFFFFFFFFFFFFFFFFA45B18AB6A2CAC6A2CAC6A2CAC6A
            2CAC6A2DAC6A2CAC6A2CAC6A2CAD6B2CA6652D85533B7D4627AC6A2FB06E2EAF
            6D2EAF6D2EAF6D2EAF6D2EAF6D2EAF6D2EAF6D2EAF6D2EA8611CDEC3AAFFFFFF
            FFFFFFE2CBB4A85F1BAF6D2EAF6D2EAF6D2EAF6D2EAF6D2EAF6D2EAF6D2EAF6D
            2EB06E2EA9672F85533B7C4727AE6D30B2712FB1702FB1702FB1702FB1702FB1
            702FB1702FB1702FB1702FAF6C29BE8952FFFFFFFFFFFFC28E5CAE6B29B1702F
            B1702FB1702FB1702FB1702FB1702FB1702FB1702FB2712FAB6A3084533C7C46
            29B37332B77631B67531B67531B67531B67531B67531B67531B67531B67531B5
            7530AD6519FFFFFFFFFFFFAE681DB57530B67531B67531B67531B67531B67531
            B67531B67531B67531B77631AF6E3285533C7C4629B87934BC7C33BB7C33BB7C
            33BB7C33BB7C33BB7C33BB7C33BB7C33BB7C33BB7C33BA792FBC7F39BD813CB9
            782FBB7C33BB7C33BB7C33BB7C33BB7C33BB7C33BB7C33BB7C33BB7C33BC7D33
            B2743485533C7C4529BF8139C48537C28437C28437C28437C28437C28437C284
            37C28437C28437C28437C28437C28234C28234C28437C28437C28437C28437C2
            8437C28437C28437C28437C28437C28437C48637B87A3684523C7B462AC78A3D
            CD903CCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F
            3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB8F3BCB
            8F3BCB8F3BCD913BC0843B83513C7B442BD69B41DDA341DBA141DBA141DBA141
            DBA141DBA141DBA141DBA141DBA141DBA141DBA141DBA141DBA141DBA141DBA1
            41DBA141DBA141DBA141DBA141DBA141DBA141DBA141DBA141DEA341CD924182
            513C7D462AC38947CC9345CB9145CB9145CB9145CB9145CB9145CB9145CB9145
            CB9145CB9145CB9145CB9145CB9145CB9145CB9145CB9145CB9145CB9145CB91
            45CB9145CB9145CB9145CB9145CC9345BE844584523A81533C85533D82513E82
            513E82513E82513E82513E82513E82513E82513E82513E82513E82513E82513E
            82513E82513E82513E82513E82513E82513E82513E82513E82513E82513E8251
            3E82513E84523B8B634E}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnNovoPedidoProdutoClick
        end
        object mnuGravarPedidoProdto: TSpeedButton
          Left = 536
          Top = 14
          Width = 33
          Height = 33
          Cursor = crHandPoint
          Glyph.Data = {
            66090000424D660900000000000036000000280000001C0000001C0000000100
            18000000000030090000000000000000000000000000000000006C3012824526
            7F43237F43237F43237F43237F43237F43237F43237F43237F43237F43237F43
            237F43237F43237F43237F43237F43237F43237F43237F43237F43237F43237F
            43237F43237F432380442475402A7E441B7D39127D39127D39127D39127D3912
            7D39127D39127D39127D39127D39127D39127D39127D39127D39127D39127D39
            127D39127D39127D39127D39127D39127D39127D39127D39127D39127D391187
            52377C421B803E18803E18803E18803E18803E18803E18803E18803E18803E18
            803E18803E18803E18803E18803E18803E18803E18803E18803E18803E18803E
            18803E18803E18803E18803E18803E18803D168551367D431C803E18803E1980
            3E19803E19803E19803E19803E19803E19803E19803E19803E19803E19803E19
            803E19803E19803E19803E19803E19803E19803E19803E19803E19803E19803E
            19803E19803E178551377D431C813F1A813F1A813F1A813F1A813F1A813F1A81
            3F1A813F1A813F1A813F1A813F1A803F1979340D7C3711813F1A813F1A813F1A
            813F1A813F1A813F1A813F1A813F1A813F1A813F1A803F1A813E188552377D43
            1C813F1B81401B81401B81401B81401B81401B81401B81401B81401B81401B80
            3F1A742D06C1A190A87B62742C0481401B81401B81401B81401B81401B81401B
            81401B81401B81401B803F1B813F198552377D441D82401C82411C82411C8241
            1C82411C82411C82411C82411C82411C81401C722800E5D8D1FFFFFFFFFFFFC7
            AA9A732A0282411D82411C82411C82411C82411C82411C82411C82411C81401C
            82401B8651387D451D82411D82411D82411D82411D82411D82411D82411D8241
            1D82411E732A02C6A899FFFFFFFFFFFFFFFFFFFFFFFFA77A6078340D82411D82
            411D82411D82411D82411D82411D82411D82411D83401C8652377E451F83421F
            83421F83421F83421F83421F83421F83421F83421F7A340FA5755DFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF8A4B2C7F3C1783421F83421F83421F83421F83
            421F83421F82421E83411D8653377E451F834220824220824220824220824220
            8242208242207F3D19884B2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF77320C81411D82422082422082422082422082422082421F83421E86
            53387E461F84432183432183432183432183432183432182421F7B3511FEFEFE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEADED8752E088343
            218343218343218343218343218343218443208653377E462084442384442284
            44228444228444228444227C3714C7AB9BFFFFFFFFFFFFFAF8F7C7AB9CFFFFFF
            FFFFFFA4775DFFFFFFFFFFFFFFFFFFAA7F687F3C198444228444228444228444
            228444228544218653387F462185452585452485452484452484442484442479
            3513D4BFB6FFFFFFFFFFFF814224C3A596FFFFFFFFFFFF8C5136A0725CFFFFFF
            FFFFFFB894837D3A198444248444248545248545248445248544238753397F47
            218444268243268142258244268748268B4B27904F26975527D0AB88A5663396
            4C10D7BAA2FFFFFFFFFFFFB37C4E974D13B27C4CCBA4808F4B1D8E4E26884927
            8445268142258243268344268545258754397D452297572AA2602AA8672BAD6A
            2CAF6C2CAE6C2CAD6B2CAB692AA66122A96628A55E1CDABDA2FFFFFFFFFFFFB9
            814FA96526A86526A76222AC6A2BAE6B2CAE6C2CAE6C2CAA682BA2612A995929
            8E4E278753397C4423AA672DAD6A2CAB692CAB692CAA692CAB692CAB682CAB69
            2CAB692CAB692CA55D1CD9BCA2FFFFFFFFFFFFB9804EA86426AB692CAB692CAB
            692CAA692CAB692CAB692CAB692CAC6A2CAE6C2CA7662B8451397C4524A8652E
            AB692DAA682DAA682DAA682DAA682DAA682DAA682DAA682DAA692DA55D1DD9BC
            A2FFFFFFFFFFFFB9804EA86427AA682DAA682DAA682DAA682DAA682DAA682DAA
            682DAA682DAB692DA5632B85523A7C4525A9662DAC6A2CAC6A2CAC6A2CAC6A2C
            AC6A2CAC6A2CAC6A2CAC6A2CAC6A2DA65E1DDBBEA2FFFFFFFFFFFFB9814EA965
            26AC6A2CAC6A2CAC6A2CAC6A2CAC6A2CAC6A2CAC6A2CAC6A2CAD6A2CA6642C84
            523A7D4526AA672DAC6A2DAC6A2DAC6A2DAC6A2DAC6A2DAC6A2DAC6A2DAC6A2D
            AC6A2DA65E1DDABDA2FFFFFFFFFFFFB9824EA96527AC6A2DAC6A2DAC6A2DAC6A
            2DAC6A2DAC6A2DAC6A2DAC6A2DAD6B2CA6642D85533B7D4627AC6A2FAF6E2EAE
            6D2EAE6D2EAE6D2EAE6D2EAE6D2EAE6D2EAE6D2EAE6D2EA9621EDCBFA4FFFFFF
            FFFFFFBB8651AC6928AE6D2EAE6D2EAE6D2EAE6D2EAE6D2EAE6D2EAE6D2EAE6D
            2EAF6E2EA8682E85533B7C4628AE6D30B2702FB1702FB1702FB1702FB1702FB1
            702FB1702FB1702FB1702FAC6722DBBEA1FFFFFFFFFFFFBC834BAF6C2AB1702F
            B1702FB1702FB1702FB1702FB1702FB1702FB1702FB2712FAA693085533C7C46
            29B27231B67530B57530B57530B57530B57530B57530B57530B57530B57530B4
            732FB4722DEDDFCEDCBF9FAF6920B57530B57530B57530B57530B57530B57530
            B57530B57530B57530B67630AE6E3184533C7D4629B77834BB7C33BA7B33BA7B
            33BA7B33BA7B33BA7B33BA7B33BA7B33BA7B33BA7B33BA7931B36E20B57124BA
            7B33BA7B33BA7B33BA7B33BA7B33BA7B33BA7B33BA7B33BA7B33BA7B33BC7C33
            B2733485533C7C4629BD7F38C28336C18236C18236C18236C18236C18236C182
            36C18236C18236C18236C18236C18336C18236C18236C18236C18236C18236C1
            8236C18236C18236C18236C18236C18236C28436B87A3684523C7B452AC6893C
            CB8F3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D
            3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA8D3BCA
            8D3BCA8D3BCC8F3BBF833A83513C7B442BD39841DA9F41D89E40D89E40D89E40
            D89E40D89E40D89E40D89E40D89E40D89E40D89E40D89E40D89E40D89E40D89E
            40D89E40D89E40D89E40D89E40D89E40D89E40D89E40D89E40DBA041CB8F4082
            513C7D472CCE9444DAA044D89F43D89F43D89F43D89F43D89F43D89F43D89F43
            D89F43D89F43D89F43D89F43D89F43D89F43D89F43D89F43D89F43D89F43D89F
            43D89F43D89F43D89F43D89F43DAA143C68C4385543E733B22814A397D47377D
            47377D47377D47377D47377D47377D47377D47377D47377D47377D47377D4737
            7D47377D47377D47377D47377D47377D47377D47377D47377D47377D47377D47
            377D4737814A377C4A34}
          ParentShowHint = False
          ShowHint = True
          OnClick = mnuGravarPedidoProdtoClick
        end
        object dbEdProduto: TDBEdit
          Left = 79
          Top = 6
          Width = 40
          Height = 21
          DataField = 'CodigoProduto'
          DataSource = dsPedidosProdutos
          TabOrder = 0
          OnExit = dbEdProdutoExit
        end
        object dbEdDescricao: TDBEdit
          Left = 122
          Top = 6
          Width = 287
          Height = 21
          TabStop = False
          DataField = 'Descricao'
          DataSource = dsPedidosProdutos
          ReadOnly = True
          TabOrder = 1
        end
        object dbEdValorUnitario: TDBEdit
          Left = 79
          Top = 33
          Width = 78
          Height = 21
          DataField = 'ValorUnitario'
          DataSource = dsPedidosProdutos
          TabOrder = 2
        end
        object dbEdQuantidade: TDBEdit
          Left = 227
          Top = 33
          Width = 40
          Height = 21
          DataField = 'Quantidade'
          DataSource = dsPedidosProdutos
          TabOrder = 3
          OnExit = dbEdCodigoClienteExit
        end
        object dbEdValorTotal: TDBEdit
          Left = 331
          Top = 33
          Width = 78
          Height = 21
          TabStop = False
          DataField = 'ValorTotal'
          DataSource = dsPedidosProdutos
          ReadOnly = True
          TabOrder = 4
        end
      end
      object dbGrdPedidosProdutos: TDBGrid
        Left = 0
        Top = 169
        Width = 588
        Height = 228
        Align = alClient
        DataSource = dsPedidosProdutos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbGrdPedidosProdutosDblClick
        OnKeyUp = dbGrdPedidosProdutosKeyUp
      end
    end
  end
  object dsPedidos: TDataSource
    DataSet = fdMemPedidos
    Left = 68
    Top = 296
  end
  object fdMemPedidosProdutos: TFDMemTable
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
    Left = 100
    Top = 296
    object fdMemPedidosProdutosidPedidosProdutos: TIntegerField
      DisplayLabel = 'Seq.'
      DisplayWidth = 3
      FieldName = 'idPedidosProdutos'
    end
    object fdMemPedidosProdutosNumeroPedido: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      DisplayWidth = 7
      FieldName = 'NumeroPedido'
    end
    object fdMemPedidosProdutosCodigoProduto: TIntegerField
      DisplayLabel = 'Produto'
      DisplayWidth = 7
      FieldName = 'CodigoProduto'
    end
    object fdMemPedidosProdutosDescricao: TStringField
      DisplayWidth = 37
      FieldName = 'Descricao'
      Size = 80
    end
    object fdMemPedidosProdutosQuantidade: TFloatField
      DisplayWidth = 10
      FieldName = 'Quantidade'
      DisplayFormat = '###,###,##0.##'
      EditFormat = '0.00'
    end
    object fdMemPedidosProdutosValorUnitario: TFloatField
      DisplayLabel = 'Vl. Unitario'
      DisplayWidth = 10
      FieldName = 'ValorUnitario'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object fdMemPedidosProdutosValorTotal: TFloatField
      DisplayLabel = 'Vl. Total'
      DisplayWidth = 10
      FieldName = 'ValorTotal'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
  end
  object dsPedidosProdutos: TDataSource
    DataSet = fdMemPedidosProdutos
    Left = 129
    Top = 296
  end
  object fdMemPedidos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'NumeroPedido'
        DataType = ftInteger
      end
      item
        Name = 'DataEmissao'
        DataType = ftDateTime
      end
      item
        Name = 'CodigoCliente'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'ValorTotal'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 39
    Top = 296
    object fdMemPedidosNumeroPedido: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      DisplayWidth = 8
      FieldName = 'NumeroPedido'
    end
    object fdMemPedidosDataEmissao: TDateTimeField
      DisplayLabel = 'Dt.Emiss'#227'o'
      DisplayWidth = 11
      FieldName = 'DataEmissao'
    end
    object fdMemPedidosCodigoCliente: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'CodigoCliente'
    end
    object fdMemPedidosNome: TStringField
      DisplayLabel = 'Nome do Cliente'
      DisplayWidth = 53
      FieldName = 'Nome'
      Size = 80
    end
    object fdMemPedidosValorTotal: TFloatField
      DisplayLabel = 'Vl. Total'
      DisplayWidth = 10
      FieldName = 'ValorTotal'
      DisplayFormat = '###,###,##0.00'
    end
  end
end

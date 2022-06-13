object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 387
  Width = 577
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Server=127.0.0.1'
      'User_Name=root'
      'Database=WK'
      'Password=Mich2307')
    LoginPrompt = False
    BeforeDisconnect = FDConnectionBeforeDisconnect
    Left = 40
    Top = 24
  end
  object fdQryPesquisa1: TFDQuery
    Connection = FDConnection
    Left = 72
    Top = 24
  end
end

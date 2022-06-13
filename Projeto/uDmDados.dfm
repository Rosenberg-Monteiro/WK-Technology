object dmDados: TdmDados
  OldCreateOrder = False
  Height = 309
  Width = 523
  object fdConexaoBD: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=nutrindo'
      'User_Name=root'
      'Password=Mich2307'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'libmysql.dll'
    Left = 64
    Top = 16
  end
  object fdQryPesquisa: TFDQuery
    Connection = fdConexaoBD
    Left = 96
    Top = 16
  end
end

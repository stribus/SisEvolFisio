object dmDados: TdmDados
  OldCreateOrder = False
  Height = 689
  Width = 1056
  object con1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'CharacterSet=WIN1252'
      'Database=C:\projetos\Carime\dados.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DropDatabase=No')
    Connected = True
    LoginPrompt = False
    BeforeConnect = con1BeforeConnect
    Left = 56
    Top = 40
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 48
    Top = 128
  end
  object FDGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog
    Provider = 'Forms'
    Left = 40
    Top = 200
  end
end

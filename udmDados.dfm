object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 689
  Width = 1056
  object con1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'CharacterSet=WIN1252'
      'Database=D:\projetos\SisEvolFisio\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DropDatabase=No')
    LoginPrompt = False
    BeforeConnect = con1BeforeConnect
    Left = 56
    Top = 40
  end
  object fdqCons: TFDQuery
    Connection = con1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateChangedFields = False
    Left = 112
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 104
  end
end

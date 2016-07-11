object frmPaciente: TfrmPaciente
  Left = 0
  Top = 0
  Caption = 'frmPaciente'
  ClientHeight = 562
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 515
    Width = 1008
    Height = 47
    Align = alBottom
    TabOrder = 0
    object btnOk: TButton
      Left = 336
      Top = 8
      Width = 98
      Height = 33
      Caption = 'Gravar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCalcelar: TButton
      Left = 440
      Top = 8
      Width = 98
      Height = 33
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 515
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1008
      515)
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = dbedtCODIGO
    end
    object Label2: TLabel
      Left = 91
      Top = 11
      Width = 71
      Height = 13
      Caption = 'Nome Paci'#234'nte'
      FocusControl = dbedtNOME
    end
    object Label3: TLabel
      Left = 416
      Top = 9
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
      FocusControl = dbedtNASCIMENTO
    end
    object Label4: TLabel
      Left = 616
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Idade'
      FocusControl = dbedtIdade
    end
    object Label5: TLabel
      Left = 8
      Top = 54
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = dbedtENDERECO
    end
    object Label10: TLabel
      Left = 88
      Top = 728
      Width = 83
      Height = 13
      Caption = 'CONDUTA_FISIO'
    end
    object dbedtCODIGO: TDBEdit
      Left = 8
      Top = 27
      Width = 80
      Height = 21
      DataField = 'CODIGO'
      DataSource = dtsPaciente
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtNOME: TDBEdit
      Left = 91
      Top = 27
      Width = 305
      Height = 21
      DataField = 'NOME'
      DataSource = dtsPaciente
      TabOrder = 1
    end
    object dbedtNASCIMENTO: TJvDBDateEdit
      Left = 416
      Top = 27
      Width = 134
      Height = 21
      DataField = 'NASCIMENTO'
      DataSource = dtsPaciente
      ShowNullDate = False
      StartOfWeek = Sun
      TabOrder = 2
    end
    object dbedtIdade: TDBEdit
      Left = 616
      Top = 27
      Width = 121
      Height = 21
      DataField = 'CalcIdade'
      DataSource = dtsPaciente
      TabOrder = 3
    end
    object dbedtENDERECO: TDBEdit
      Left = 8
      Top = 72
      Width = 388
      Height = 21
      DataField = 'ENDERECO'
      DataSource = dtsPaciente
      TabOrder = 4
    end
    object sbx1: TScrollBox
      Left = 8
      Top = 99
      Width = 985
      Height = 410
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
      DesignSize = (
        964
        406)
      object gpnDiagnosticos: TGridPanel
        Left = 0
        Top = 0
        Width = 898
        Height = 417
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 50.000000000000000000
          end
          item
            Value = 50.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = pnl1
            Row = 0
          end
          item
            Column = 1
            Control = pnl2
            Row = 0
          end
          item
            Column = 0
            Control = pnl3
            Row = 1
          end
          item
            Column = 1
            Control = pnl4
            Row = 1
          end
          item
            Column = 0
            Control = pnl5
            Row = 2
          end>
        RowCollection = <
          item
            Value = 33.333333333333350000
          end
          item
            Value = 33.333333333333330000
          end
          item
            Value = 33.333333333333320000
          end>
        TabOrder = 0
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 449
          Height = 139
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            449
            139)
          object lbl1: TLabel
            Left = 4
            Top = 3
            Width = 88
            Height = 13
            Caption = 'Diagn'#243'stico Cl'#237'nico'
          end
          object redtDiagClinico: TRichEdit
            Left = 4
            Top = 22
            Width = 440
            Height = 111
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Zoom = 100
          end
        end
        object pnl2: TPanel
          Left = 449
          Top = 0
          Width = 449
          Height = 139
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            449
            139)
          object lbl2: TLabel
            Left = 4
            Top = 3
            Width = 106
            Height = 13
            Caption = 'Avalia'#231#227'o Terapeutica'
          end
          object redtAvalFisio: TRichEdit
            Left = 4
            Top = 22
            Width = 439
            Height = 111
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Zoom = 100
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 139
          Width = 449
          Height = 138
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            449
            138)
          object lbl3: TLabel
            Left = 4
            Top = 3
            Width = 134
            Height = 13
            Caption = 'Diagn'#243'stico Fisioterapeutico'
          end
          object redtdiagFisio: TRichEdit
            Left = 4
            Top = 22
            Width = 440
            Height = 110
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Zoom = 100
          end
        end
        object pnl4: TPanel
          Left = 449
          Top = 139
          Width = 449
          Height = 138
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            449
            138)
          object lbl4: TLabel
            Left = 4
            Top = 3
            Width = 41
            Height = 13
            Caption = 'Objetivo'
          end
          object redtObjetivo: TRichEdit
            Left = 4
            Top = 22
            Width = 439
            Height = 110
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Zoom = 100
          end
        end
        object pnl5: TPanel
          Left = 0
          Top = 277
          Width = 449
          Height = 140
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 4
          DesignSize = (
            449
            140)
          object lbl5: TLabel
            Left = 4
            Top = 3
            Width = 113
            Height = 13
            Caption = 'Conduta Fisioterapeuta'
          end
          object redtCondutaFisio: TRichEdit
            Left = 4
            Top = 22
            Width = 440
            Height = 111
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Zoom = 100
          end
        end
      end
      object pnl6: TPanel
        Left = 0
        Top = 423
        Width = 961
        Height = 431
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          961
          431)
        object lblEvolucoes: TLabel
          Left = 16
          Top = 15
          Width = 48
          Height = 13
          Caption = 'Evolu'#231#245'es'
          FocusControl = dbedtENDERECO
        end
        object lbl6: TLabel
          Left = 246
          Top = 61
          Width = 92
          Height = 13
          Caption = 'Descri'#231#227'o Evolu'#231#227'o'
        end
        object lbl7: TLabel
          Left = 247
          Top = 15
          Width = 69
          Height = 13
          Caption = 'Data Evolu'#231#227'o'
        end
        object spbAddEvol: TJvSpeedButton
          Left = 176
          Top = 6
          Width = 25
          Height = 25
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E0B092C66C
            70B63F62AE2862AE2872B43F92C76BC5E0B2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7E2B56D
            B43A66B92A6BC32C6FC82D70CB2E70CB2E6FC82D6CC22C66B9296FB53DC9E3B7
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA0CE7F66B82A6FC82D71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71
            CC2E6FC92D66B729A3CF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF9FCE806ABF2B71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC
            2E71CC2E71CC2E71CC2E71CC2E71CC2E69BF2BA1CF80FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFC7E1B36ABF2B71CC2E71CC2E71CC2E71CC2E71CC2E
            71CC2E60AE2760AE2771CC2E71CC2E71CC2E71CC2E71CC2E71CC2E6ABF2BC9E3
            B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6CBB3471CC2E71CC2E71CC2E71
            CC2E71CC2E71CC2E71CC2EF1F0ECF1F0EC71CC2E71CC2E71CC2E71CC2E71CC2E
            71CC2E71CC2E6EBA39FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1DEAA6FC92D71CC
            2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2EF1F0ECF1F0EC71CC2E71CC2E71
            CC2E71CC2E71CC2E71CC2E71CC2E6FC92DC2DFADFFFFFFFFFFFFFFFFFFFFFFFF
            84C75471CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2EF1F0ECF1F0
            EC71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E84C755FFFFFFFF
            FFFFFFFFFFFFFFFF6DC13171CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E
            71CC2EF1F0ECF1F0EC71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC
            2E6FC332FFFFFFFFFFFFFFFFFFFFFFFF6FC82D71CC2E71CC2E71CC2E60AE2760
            AE2760AE2760AE2760AE27F1F0ECF1F0EC60AE2760AE2760AE2760AE2760AE27
            71CC2E71CC2E71CC2E6EC42CFFFFFFFFFFFFFFFFFFFFFFFF70CC2E71CC2E71CC
            2E71CC2EF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
            F0ECF1F0ECF1F0EC71CC2E71CC2E71CC2E70CB2EFFFFFFFFFFFFFFFFFFFFFFFF
            70CB2E71CC2E71CC2E71CC2EF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0
            ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0EC71CC2E71CC2E71CC2E6FC82DFFFFFFFF
            FFFFFFFFFFFFFFFF71CA3271CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E
            71CC2EF1F0ECF1F0EC71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC
            2E73C732FFFFFFFFFFFFFFFFFFFFFFFF89D15571CC2E71CC2E71CC2E71CC2E71
            CC2E71CC2E71CC2E71CC2EF1F0ECF1F0EC71CC2E71CC2E71CC2E71CC2E71CC2E
            71CC2E71CC2E71CC2E8AD157FFFFFFFFFFFFFFFFFFFFFFFFC5E8AB71CC2E71CC
            2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2EF1F0ECF1F0EC71CC2E71CC2E71
            CC2E71CC2E71CC2E71CC2E71CC2E71CC2EC8EAB0FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF77CA3771CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2EF1F0ECF1F0
            EC71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E76CC3AFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCBEBB471CC2E71CC2E71CC2E71CC2E71CC2E71CC2E
            71CC2EF1F0ECF1F0EC71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2ECDEC
            B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7DE7E71CC2E71CC2E71
            CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E
            71CC2EA9DE81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA8DF8071CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71CC2E71
            CC2E71CC2E71CC2EA9DF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCBEBB47BCE3F71CC2E71CC2E71CC2E71CC2E71CC
            2E71CC2E71CC2E71CC2E7ACD40CDECB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8EAB09BDA6E
            7DD0446FCB2E6FCB2E7DD0449BDA6EC9EAB2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = spbAddEvolClick
        end
        object spbRemEvol: TJvSpeedButton
          Left = 203
          Top = 6
          Width = 25
          Height = 25
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2C8C8C8B5B5B5B0B0B0B1B1
            B1B8B8B8CCCCCCE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3A0A0A0A3A3A3B2B2B2
            C1C1C1CBCBCBD2D2D2D4D4D4CFCFCFBEBEBEAFAFAFDADADAFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8A5A5A5ADADADBD
            BDBD9898B95B5BBF3F3FC44444CA4949CF4E4ED47777DCC4C4E6EDEDEDD0D0D0
            B9B9B9ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E79E9E
            9EBFBFBFA1A1C23737BB0C0CBD0F0FC11313C51717CA1C1CCF2121D42626DA2C
            2CE16161E9D1D1F4EAEAEABABABAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E7E7E79D9D9DCDCDCD8181C30707B80909BB0C0CBE1010C21414C61818CA1D1D
            D02222D52727DC2E2EE33434EA3B3BF2B6B6FAF8F8F8BABABAECECECFFFFFFFF
            FFFFFFFFFFFFFFFFA2A2A2C9C9C98585C70505B60707B80909BB0C0CBE1010C2
            1414C61818CA1C1CD02222D52727DC2E2EE33434EA3B3BF24141F9B5B5FAEAEA
            EAB8B8B8FFFFFFFFFFFFFFFFFFD0D0D0B9B9B9B1B1D20303B40505B50707B897
            97D9DEDEDE6565D41313C51717CA1C1CCF2121D47575E5F8F8F8B1B1F53737ED
            3A3AF13A3AF0D1D1F3CFCFCFDADADAFFFFFFFFFFFF9A9A9AE1E1E13939BD0303
            B30505B59999DBCACACABFBFBFC8C8C86161D01616C81A1ACD6969DAE7E7E7ED
            EDEDF5F5F5B1B1F53333E93333E96060E8EDEDEDAEAEAEFFFFFFDFDFDFB1B1B1
            B9B9DA0202B20303B30404B5E7E7E7CECECEC6C6C6BFBFBFC5C5C55F5FCE6161
            D1D8D8D8DEDEDEE5E5E5EDEDEDF8F8F82D2DE22D2DE12B2BDFC4C4E5BDBDBDE5
            E5E5C1C1C1D1D1D16565C80101B10202B30404B46060CEDADADACECECEC6C6C6
            BFBFBFC4C4C4CBCBCBCFCFCFD6D6D6DEDEDEE7E7E77474E52626DB2626DB2525
            D97676DBCECECECBCBCBABABABE7E7E76B6BCD0E0EB50202B20303B40505B55B
            5BC9D7D7D7CECECEC6C6C6BFBFBFBFBFBFC7C7C7CFCFCFD8D8D86969D92020D4
            2121D42121D42020D34D4DD4D4D4D4B8B8B8A3A3A3F0F0F07070D04545C61A1A
            B90303B30404B40606B65858C6D6D6D6CECECEC6C6C6BFBFBFBFBFBFCBCBCB61
            61D11A1ACD1B1BCE1C1CCF1C1CCF1B1BCE4848CED2D2D2B1B1B1A3A3A3F2F2F2
            7272D14646C64242C52C2CBF0A0AB60505B55858C6DCDCDCD5D5D5CECECEC6C6
            C6BFBFBFC4C4C45E5ECE1515C81717C91717CA1717CA1616C94343C9CBCBCBAF
            AFAFABABABEEEEEE7575D24747C64444C64040C53D3DC46D6DCFE9E9E9E3E3E3
            DCDCDCD5D5D5CECECEC6C6C6BFBFBFC5C5C56060CF1313C51313C51313C51212
            C43E3EC4C1C1C1B4B4B4C1C1C1DCDCDC9696DB4A4AC74646C64343C58787DAF7
            F7F7F3F3F3ECECECE5E5E5DDDDDDD6D6D6CECECEC6C6C6BFBFBFC8C8C86464D4
            0F0FC10F0FC10F0FC05B5BBEB2B2B2C7C7C7DFDFDFB9B9B9D7D7EE4D4DC84848
            C64646C6FEFEFEFAFAFAF7F7F7F3F3F3EDEDED7878D17676D0DCDCDCD3D3D3CB
            CBCBC4C4C4DCDCDC1A1AC11F1FC21E1EC29A9ABAA2A2A2E2E2E2FFFFFF9B9B9B
            FAFAFA7979D44B4BC74747C6BABAEAFEFEFEFAFAFAF7F7F77E7ED53838C43737
            C47A7AD3E1E1E1D7D7D7D3D3D3A9A9DF3232C63232C65555C4BDBDBD9F9F9FFF
            FFFFFFFFFFD0D0D0C9C9C9DADAF04F4FC84B4BC74747C6BABAEAFEFEFE8787DA
            3D3DC43B3BC43939C43838C48080D8EBEBEBACACE23535C53535C53535C5A9A9
            C4ACACACD3D3D3FFFFFFFFFFFFFFFFFFA3A3A3E7E7E7BABAE74E4EC84B4BC747
            47C64545C64343C54040C53E3EC43C3CC43A3AC43939C43939C43838C43838C4
            3737C49393C8BEBEBEA5A5A5FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6A3A3A3F5F5
            F5BABAE74F4FC84B4BC74848C64646C64444C54242C54040C53F3FC43D3DC43C
            3CC43B3BC43B3BC49999CDCCCCCC9D9D9DE7E7E7FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE6E6E6A3A3A3E7E7E7DADAF07979D44C4CC84949C74747C64545C64444
            C54242C54141C54040C56666CABCBCD5C9C9C99D9D9DE7E7E7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6A3A3A3C9C9C9FAFAFAD7D7EE9696DB
            7474D27272D07070CF6F6FCF8B8BD4C5C5DDE1E1E1B8B8B8A2A2A2E7E7E7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D09B
            9B9BB9B9B9DCDCDCEEEEEEF2F2F2F0F0F0E7E7E7D1D1D1B1B1B19A9A9AD0D0D0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDFDFDFC1C1C1ABABABA3A3A3A3A3A3ABABABC1C1C1DF
            DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = spbRemEvolClick
        end
        object dbrdtEVOLUCAO: TJvDBRichEdit
          Left = 247
          Top = 80
          Width = 706
          Height = 345
          DataField = 'EVOLUCAO'
          DataSource = dtsEvolucoes
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          TabOrder = 1
        end
        object dbgEvolucoes: TJvDBGrid
          Left = 8
          Top = 34
          Width = 232
          Height = 391
          Anchors = [akLeft, akTop, akBottom]
          DataSource = dtsEvolucoes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <
            item
              FieldName = 'DATA_EVOLUCAO'
              FitCell = fcCellSize
              LeaveOnEnterKey = True
              LeaveOnUpDownKey = True
            end>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'DATA_EVOLUCAO'
              Title.Caption = 'Data da Evolu'#231#227'o'
              Visible = True
            end>
        end
        object dbedtDATA_EVOLUCAO: TJvDBDateEdit
          Left = 246
          Top = 34
          Width = 121
          Height = 21
          DataField = 'DATA_EVOLUCAO'
          DataSource = dtsEvolucoes
          ShowNullDate = False
          StartOfWeek = Sun
          TabOrder = 2
        end
      end
    end
  end
  object fdqPaciente: TFDQuery
    OnCalcFields = fdqPacienteCalcFields
    CachedUpdates = True
    Connection = dmDados.con1
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtInt64
        TargetDataType = dtUInt64
      end>
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_PACIENTES'
    UpdateOptions.UpdateTableName = 'PACIENTES'
    UpdateOptions.KeyFields = 'ID_PACIENTE'
    UpdateOptions.AutoIncFields = 'ID_PACIENTE'
    SQL.Strings = (
      'select'
      ' *'
      'from'
      '  pacientes'
      'where'
      '  id_paciente = :id')
    Left = 376
    Top = 224
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object fdqPacienteID_PACIENTE: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PACIENTE'
      Origin = 'ID_PACIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqPacienteCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object fdqPacienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 150
    end
    object fdqPacienteNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
    end
    object fdqPacienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 150
    end
    object fdqPacienteDIAG_CLINICO: TMemoField
      FieldName = 'DIAG_CLINICO'
      Origin = 'DIAG_CLINICO'
      BlobType = ftMemo
    end
    object fdqPacienteAVAL_FISIO: TMemoField
      FieldName = 'AVAL_FISIO'
      Origin = 'AVAL_FISIO'
      BlobType = ftMemo
    end
    object fdqPacienteDIAG_FISIO: TMemoField
      FieldName = 'DIAG_FISIO'
      Origin = 'DIAG_FISIO'
      BlobType = ftMemo
    end
    object fdqPacienteOBJETIVO: TMemoField
      FieldName = 'OBJETIVO'
      Origin = 'OBJETIVO'
      BlobType = ftMemo
    end
    object fdqPacienteCONDUTA_FISIO: TMemoField
      FieldName = 'CONDUTA_FISIO'
      Origin = 'CONDUTA_FISIO'
      BlobType = ftMemo
    end
    object fdqPacienteCalcIdade: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'CalcIdade'
      Size = 100
      Calculated = True
    end
  end
  object fdqEvolucao: TFDQuery
    AfterOpen = fdqEvolucaoAfterOpen
    AfterScroll = fdqEvolucaoAfterScroll
    CachedUpdates = True
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'Ordem'
        Fields = 'DATA_EVOLUCAO;ID_EVOLUCAO'
        Options = [soDescending]
      end>
    IndexName = 'Ordem'
    Connection = dmDados.con1
    UpdateOptions.KeyFields = 'ID_EVOLUCAO'
    UpdateOptions.AutoIncFields = 'id_evolucao'
    SQL.Strings = (
      'select'
      '    id_evolucao,'
      '    data_evolucao,'
      '    evolucao,'
      '    fk_paciente'
      'from'
      '    evolucao e'
      'where'
      '    fk_paciente = :id_paciente'
      'order by'
      '  e.data_evolucao, e.id_evolucao')
    Left = 432
    Top = 256
    ParamData = <
      item
        Name = 'ID_PACIENTE'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object fdqEvolucaoID_EVOLUCAO: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_EVOLUCAO'
      Origin = 'ID_EVOLUCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqEvolucaoDATA_EVOLUCAO: TDateField
      FieldName = 'DATA_EVOLUCAO'
      Origin = 'DATA_EVOLUCAO'
      Required = True
    end
    object fdqEvolucaoEVOLUCAO: TMemoField
      FieldName = 'EVOLUCAO'
      Origin = 'EVOLUCAO'
      Required = True
      BlobType = ftMemo
    end
    object fdqEvolucaoFK_PACIENTE: TLargeintField
      FieldName = 'FK_PACIENTE'
      Origin = 'FK_PACIENTE'
    end
  end
  object dtsPaciente: TDataSource
    DataSet = fdqPaciente
    Left = 376
    Top = 272
  end
  object dtsEvolucoes: TDataSource
    DataSet = fdqEvolucao
    Left = 496
    Top = 288
  end
  object bdsdbPacientes: TBindSourceDB
    DataSource = dtsPaciente
    ScopeMappings = <>
    Left = 456
    Top = 192
  end
  object bdl1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object lpfLinesText: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bdsdbPacientes
      FieldName = 'AVAL_FISIO'
      Component = redtAvalFisio
      ComponentProperty = 'Lines.Text'
    end
    object lpfLinesText1: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bdsdbPacientes
      FieldName = 'DIAG_CLINICO'
      Component = redtDiagClinico
      ComponentProperty = 'Lines.Text'
    end
    object lpfLinesText2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bdsdbPacientes
      FieldName = 'OBJETIVO'
      Component = redtObjetivo
      ComponentProperty = 'Lines.Text'
    end
    object lpfLinesText3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bdsdbPacientes
      FieldName = 'CONDUTA_FISIO'
      Component = redtCondutaFisio
      ComponentProperty = 'Lines.Text'
    end
    object lpfLinesText4: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bdsdbPacientes
      FieldName = 'DIAG_FISIO'
      Component = redtdiagFisio
      ComponentProperty = 'Lines.Text'
    end
  end
end

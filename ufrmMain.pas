unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, JvDBGridFooter,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, JvExComCtrls, JvToolBar,udmDados, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    tlbr1: TJvToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    il1: TImageList;
    JvDBGrid1: TJvDBGrid;
    JvDBGridFooter1: TJvDBGridFooter;
    fdqPacientes: TFDQuery;
    dsPacientes: TDataSource;
    fdqPacientesID_PACIENTE: TLargeintField;
    fdqPacientesCODIGO: TLargeintField;
    fdqPacientesNOME: TStringField;
    fdqPacientesNASCIMENTO: TDateField;
    fdqPacientesENDERECO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

end.

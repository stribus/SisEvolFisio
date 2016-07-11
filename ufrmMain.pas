unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, JvDBGridFooter,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, JvExComCtrls, JvToolBar,udmDados, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, JvExStdCtrls, JvRichEdit, JvDBRichEdit;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    tlbr1: TJvToolBar;
    btnAddPaciente: TToolButton;
    btnEditar: TToolButton;
    btnExcluir: TToolButton;
    il1: TImageList;
    JvDBGrid1: TJvDBGrid;
    JvDBGridFooter1: TJvDBGridFooter;
    dsPacientes: TDataSource;
    JvDBRichEdit1: TJvDBRichEdit;
    spl1: TSplitter;
    fdqPacientes: TFDQuery;
    fdqPacientesID_PACIENTE: TLargeintField;
    fdqPacientesCODIGO: TLargeintField;
    fdqPacientesNOME: TStringField;
    fdqPacientesNASCIMENTO: TDateField;
    fdqPacientesENDERECO: TStringField;
    procedure btnAddPacienteClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses UfrmPaciente;

procedure TfrmMain.btnAddPacienteClick(Sender: TObject);
begin
  if TfrmPaciente.InserirPaciente(Self) then
  begin
    fdqPacientes.Close;
    fdqPacientes.Open;
  end;
end;

procedure TfrmMain.btnEditarClick(Sender: TObject);
begin
  if TfrmPaciente.EditarPaciente(Self,fdqPacientesID_PACIENTE.AsInteger) then
  begin
    fdqPacientes.Close;
    fdqPacientes.Open;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not Assigned(dmDados) then
    dmDados :=TdmDados.Create(Self);
  fdqPacientes.close;
  fdqPacientes.Open;
end;

end.

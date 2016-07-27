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
  Vcl.StdCtrls, JvExStdCtrls, JvRichEdit, JvDBRichEdit, frxClass, frxDBSet,
  frxPreview, frxRich;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    tlbr1: TJvToolBar;
    btnAddPaciente: TToolButton;
    btnEditar: TToolButton;
    btnExcluir: TToolButton;
    il1: TImageList;
    dbgPacientes: TJvDBGrid;
    JvDBGridFooter1: TJvDBGridFooter;
    dsPacientes: TDataSource;
    spl1: TSplitter;
    fdqPacientes: TFDQuery;
    fdqPacientesID_PACIENTE: TLargeintField;
    fdqPacientesCODIGO: TLargeintField;
    fdqPacientesNOME: TStringField;
    fdqPacientesNASCIMENTO: TDateField;
    fdqPacientesENDERECO: TStringField;
    pnl2: TPanel;
    frpEvolucao: TfrxPreview;
    frepEvolucao: TfrxReport;
    fdqDetalhePaciente: TFDQuery;
    fdqEvolucaoPaciente: TFDQuery;
    dtsDetalhePaciente: TDataSource;
    dtsEvolucaoPaciente: TDataSource;
    fdsDetalhePaciente: TfrxDBDataset;
    fdsEvolucaoPaciente: TfrxDBDataset;
    fdqDetalhePacienteID_PACIENTE: TLargeintField;
    fdqDetalhePacienteCODIGO: TLargeintField;
    fdqDetalhePacienteNOME: TStringField;
    fdqDetalhePacienteNASCIMENTO: TDateField;
    fdqDetalhePacienteENDERECO: TStringField;
    fdqDetalhePacienteDIAG_CLINICO: TMemoField;
    fdqDetalhePacienteAVAL_FISIO: TMemoField;
    fdqDetalhePacienteDIAG_FISIO: TMemoField;
    fdqDetalhePacienteOBJETIVO: TMemoField;
    fdqDetalhePacienteCONDUTA_FISIO: TMemoField;
    fdqEvolucaoPacienteID_EVOLUCAO: TLargeintField;
    fdqEvolucaoPacienteDATA_EVOLUCAO: TDateField;
    fdqEvolucaoPacienteEVOLUCAO: TMemoField;
    fdqEvolucaoPacienteFK_PACIENTE: TLargeintField;
    frxRichObject1: TfrxRichObject;
    procedure btnAddPacienteClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPacientesDblClick(Sender: TObject);
    procedure fdqPacientesAfterScroll(DataSet: TDataSet);
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
  if (not fdqPacientes.IsEmpty)
    and TfrmPaciente.EditarPaciente(Self,fdqPacientesID_PACIENTE.AsInteger) then
  begin
    fdqPacientes.Close;
    fdqPacientes.Open;
  end;
end;

procedure TfrmMain.dbgPacientesDblClick(Sender: TObject);
begin
  btnEditar.Click;
end;

procedure TfrmMain.fdqPacientesAfterScroll(DataSet: TDataSet);
begin
  frepEvolucao.ShowReport(true);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not Assigned(dmDados) then
    dmDados :=TdmDados.Create(Self);
  fdqPacientes.close;
  fdqPacientes.Open;
end;

end.

unit UfrmPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmdados, FireDAC.Stan.Intf,DateUtils ,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uFrmEditorAvancado,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExMask, JvToolEdit, JvDBControls, Vcl.Mask, Vcl.DBCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Vcl.Grids, Vcl.DBGrids, Data.Bind.Components, Data.Bind.DBScope, Vcl.ComCtrls,
  JvExDBGrids, JvDBGrid, JvExStdCtrls, JvRichEdit, JvDBRichEdit, JvExControls,
  JvSpeedButton;

type
  TfrmPaciente = class(TForm)
    fdqPaciente: TFDQuery;
    fdqEvolucao: TFDQuery;
    Panel1: TPanel;
    btnOk: TButton;
    btnCalcelar: TButton;
    Panel2: TPanel;
    fdqPacienteCODIGO: TLargeintField;
    fdqPacienteNOME: TStringField;
    fdqPacienteNASCIMENTO: TDateField;
    fdqPacienteENDERECO: TStringField;
    fdqPacienteDIAG_CLINICO: TMemoField;
    fdqPacienteAVAL_FISIO: TMemoField;
    fdqPacienteDIAG_FISIO: TMemoField;
    fdqPacienteOBJETIVO: TMemoField;
    fdqPacienteCONDUTA_FISIO: TMemoField;
    Label1: TLabel;
    dbedtCODIGO: TDBEdit;
    Label2: TLabel;
    dbedtNOME: TDBEdit;
    Label3: TLabel;
    fdqPacienteCalcIdade: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    dbedtENDERECO: TDBEdit;
    Label10: TLabel;
    dtsPaciente: TDataSource;
    fdqEvolucaoID_EVOLUCAO: TLargeintField;
    fdqEvolucaoDATA_EVOLUCAO: TDateField;
    fdqEvolucaoEVOLUCAO: TMemoField;
    fdqEvolucaoFK_PACIENTE: TLargeintField;
    dtsEvolucoes: TDataSource;
    dbedtNASCIMENTO: TJvDBDateEdit;
    dbedtIdade: TDBEdit;
    sbx1: TScrollBox;
    gpnDiagnosticos: TGridPanel;
    pnl1: TPanel;
    lbl1: TLabel;
    pnl2: TPanel;
    lbl2: TLabel;
    pnl3: TPanel;
    lbl3: TLabel;
    pnl4: TPanel;
    lbl4: TLabel;
    pnl5: TPanel;
    lbl5: TLabel;
    pnl6: TPanel;
    lblEvolucoes: TLabel;
    dbrdtEVOLUCAO: TJvDBRichEdit;
    lbl6: TLabel;
    dbgEvolucoes: TJvDBGrid;
    dbedtDATA_EVOLUCAO: TJvDBDateEdit;
    lbl7: TLabel;
    spbAddEvol: TJvSpeedButton;
    spbRemEvol: TJvSpeedButton;
    fdqPacienteID_PACIENTE: TLargeintField;
    btnEditacaoAvancada: TButton;
    dbredtDiagClinico: TDBRichEdit;
    dbredtAvalFisio: TDBRichEdit;
    dbredtFisio: TDBRichEdit;
    dbredtObjetivo: TDBRichEdit;
    dbredtCondutaFisio: TDBRichEdit;
    procedure fdqPacienteCalcFields(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
    procedure spbAddEvolClick(Sender: TObject);
    procedure fdqEvolucaoAfterOpen(DataSet: TDataSet);
    procedure fdqEvolucaoAfterScroll(DataSet: TDataSet);
    procedure spbRemEvolClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditacaoAvancadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function InserirPaciente(AOwner:TComponent):Boolean;
    class function EditarPaciente(AOwner:TComponent;Aid:Int64):Boolean;
  end;

var
  frmPaciente: TfrmPaciente;

implementation

{$R *.dfm}

uses UGeral;

procedure TfrmPaciente.btnEditacaoAvancadaClick(Sender: TObject);
var
  lStream :TStream;
  LTexto:string;
begin
  try
    if dbrdtEVOLUCAO.Enabled then
    begin
      lStream := TStringStream.Create;
      dbrdtEVOLUCAO.Lines.SaveToStream(lStream);
      lStream.Position :=0;
      if TfrmEditorAvancado.editar(Self,lStream) and Assigned(lStream)then
      begin
        lStream.Position :=0;
        if not (dbrdtEVOLUCAO.DataSource.DataSet.State in dsWriteModes) then
          dbrdtEVOLUCAO.DataSource.DataSet.Edit;
        TBlobField(dbrdtEVOLUCAO.Field).LoadFromStream(lStream);
      end;
    end;
  finally
    tryFreeAndNil(lStream);
  end;
end;

procedure TfrmPaciente.btnOkClick(Sender: TObject);
begin
  if trim(dbedtNOME.Text) ='' then
  begin
    Application.MessageBox('Informe o nome do paciente', 'Validação', MB_OK +
      MB_ICONINFORMATION);
    ModalResult := mrNone;
  end;
end;

class function TfrmPaciente.EditarPaciente(AOwner: TComponent;
  Aid: Int64): Boolean;
var
  frmpac:TfrmPaciente;
begin
  frmpac:=TfrmPaciente.Create(AOwner);
  try
    with frmpac do
    begin
      fdqPaciente.Close;
      fdqPaciente.Params[0].AsInteger := Aid;
      fdqPaciente.Active := True;

      fdqEvolucao.Close;
      fdqEvolucao.Params[0].AsInteger := Aid;
      fdqEvolucao.Active := True;

      if fdqPaciente.RecordCount <> 1 then
      begin
        ShowMessage('Erro: Mais de um paciente encontrado com o mesmo codigo');
        Abort;
      end;

      fdqPaciente.Edit;
      if ShowModal = mrOk then
      begin
        fdqPaciente.Post;
        fdqPaciente.ApplyUpdates;
        fdqPaciente.CommitUpdates;
        fdqEvolucao.ApplyUpdates;
        fdqEvolucao.CommitUpdates;
      end;
    end;
  finally
    if Assigned(frmpac) then
    begin
      Result := frmpac.ModalResult = mrOk;
      FreeAndNil(frmPac);
    end
    else
      Result := False;
  end;
end;

procedure TfrmPaciente.fdqEvolucaoAfterOpen(DataSet: TDataSet);
begin
  dbrdtEVOLUCAO.Enabled := not DataSet.IsEmpty;
  dbedtDATA_EVOLUCAO.Enabled := not DataSet.IsEmpty;
end;

procedure TfrmPaciente.fdqEvolucaoAfterScroll(DataSet: TDataSet);
begin
  dbrdtEVOLUCAO.Enabled := not DataSet.IsEmpty;
  dbedtDATA_EVOLUCAO.Enabled := not DataSet.IsEmpty;
end;

procedure TfrmPaciente.fdqPacienteCalcFields(DataSet: TDataSet);
var
  lIdade:TStringBuilder;
begin
  lIdade := nil;
  try
    if (dataset.State in dsWriteModes) and (not fdqPacienteNASCIMENTO.isnull) then
    begin
      lIdade := TStringBuilder.Create;
      lIdade.Append(YearsBetween(fdqPacienteNASCIMENTO.AsDateTime,now)).Append(' Anos');
      if (MonthsBetween(fdqPacienteNASCIMENTO.AsDateTime,now) mod 12) > 0 then
      begin
        lIdade.Append(' e ');
        lIdade.Append(MonthsBetween(fdqPacienteNASCIMENTO.AsDateTime,now) mod 12);
        lIdade.Append(' Meses');
      end;
      fdqPacienteCalcIdade.AsString := lIdade.ToString;
    end
    else
      fdqPacienteCalcIdade.AsString := '';
  finally
    tryFreeAndNil(lIdade);
  end;
end;

procedure TfrmPaciente.FormShow(Sender: TObject);
begin
  sbx1.VertScrollBar.Position := 0;
end;

class function TfrmPaciente.InserirPaciente(AOwner: TComponent): Boolean;
var
  frmpac:TfrmPaciente;
begin
  frmpac:=TfrmPaciente.Create(AOwner);
  try
    with frmpac do
    begin
      fdqPaciente.Close;
      fdqPaciente.Params[0].AsInteger := -1;
      fdqPaciente.Active := True;

      fdqEvolucao.Close;
      fdqEvolucao.Params[0].AsInteger := -1;
      fdqEvolucao.Active := True;

      if fdqPaciente.RecordCount >= 1 then
      begin
        ShowMessage('Erro: Mais de um paciente encontrado com o mesmo codigo');
        Abort;
      end;

      fdqPaciente.Insert;
      fdqPacienteCODIGO.AsInteger := dmDados.getNextCod('pacientes','codigo');

      if ShowModal = mrOk then
      begin
        fdqPaciente.Post;
        fdqPaciente.ApplyUpdates;
        fdqPaciente.CommitUpdates;
        fdqEvolucao.ApplyUpdates;
        fdqEvolucao.CommitUpdates;
      end;
    end;
  finally
    if Assigned(frmpac) then
    begin
      Result := frmpac.ModalResult = mrOk;
      FreeAndNil(frmPac);
    end
    else
      Result := False;
  end;
end;

procedure TfrmPaciente.spbAddEvolClick(Sender: TObject);
begin
  fdqEvolucao.Insert;
  fdqEvolucaoFK_PACIENTE.AsInteger := fdqPacienteID_PACIENTE.AsInteger;
  fdqEvolucaoDATA_EVOLUCAO.AsDateTime := Now;
  dbrdtEVOLUCAO.Enabled := true;
  dbedtDATA_EVOLUCAO.Enabled := true;
end;

procedure TfrmPaciente.spbRemEvolClick(Sender: TObject);
begin
  if not fdqEvolucao.IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir está evolução',
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      fdqEvolucao.Delete;
      dbrdtEVOLUCAO.Enabled := not fdqEvolucao.IsEmpty;
      dbedtDATA_EVOLUCAO.Enabled := not fdqEvolucao.IsEmpty;
    end;
  end;
end;

end.

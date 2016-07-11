program EvolFisio;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmDados in 'udmDados.pas' {dmDados: TDataModule},
  UConexao in 'UConexao.pas',
  ufrmEditor in 'ufrmEditor.pas' {frmEditor},
  UfrmPaciente in 'UfrmPaciente.pas' {frmPaciente},
  UGeral in 'UGeral.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

program EvolFisio;

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmDados in 'udmDados.pas' {dmDados: TDataModule},
  UConexao in 'UConexao.pas',
  ufrmEditor in 'ufrmEditor.pas' {frmEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEditor, frmEditor);
  Application.Run;
end.

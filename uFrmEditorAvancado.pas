unit uFrmEditorAvancado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmEditor, System.ImageList, UGeral,
  Vcl.ImgList, Vcl.Menus, JvMenus, JvSpeedbar, Vcl.Mask, JvExMask, JvSpin,
  Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvColorCombo, JvExExtCtrls,
  JvExtComponent, Vcl.ComCtrls, JvRichEdit, Vcl.ExtCtrls;

type
  TfrmEditorAvancado = class(TfrmEditor)
    pnl1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
  private

    { Private declarations }
  public
    class function editar(Aowner: Tcomponent; AText: TStream): Boolean; overload;
    class function editar(Aowner: Tcomponent;Var AText: string): Boolean; overload;
    { Public declarations }
  end;

var
  frmEditorAvancado: TfrmEditorAvancado;

implementation

{$R *.dfm}

{ TfrmEditorAvancado }

class function TfrmEditorAvancado.editar(Aowner:Tcomponent ;AText: TStream): Boolean;
var
  frm:TfrmEditorAvancado;
begin
  try
    frm:=TfrmEditorAvancado.Create(Aowner);
    frm.rdtEditor.Lines.LoadFromStream(AText);
    if frm.ShowModal = mrOk then
    begin
      tryfreeAndNil(aText);

      AText := TStringStream.Create;

      frm.rdtEditor.Lines.SaveToStream(AText);
      AText.Position := 0;
    end;
    Result := frm.ModalResult =mrOk;
  finally
    tryFreeAndNil(frm);
  end;
end;

class function TfrmEditorAvancado.editar(Aowner: Tcomponent;
var  AText: string): Boolean;
var
  frm: TfrmEditorAvancado;
begin
  try
    frm := TfrmEditorAvancado.Create(Aowner);
    frm.rdtEditor.Text := AText;
    if frm.ShowModal = mrOk then
    begin
      AText :=frm.rdtEditor.Text;
    end;
    Result := frm.ModalResult = mrOk;
  finally
    tryFreeAndNil(frm);
  end;
end;

end.

unit ufrmEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvSpeedbar, Vcl.Mask, JvExMask, JvSpin,
  Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvColorCombo, JvExExtCtrls,
  JvExtComponent, Vcl.ComCtrls, JvRichEdit, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Menus, JvMenus;

type
  TfrmEditor = class(TForm)
    popEdit: TJvPopupMenu;
    CutItm: TMenuItem;
    CopyItm: TMenuItem;
    PasteItm: TMenuItem;
    ilToolbarImages: TImageList;
    pnlEditor: TPanel;
    rdtEditor: TJvRichEdit;
    StatusBar: TStatusBar;
    pnlBotoes: TPanel;
    spbFormatBar: TJvSpeedBar;
    fcbFontName: TJvFontComboBox;
    sdtFontSize: TJvSpinEdit;
    sbsSpeedbarSection3: TJvSpeedBarSection;
    sdiBoldBtn: TJvSpeedItem;
    sdiItalicBtn: TJvSpeedItem;
    sdiUnderlineBtn: TJvSpeedItem;
    sdiColorBtn: TJvSpeedItem;
    sdiBackgroundBtn: TJvSpeedItem;
    sdiLeftBtn: TJvSpeedItem;
    sdiCenterBtn: TJvSpeedItem;
    sdiRightBtn: TJvSpeedItem;
    sdiJustifyBtn: TJvSpeedItem;
    sdiSuperscriptBtn: TJvSpeedItem;
    sdiSubscriptBtn: TJvSpeedItem;
    sdiBulletsBtn: TJvSpeedItem;
    sbs1: TJvSpeedBarSection;
    sdiCutBtn: TJvSpeedItem;
    sdicopybtn: TJvSpeedItem;
    sdipastebtn: TJvSpeedItem;
    popBackgroundMenu: TJvPopupMenu;
    popColorMenu: TJvPopupMenu;
    procedure sdiCutBtnClick(Sender: TObject);
    procedure sdicopybtnClick(Sender: TObject);
    procedure sdipastebtnClick(Sender: TObject);
    procedure fcbFontNameChange(Sender: TObject);
    procedure sdtFontSizeChange(Sender: TObject);
    procedure sdiBoldBtnClick(Sender: TObject);
    procedure sdiItalicBtnClick(Sender: TObject);
    procedure sdiUnderlineBtnClick(Sender: TObject);
    procedure sdiBackgroundBtnClick(Sender: TObject);
    procedure sdiLeftBtnClick(Sender: TObject);
    procedure sdiCenterBtnClick(Sender: TObject);
    procedure sdiRightBtnClick(Sender: TObject);
    procedure sdiJustifyBtnClick(Sender: TObject);
    procedure sdiSuperscriptBtnClick(Sender: TObject);
    procedure sdiSubscriptBtnClick(Sender: TObject);
    procedure sdiBulletsBtnClick(Sender: TObject);
    procedure rdtEditorGetDragDropEffect(Sender: TObject;
      ShiftState: TShiftState; var AllowedEffects: TRichDropEffects;
      var Handled: Boolean);
    procedure rdtEditorProtectChange(Sender: TObject; StartPos, EndPos: Integer;
      var AllowChange: Boolean);
    procedure rdtEditorURLClick(Sender: TObject; const URLText: string;
      Button: TMouseButton);
    procedure rdtEditorSelectionChange(Sender: TObject);
  private
    FUpdating: Boolean;
    FDragStartedHere: Boolean;
    function CurrText: TJvTextAttributes;
    procedure pParagraphAlignment(out Sender: TObject);
    procedure pSetSubscrit;
    procedure UpdateCursorPos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditor: TfrmEditor;

implementation

uses
  Winapi.ShellAPI;

{$R *.dfm}

procedure TfrmEditor.fcbFontNameChange(Sender: TObject);
begin
  if FUpdating then
    Exit;
  CurrText.Name := fcbFontName.FontName;
end;

procedure TfrmEditor.sdiBackgroundBtnClick(Sender: TObject);
begin
  //
end;

procedure TfrmEditor.sdiBoldBtnClick(Sender: TObject);
begin
   if FUpdating then
    Exit;
  if sdiBoldBtn.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TfrmEditor.sdiBulletsBtnClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  rdtEditor.Paragraph.Numbering := TJvNumbering(sdiBulletsBtn.Down);
end;

procedure TfrmEditor.sdiCenterBtnClick(Sender: TObject);
begin
  pParagraphAlignment(Sender);
end;

procedure TfrmEditor.sdicopybtnClick(Sender: TObject);
begin
  rdtEditor.CopyToClipboard;
end;

procedure TfrmEditor.sdiCutBtnClick(Sender: TObject);
begin
  rdtEditor.CutToClipboard;
end;

procedure TfrmEditor.sdiItalicBtnClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if sdiItalicBtn.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TfrmEditor.sdiJustifyBtnClick(Sender: TObject);
begin
  pParagraphAlignment(Sender);
end;

procedure TfrmEditor.sdiLeftBtnClick(Sender: TObject);
begin
  pParagraphAlignment(Sender);
end;

procedure TfrmEditor.sdipastebtnClick(Sender: TObject);
begin
  rdtEditor.PasteFromClipboard;
end;

procedure TfrmEditor.sdiRightBtnClick(Sender: TObject);
begin
  pParagraphAlignment(Sender);
end;

procedure TfrmEditor.sdiSubscriptBtnClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  pSetSubscrit;
end;

procedure TfrmEditor.sdiSuperscriptBtnClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  pSetSubscrit;
end;

procedure TfrmEditor.sdiUnderlineBtnClick(Sender: TObject);
begin
    if FUpdating then
    Exit;
  if Sender is TMenuItem then
  begin
    CurrText.UnderlineType := TUnderlineType(TMenuItem(Sender).Tag);
  end
  else
  if sdiUnderlineBtn.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TfrmEditor.sdtFontSizeChange(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if sdtFontSize.AsInteger > 0 then
    CurrText.Size := sdtFontSize.AsInteger;
end;

function TfrmEditor.CurrText: TJvTextAttributes;
begin
  if rdtEditor.SelLength > 0 then
    Result := rdtEditor.SelAttributes
  else
    Result := rdtEditor.WordAttributes;
end;

procedure TfrmEditor.pParagraphAlignment(out Sender: TObject);
begin
  if FUpdating then
    Exit;
  rdtEditor.Paragraph.Alignment := TParaAlignment(TComponent(Sender).Tag);
end;

procedure TfrmEditor.pSetSubscrit;
begin
  if sdiSuperscriptBtn.Down then
  begin
    CurrText.SubscriptStyle := ssSuperscript;
    sdiSubscriptBtn.Down := False;
  end
  else if sdiSubscriptBtn.Down then
  begin
    CurrText.SubscriptStyle := ssSubscript;
    sdiSuperscriptBtn.Down := False;
  end
  else
    CurrText.SubscriptStyle := ssNone;
end;

procedure TfrmEditor.rdtEditorGetDragDropEffect(Sender: TObject;
  ShiftState: TShiftState; var AllowedEffects: TRichDropEffects;
  var Handled: Boolean);
var
  Effect: TRichDropEffect;
begin
  // wordpad
  //
  //   ctrl         = copy
  //   alt          = move
  //   ctrl + shift = link
  //
  // http://msdn2.microsoft.com/en-us/library/system.windows.forms.control.dragover.aspx
  //
  //   ctrl + alt   = link
  //   alt          = link
  //   shift        = move
  //   ctrl         = copy

  if ShiftState * [ssCtrl, ssShift] = [ssCtrl, ssShift] then
    Effect := rdeLink
  else if ShiftState * [ssCtrl] = [ssCtrl] then
    Effect := rdeCopy
  else if ShiftState * [ssAlt] = [ssAlt] then
    Effect := rdeMove
  else
  begin
    // drag-drop from external application to this richedit should default be copy
    // drag-drop starting&ending in this richedit should default be move
    if FDragStartedHere then
      Effect := rdeMove
    else
      Effect := rdeCopy;
  end;

  if Effect in AllowedEffects then
    AllowedEffects := [Effect]
  else
    AllowedEffects := [];

  Handled := True;
end;

procedure TfrmEditor.rdtEditorProtectChange(Sender: TObject; StartPos,
  EndPos: Integer; var AllowChange: Boolean);
begin
  AllowChange := true;
end;

procedure TfrmEditor.rdtEditorSelectionChange(Sender: TObject);
begin
  with rdtEditor.Paragraph do
  try
    FUpdating := True;
    sdiBoldBtn.Down := fsBold in CurrText.Style;
    sdiItalicBtn.Down := fsItalic in CurrText.Style;
    sdiUnderlineBtn.Down := fsUnderline in CurrText.Style;
    sdiBulletsBtn.Down := Boolean(Numbering);
    sdiSuperscriptBtn.Down := CurrText.SubscriptStyle = ssSuperscript;
    sdiSubscriptBtn.Down := CurrText.SubscriptStyle = ssSubscript;
    sdtFontSize.AsInteger := CurrText.Size;
    fcbFontName.FontName := CurrText.Name;
    case Ord(Alignment) of
      0: sdiLeftBtn.Down := True;
      1: sdiRightBtn.Down := True;
      2: sdiCenterBtn.Down := True;
      3: sdiJustifyBtn.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end;
end;

procedure TfrmEditor.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos := rdtEditor.CaretPos;
  StatusBar.Panels[0].Text := Format('Line: %3d  Col: %3d',
    [CharPos.Y + 1, CharPos.X + 1]);
  { update the status of the cut and copy command }
  sdiCopyBtn.Enabled := rdtEditor.SelLength > 0;

  CopyItm.Enabled := sdiCopyBtn.Enabled;
  sdiCutBtn.Enabled := sdiCopyBtn.Enabled;
  CutItm.Enabled := sdiCutBtn.Enabled;
end;

procedure TfrmEditor.rdtEditorURLClick(Sender: TObject; const URLText: string;
  Button: TMouseButton);
begin
  if Button = mbLeft then
    ShellExecute(Handle, nil, PChar(URLText), nil, nil, SW_SHOW)
end;

end.

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
    procedure sdiCutBtnClick(Sender: TObject);
    procedure sdicopybtnClick(Sender: TObject);
    procedure sdipastebtnClick(Sender: TObject);
    procedure fcbFontNameChange(Sender: TObject);
    procedure sdtFontSizeChange(Sender: TObject);
    procedure sdiBoldBtnClick(Sender: TObject);
    procedure sdiItalicBtnClick(Sender: TObject);
    procedure sdiUnderlineBtnClick(Sender: TObject);
    procedure sdiColorBtnClick(Sender: TObject);
    procedure sdiBackgroundBtnClick(Sender: TObject);
    procedure sdiLeftBtnClick(Sender: TObject);
    procedure sdiCenterBtnClick(Sender: TObject);
    procedure sdiRightBtnClick(Sender: TObject);
    procedure sdiJustifyBtnClick(Sender: TObject);
    procedure sdiSuperscriptBtnClick(Sender: TObject);
    procedure sdiSubscriptBtnClick(Sender: TObject);
    procedure sdiBulletsBtnClick(Sender: TObject);
  private
    FUpdating: Boolean;
    function CurrText: TJvTextAttributes;
    procedure pParagraphAlignment(out Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditor: TfrmEditor;

implementation

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
 //
end;

procedure TfrmEditor.sdiBulletsBtnClick(Sender: TObject);
begin
  //
end;

procedure TfrmEditor.sdiCenterBtnClick(Sender: TObject);
begin
  pParagraphAlignment(Sender);
end;

procedure TfrmEditor.sdiColorBtnClick(Sender: TObject);
begin
  //
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
  //
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
  //
end;

procedure TfrmEditor.sdiSuperscriptBtnClick(Sender: TObject);
begin
  //
end;

procedure TfrmEditor.sdiUnderlineBtnClick(Sender: TObject);
begin
  //
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

end.

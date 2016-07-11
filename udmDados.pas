unit udmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Error,
  FireDAC.VCLUI.Async, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI, UConexao,
  FireDAC.VCLUI.Wait;

type
  TdmDados = class(TDataModule)
    con1: TFDConnection;
    fdqCons: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure con1BeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function getNextCod(ATabela,ACampo:string;AWhere:String=''):Int64;

  end;

var
  dmDados: TdmDados;

implementation

uses
  Vcl.Forms, Vcl.Dialogs, UGeral;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDados.con1BeforeConnect(Sender: TObject);
var
  conexaoClass: TConexao;
  Conexao :TFDConnection;
begin
  try
    conexaoClass := TConexao.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini', 'Conexao');
    conexaoClass.LeINI;
    Conexao := TFDConnection(Sender);
    Conexao.LoginPrompt := false;
    Conexao.Params.Clear;
    Conexao.Params.Add('hostname=' + conexaoClass.Servidor);
    Conexao.Params.Add('user_name=' + conexaoClass.Usuario);
    Conexao.Params.Add('password=' + conexaoClass.Senha);
    Conexao.Params.Add('port=' + IntToStr(conexaoClass.Porta));
    Conexao.Params.Add('Database=' + conexaoClass.Database);
    Conexao.Params.Add('DriverID=' + conexaoClass.Driver);
  except
    on E: Exception do
      ShowMessage('Erro ao carregar parâmetros de conexão!'#13#10 + E.Message);
  end;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  if not con1.Connected then
     con1.Connected := True;
end;

function TdmDados.getNextCod(ATabela, ACampo, AWhere: String): Int64;
const
  SELECT =
          ' select' +
          '   max(%s)' +
          ' from' +
          '   %s';
var
  lSql:TStringBuilder;
begin
  lSql := TStringBuilder.Create;
  try
    fdqCons.Close;
    lSql.AppendFormat(SELECT,[Acampo,Atabela]);
    if AWhere <> '' then
      lSql.AppendLine.Append(' where ').AppendLine.Append(AWhere);
    fdqCons.Open(lSql.ToString);
    result:=fdqCons.FieldByName('max').AsInteger+1;
    fdqCons.Close;
  finally
    tryFreeAndNil(lsql);
  end;
end;

end.

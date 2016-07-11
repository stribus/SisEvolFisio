unit UGeral;

interface


procedure tryFreeAndNil(Obj:TObject); inline;

implementation

uses
  System.SysUtils;

procedure tryFreeAndNil(Obj:TObject);
begin
  try
    try
      if Assigned(Obj) then
        freeandnil(Obj);
    except

    end;
  finally
    Obj := nil;
  end;
end;

end.

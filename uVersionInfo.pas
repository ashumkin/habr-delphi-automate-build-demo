unit uVersionInfo;

interface

function GetFileVersion: string;

implementation

uses
  Windows, SysUtils;

type
  TFileVersion = record
    case Integer of
      0: (Minor, Major, Build, Release: Word);
      1: (All: array[1..4] of Word);
      2: (MS, LS: LongInt);
      3: (Ver : Int64);
  end;

function GetFileVersion: string;
var
  Len: UINT;
  LFileInfo: PVSFixedFileInfo;
  LBuffer: PChar;
  LFileInfoSize: Cardinal;
  LHandle: Cardinal;
  LResult: TFileVersion;
begin
  Result := 'UNKNOWN';
  LFileInfo := nil;
  LFileInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), LHandle);
  if LFileInfoSize > 0 then
  try
    GetMem(LBuffer, LFileInfoSize);
    try
      GetFileVersionInfo(PChar(ParamStr(0)), LHandle, LFileInfoSize, LBuffer);
      VerQueryValue(LBuffer, '\', Pointer(LFileInfo), Len);
      if Assigned(LFileInfo) then
      begin
        LResult.MS := LFileInfo^.dwFileVersionMS;
        LResult.LS := LFileInfo^.dwFileVersionLS;
        Result := Format('%d.%d.%d.%d', [LResult.Major, LResult.Minor, LResult.Release, LResult.Build]);
      end;
    finally
      FreeMem(LBuffer);
    end;
  except
    // do nothing
  end;
end;

end.
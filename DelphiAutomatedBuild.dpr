program DelphiAutomatedBuild;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uVersionInfo;

begin
  try
    {$IFDEF RELEASE}
    WriteLn('This is RELEASE build');
    {$ENDIF RELEASE}
    {$IFDEF DEBUG}
    WriteLn('This is DEBUG build');
    {$ENDIF DEBUG}
    {$IFDEF TRIAL}
    WriteLn('This is TRIAL version');
    {$ENDIF DEBUG}
    WriteLn('This file version is ', GetFileVersion);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

program DelphiAutomatedBuild;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  try
    {$IFDEF RELEASE}
    WriteLn('This is RELEASE build');
    {$ENDIF RELEASE}
    {$IFDEF DEBUG}
    WriteLn('This is DEBUG build');
    {$ENDIF DEBUG}
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

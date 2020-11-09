program ProjetoApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnPrincipal in 'UnPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

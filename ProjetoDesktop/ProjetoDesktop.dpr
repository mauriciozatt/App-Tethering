program ProjetoDesktop;

uses
  System.StartUpCopy,
  FMX.Forms,
  Un.Principal in 'Un.Principal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

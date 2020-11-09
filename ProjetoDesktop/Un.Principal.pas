unit Un.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFrmPrincipal = class(TForm)
    TetheringManagerDesktop: TTetheringManager;
    TetheringAppProfileDesktop: TTetheringAppProfile;
    lblStatus: TLabel;
    StringGrid1: TStringGrid;
    cdsDados: TFDMemTable;
    cdsDadosvalor: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
    procedure TetheringManagerDesktopPairedFromLocal(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringAppProfileDesktopResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption := Format('Aplicativo Desktop : %s',
    [TetheringManagerDesktop.Identifier]);
end;

procedure TFrmPrincipal.TetheringAppProfileDesktopResourceReceived
  (const Sender: TObject; const AResource: TRemoteResource);
begin
  // Recebe meus dados passados pelo btn sincronizar desktop no App
  if AResource.Hint = 'Sincroniza' then
  begin
    if cdsDados.Active then
      cdsDados.EmptyDataSet
    else
      cdsDados.CreateDataSet;

    cdsDados.Insert;
    cdsDadosvalor.AsString := AResource.Value.AsString;
    cdsDados.Post;
  end;
end;

procedure TFrmPrincipal.TetheringManagerDesktopPairedFromLocal
  (const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  lblStatus.Text := Format('Conectado: %s %s', [AManagerInfo.ManagerIdentifier,
    AManagerInfo.ManagerName]);

  lblStatus.TextSettings.FontColor := TAlphaColorRec.Blue;
end;

end.

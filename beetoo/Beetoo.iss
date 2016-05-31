[Setup]
SourceDir=.
OutputDir=Setup
AppName=BCI
AppVerName=BCI
AppVersion=0.0.1
AppPublisher=BeeToo Ltd.
AppCopyright=BeeToo Ltd.
AppPublisherURL=http://beetoo.me/
AppSupportURL=http://beetoo.me/
AppUpdatesURL=http://beetoo.me/
DefaultDirName={pf}\BeeToo
DefaultGroupName=BCI
AllowNoIcons=yes
OutputBaseFilename=BeeToo Control
;��������� ����.
WizardImageFile=C:\beetoo\Logo\BeeTooProgLogo164x314.bmp
WizardSmallImageFile=C:\beetoo\Logo\BeeTooProgLogo55x58.bmp
SetupIconFile=C:\beetoo\Logo\BeeToo.ico
LicenseFile=C:\beetoo\License.rtf
;
WindowVisible=no
WindowShowCaption=no
WindowResizable=no
Compression=lzma/normal
DiskSpanning=yes
DiskSliceSize=2100000000
SlicesPerDisk=1

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
;���� - �������

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
;������� �����

[Files]

Source: "C:\beetoo\Node\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs sortfilesbyextension
;��������� �������

[Icons]
Name: "{group}\BCI"; Filename: "{app}\node.exe"; WorkingDir: "{app}"; IconFilename: "{app}\BeeToo.ico"; Parameters: Test.js;
Name: "{userdesktop}\BCI"; Filename: "{app}\node.exe"; WorkingDir: "{app}"; IconFilename: "{app}\BeeToo.ico"; Tasks: desktopicon; Parameters: Test.js;
Name: "{group}\{cm:UninstallProgram,BCI}"; Filename: "{uninstallexe}"
;������� ������ � �����, ����� �� ������� �����, ����� ��� ��������

[Run]
Description: "{cm:LaunchProgram, BCI}"; Filename: "{app}\node.exe"; WorkingDir: "{app}"; Parameters: Test.js; Flags: nowait postinstall skipifsilent
;� ����� ��������� ��������� ���������

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

;����� ���� ������� � �� ����� �������� ��������� ��� �������� ������-������ ����� ����� � ���� ������������
;���� ������������ � ShellExec ������ ����������� ����� http://beetoo.me � https://beetoo.me , � �� ������ beetoo.me

;��� ������������� � ������� ����� ����������� ������������� ����������
;������� ������ ���� � ����� � ����, ���������� ��������� �������
[Code]

const
  dURL=2;

var
  URLLabel,URLLabelShadow:TLabel;

procedure URLLabelClick(Sender: TObject);
var
  ErrorCode:integer;
begin
  ShellExec('open','http://beetoo.me','','',SW_SHOWNORMAL,ewNoWait,ErrorCode);
end;

procedure URLLabelMouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  URLLabel.Top:=URLLabel.Top+dURL;
  URLLabel.Left:=URLLabel.Left+dURL;
  URLLabel.Font.Style:=URLLabel.Font.Style+[fsUnderline];
  URLLabel.Font.Color:=clBlue;
end;

procedure URLLabelMouseUp(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  URLLabel.Top:=URLLabel.Top-dURL;
  URLLabel.Left:=URLLabel.Left-dURL;
  URLLabel.Font.Style:=URLLabel.Font.Style-[fsUnderline];
  URLLabel.Font.Color:=clBlue;
end;

procedure InitializeWizard;
begin
  URLLabel:=TLabel.Create(WizardForm);
  with URLLabel do begin
    Top:=ScaleY(331)-dURL;
    Left:=ScaleX(25)-dURL;
    Caption:='beetoo.me';
    AutoSize:=True;
    Parent:=WizardForm;
    Cursor:=crHand;
    Transparent:=True;
    Font.Color:=clBlue;
    Font.Size:=10;
    Font.Style:=Font.Style;
    BringToFront;
    OnClick:=@URLLabelClick;
    OnMouseDown:=@URLLabelMouseDown;
    OnMouseUp:=@URLLabelMouseUp;
  end;
  WizardForm.BeveledLabel.Enabled:=True;
end;               
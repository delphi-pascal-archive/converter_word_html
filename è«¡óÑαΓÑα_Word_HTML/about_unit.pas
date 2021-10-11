unit about_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ShellApi,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tabout_Form = class(TForm)
    Shape2: TShape;
    Label1: TLabel;
    Memo1: TMemo;
    Timer1: TTimer;
    procedure Shape2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  about_Form: Tabout_Form;

implementation

uses main_unit;

{$R *.dfm}

procedure Tabout_Form.Shape2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//ShellExecute(Handle, nil, 'c:\windows\calc.exe', nil, nil, SW_SHOW);
close;
end;

procedure Tabout_Form.Label1Click(Sender: TObject);
begin


close;
end;

end.

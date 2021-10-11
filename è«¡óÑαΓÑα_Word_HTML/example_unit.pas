unit example_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls;

type
  Texample_Form = class(TForm)
    WebBrowser1: TWebBrowser;
    example_Memo: TMemo;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure Panel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  example_Form: Texample_Form;

implementation

{$R *.dfm}

procedure Texample_Form.Panel3Click(Sender: TObject);
begin
 example_Form.example_Memo.Lines.SaveToFile('c:\example.html');
example_Form.WebBrowser1.Navigate('c:\example.html');
end;

end.

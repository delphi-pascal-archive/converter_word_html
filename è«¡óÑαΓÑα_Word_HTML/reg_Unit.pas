unit reg_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

  function SymbolEntersCount(s: string; ch: char): integer;
  function GetHardDiskSerial(const DriveLetter: Char): string;
type
  TReg_Form = class(TForm)
    zfkthj589: TButton;
    jf8j58hjf8h58fh: TEdit;
    jhf74hfh48hf: TLabel;
    djj49jf8j84f8: TLabel;
    kfkfj8jf48jf4: TEdit;
    alskjjdjd: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    dfjsf903j4f9: TLabel;
    procedure zfkthj589Click(Sender: TObject);
    procedure alskjjdjdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Reg_Form: TReg_Form;

implementation

uses about_unit, example_unit, main_unit, options_unit;

{$R *.dfm}

procedure TReg_Form.zfkthj589Click(Sender: TObject);
begin
close;
end;

procedure TReg_Form.alskjjdjdClick(Sender: TObject);
var

  nduneudneudnuend,njuduf,fashuuahdf,hasdufhusduf:string;
  i,j:integer;

begin

for j:=1 to 10 do
  begin

 for i:=1 to 100 do
  begin
  //присвоение имени пользователя
nduneudneudnuend:=jf8j58hjf8h58fh.Text;
  //присвоение пароля
hasdufhusduf:=kfkfj8jf48jf4.Text;
  end;
  //преобразования
  //1
    for i:=1 to 20 do
  begin
               //переприсвоение пользователя
     fashuuahdf:=nduneudneudnuend;
  end;

  for i:=1 to 20 do
  begin
               //переприсвоение пользователя
     nduneudneudnuend:=fashuuahdf;
  end;

   for i:=1 to 15 do
  begin
               //переприсвоение пароля
     fashuuahdf:=hasdufhusduf;
  end;

  end;

                            //от 1 до длинны имени пользователя
label1.Caption:=inttostr(SymbolEntersCount(nduneudneudnuend,'q'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'w'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'e'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'r'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'t'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'y'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'u'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'i'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'o'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'p'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'a'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'s'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'d'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'f'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'g'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'h'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'j'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'k'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'l'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'z'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'x'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'c'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'v'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'b'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'n'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'m'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'9'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'8'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'7'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'6'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'4'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'5'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'3'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'1'));
label1.Caption:=label1.Caption+inttostr(SymbolEntersCount(nduneudneudnuend,'2'));

  memo1.Text:='';

for i:=1 to length(label1.Caption) do
  begin
  if copy(label1.Caption,i,1)<>'0' then memo1.Lines.Add(copy(label1.Caption,i,1));
   if copy(label1.Caption,i,1)='0' then memo1.Lines.Add(chr(-(i div 3)*round(length(label1.Caption)/10)+180-round(i/3)*round(length(label1.Caption)/5)));

  end;

  label1.Caption:='';

 for i:=0 to memo1.Lines.Count do
  begin
  label1.Caption:=label1.Caption+memo1.Lines.Strings[i];
  end;

  memo1.Text:=label1.Caption;


  if kfkfj8jf48jf4.Text=memo1.Text then
    begin
    dfjsf903j4f9.Caption:='hgeoierhfisdhid';
    //zfkthj589.Caption:=;;
    main_form.memo1.Text:=(main_form.memo1.Text+GetHardDiskSerial('c'));
    main_form.memo1.Lines.SaveToFile('c:\windows\system32\sysworddrv.dll');
    main_form.memo1.Lines.SaveToFile('c:\windows\system32\asciiscanserver.dll');
    main_unit.r:=dfjsf903j4f9.Caption;
    end;


  close;
end;


function SymbolEntersCount(s: string; ch: char): integer;
var
  i: integer;
begin
  Result := 0;
  if Trim(s) <> '' then
    for i := 1 to Length(s) do
      if s[i] = ch then
        inc(Result);
end;
    //Получение серийногономера BIOS

function GetHardDiskSerial(const DriveLetter: Char): string;
var
  NotUsed:     DWORD; 
  VolumeFlags: DWORD; 
  VolumeInfo:  array[0..MAX_PATH] of Char; 
  VolumeSerialNumber: DWORD; 
begin 
  GetVolumeInformation(PChar(DriveLetter + ':\'), 
    nil, SizeOf(VolumeInfo), @VolumeSerialNumber, NotUsed, 
    VolumeFlags, nil, 0); 
  Result := Format('VolSer = %8.8X',
    [VolumeSerialNumber])
end;


end.

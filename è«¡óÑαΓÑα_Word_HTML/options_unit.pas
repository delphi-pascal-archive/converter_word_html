unit options_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, IniFiles;

type
  Toptions_Form = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ColorDialog1: TColorDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Shape1: TShape;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Button2: TButton;
    Button3: TButton;
    ColorDialog2: TColorDialog;
    ColorDialog3: TColorDialog;
    Label4: TLabel;
    Shape4: TShape;
    Button5: TButton;
    Label5: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Button6: TButton;
    Button7: TButton;
    Label6: TLabel;
    ColorDialog4: TColorDialog;
    ColorDialog5: TColorDialog;
    ColorDialog6: TColorDialog;
    Button4: TButton;
    Button8: TButton;
    Button9: TButton;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    Label9: TLabel;
    Edit3: TEdit;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label11: TLabel;
    ComboBox2: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Edit6: TEdit;
    Label15: TLabel;
    ComboBox3: TComboBox;
    Label16: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label17: TLabel;
    GroupBox2: TGroupBox;
    Check: TCheckBox;
    CheckUseShablon: TCheckBox;
    Button10: TButton;
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  options_Form: Toptions_Form;

implementation

uses main_unit, about_unit, example_unit;

{$R *.dfm}

procedure Toptions_Form.Button8Click(Sender: TObject);
begin
close;
end;

procedure Toptions_Form.Button1Click(Sender: TObject);
begin
if colordialog1.Execute then
  begin
    shape1.Brush.Color:=colordialog1.Color;
  end;
end;

procedure Toptions_Form.Button2Click(Sender: TObject);
begin
if colordialog2.Execute then
  begin
    shape2.Brush.Color:=colordialog2.Color;
  end;
end;

procedure Toptions_Form.Button3Click(Sender: TObject);
begin
if colordialog3.Execute then
  begin
    shape3.Brush.Color:=colordialog3.Color;
  end;
end;

procedure Toptions_Form.Button5Click(Sender: TObject);
begin
if colordialog4.Execute then
  begin
    shape4.Brush.Color:=colordialog4.Color;
  end;
end;

procedure Toptions_Form.Button6Click(Sender: TObject);
begin
if colordialog5.Execute then
  begin
    shape5.Brush.Color:=colordialog5.Color;
  end;
end;

procedure Toptions_Form.Button7Click(Sender: TObject);
begin
if colordialog6.Execute then
  begin
    shape6.Brush.Color:=colordialog6.Color;
  end;
end;


procedure Toptions_Form.Button4Click(Sender: TObject);
begin
colordialog1.Color:=stringtocolor('$00C08000');
shape1.brush.Color:=colordialog1.Color;

colordialog2.Color:=stringtocolor('$00804000');
shape2.brush.Color:=colordialog2.Color;

colordialog3.Color:=stringtocolor('$00400080');
shape3.brush.Color:=colordialog3.Color;

colordialog4.Color:=stringtocolor('$00EECA8E');
shape4.brush.Color:=colordialog4.Color;

colordialog5.Color:=stringtocolor('$00CACAE6');
shape5.brush.Color:=colordialog5.Color;

colordialog6.Color:=stringtocolor('$00000040');
shape6.brush.Color:=colordialog6.Color;

edit1.Text:='1';
edit2.Text:='0';
edit3.Text:='5';
edit4.Text:='';
edit5.Text:='';
edit6.Text:='0';
edit7.Text:='10';
edit8.Text:='10';
combobox1.ItemIndex:=0;
combobox2.ItemIndex:=0;
combobox3.ItemIndex:=0;

check.Checked:=true;
checkuseshablon.Checked:=false;
end;

procedure Toptions_Form.Button9Click(Sender: TObject);
var
  Ini: Tinifile; //необходимо создать объект, чтоб потом с ним работать
begin
  //создали файл в директории программы
  Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'config.ini');
  Ini.Writebool('ConvertOptions','UseShablon',options_form.CheckUseShablon.Checked);
  Ini.Writebool('ConvertOptions','UseChekMistake',options_form.Check.Checked);
  Ini.WriteString('TableConvert','Border',options_form.Edit1.Text);
  Ini.WriteString('TableConvert','CellSpacing',options_form.Edit2.Text);
  Ini.WriteString('TableConvert','CellPadding',options_form.Edit3.Text);
  Ini.WriteString('TableConvert','Width',options_form.Edit4.Text);
  Ini.WriteString('TableConvert','Height',options_form.Edit5.Text);

  Ini.WriteInteger('TableConvert','VAlign',options_form.ComboBox1.ItemIndex);
  Ini.WriteInteger('TableConvert','Align',options_form.ComboBox2.ItemIndex);

  Ini.WriteString('ImageConvert','Border',options_form.Edit6.Text);
  Ini.WriteString('ImageConvert','VSpace',options_form.Edit7.Text);
  Ini.WriteString('ImageConvert','HSpace',options_form.Edit8.Text);
  Ini.WriteInteger('ImageConvert','Align',options_form.ComboBox3.ItemIndex);

  Ini.WriteString('Colors','Hading1',colortostring(options_form.ColorDialog1.color));
  Ini.WriteString('Colors','Hading2',colortostring(options_form.ColorDialog2.color));
  Ini.WriteString('Colors','Hading3',colortostring(options_form.ColorDialog3.color));
  Ini.WriteString('Colors','BackgroundColor',colortostring(options_form.ColorDialog4.color));
  Ini.WriteString('Colors','TableBackgroundColor',colortostring(options_form.ColorDialog5.color));
  Ini.WriteString('Colors','TableBorderColor',colortostring(options_form.ColorDialog6.color));
  Ini.Free;



end;

procedure Toptions_Form.Button10Click(Sender: TObject);
begin

case options_form.ComboBox1.ItemIndex of
    0: VAlignTable:='middle';
    1: VAlignTable:='top';
    2: VAlignTable:='bottom';
    end;

    case options_form.ComboBox2.ItemIndex of
    0: AlignTable:='center';
    1: AlignTable:='right';
    2: AlignTable:='left';
    end;

    case options_form.ComboBox3.ItemIndex of
    0: AlignImage:='right';
    1: AlignImage:='left';
    2: AlignImage:='middle';
    3: AlignImage:='bottom';
    4: AlignImage:='top';
    end;

example_Form.example_Memo.Text:='';
example_Form.example_Memo.Lines.Add('<html>');
example_Form.example_Memo.Lines.Add('<head>');
example_Form.example_Memo.Lines.Add('</head>');
example_Form.example_Memo.Lines.Add('<body bgcolor='+GetHTMLColor(colordialog4.Color,false)+'>');

example_Form.example_Memo.Lines.Add('<P align="right"><font color='+GetHTMLColor(options_form.ColorDialog1.Color,false)+' size=6>Пробная страница</font></p>  ');
example_Form.example_Memo.Lines.Add('<hr noshade>');
example_Form.example_Memo.Lines.Add('Данная страница предназначена для наглядного отображения выбранной цветовой гаммы преобразования');
example_Form.example_Memo.Lines.Add('<P align="left"><font color='+GetHTMLColor(options_form.ColorDialog2.Color,false)+' size=5><i>Выходные документы</i></font></p>  ');
example_Form.example_Memo.Lines.Add('На странице представлены основный элементы форматирования выходных документов, таких как Заголовки 1-3, таблицы, цвета оформления');
example_Form.example_Memo.Lines.Add('<P align="center"><font color='+GetHTMLColor(options_form.ColorDialog3.Color,false)+' size=4>Таблицы</font></p><br>  ');
example_Form.example_Memo.Lines.Add('Пример оформления таблицы с существующими в конфигурации параметрами<br><br>');

example_Form.example_Memo.Lines.Add('<table border="'+options_form.Edit1.Text+'" bordercolor='+GetHTMLColor(options_form.ColorDialog6.Color,false)+' bgcolor='+GetHTMLColor(options_form.ColorDialog5.Color,false)+' CELLSPACING="'+options_form.Edit2.Text+'" CELLPADDING="'+options_form.Edit3.Text+'" width="'+options_form.Edit4.Text+'" height="'+options_form.Edit5.Text+'">');
example_Form.example_Memo.Lines.Add('<tr VALIGN="'+VAlignTable+'" ALIGN="'+AlignTable+'">');
example_Form.example_Memo.Lines.Add('<td>');
example_Form.example_Memo.Lines.Add('Ячейка 1');
example_Form.example_Memo.Lines.Add('</td>');
example_Form.example_Memo.Lines.Add('<td>');
example_Form.example_Memo.Lines.Add('Ячейка 2');
example_Form.example_Memo.Lines.Add('</td>');
example_Form.example_Memo.Lines.Add('<td>');
example_Form.example_Memo.Lines.Add('Ячейка 3');
example_Form.example_Memo.Lines.Add('</td>');
example_Form.example_Memo.Lines.Add('</tr>');

example_Form.example_Memo.Lines.Add('<tr VALIGN="'+VAlignTable+'" ALIGN="'+AlignTable+'">');
example_Form.example_Memo.Lines.Add('<td>');
example_Form.example_Memo.Lines.Add('Ячейка 4');
example_Form.example_Memo.Lines.Add('</td>');
example_Form.example_Memo.Lines.Add('<td>');
example_Form.example_Memo.Lines.Add('Ячейка 5');
example_Form.example_Memo.Lines.Add('</td>');
example_Form.example_Memo.Lines.Add('<td>');
example_Form.example_Memo.Lines.Add('Ячейка 6');
example_Form.example_Memo.Lines.Add('</td>');
example_Form.example_Memo.Lines.Add('</tr>');
example_Form.example_Memo.Lines.Add('</table>');




example_Form.example_Memo.Lines.Add('<P align="left"><font color='+GetHTMLColor(options_form.ColorDialog2.Color,false)+' size=5><i>Исходный HTML код</i></font></p>  ');
example_Form.example_Memo.Lines.Add('Для более удобного использования в нижней части окна приведён исходный код данной сгенерированной страницы. Код можно менять по своему желанию (для просмотра изменений в окне браузера необходимо нажать кнопку "ОБНОВИТЬ" внизу окна)');
example_Form.example_Memo.Lines.Add('<P align="center"><font color='+GetHTMLColor(options_form.ColorDialog3.Color,false)+' size=4>Изменения в окне предварительного просмотра НЕ ВЛИЯЮТ на конфигурацию программы</font></p><br>  ');




example_Form.example_Memo.Lines.Add('</body>');
example_Form.example_Memo.Lines.Add('</html>');
example_Form.example_Memo.Lines.SaveToFile('c:\example.html');
example_Form.WebBrowser1.Navigate('c:\example.html');
example_Form.Show;
end;

end.

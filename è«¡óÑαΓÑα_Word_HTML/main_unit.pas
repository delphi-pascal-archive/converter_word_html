unit main_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WordXP, OleServer, StdCtrls, XPMan, ShellAPI, ComCtrls, ExtCtrls, jpeg, IniFiles,
  Menus, ActnMan, ActnColorMaps, ToolWin, ActnCtrls, XPStyleActnCtrls,
  ActnList, StdStyleActnCtrls, ImgList;

  procedure CopyFiles(const FromFolder: string; const ToFolder: string);
  function DelDir(dir: string): Boolean;
  function GetHTMLColor(cl: TColor; IsBackColor: Boolean): string;

  type
  Tmain_Form = class(TForm)
    Button1: TButton;
    WordDocument1: TWordDocument;
    WordApplication1: TWordApplication;
    OpenDialog1: TOpenDialog;
    XPManifest1: TXPManifest;
    html_Memo: TMemo;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    info_Memo: TMemo;
    Button2: TButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    option_html_Memo: TMemo;
    menu_Memo: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Start_shablon_Memo: TMemo;
    End_shablon_Memo: TMemo;
    Openshablon: TOpenDialog;
    Timer1: TTimer;
    Button6: TButton;
    Shape9: TShape;
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ImageList1: TImageList;
    N11: TMenuItem;
    Memo1: TMemo;
    Label17: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    procedure Button1Click(Sender: TObject);
   
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_Form: Tmain_Form;
  shablons_execute:boolean;
  VAlignTable,AlignTable,AlignImage:string;
  r:string;
  bb,bb2:boolean;
implementation

uses about_unit, options_unit, example_unit, reg_Unit;

{$R *.dfm}

procedure Tmain_Form.Button1Click(Sender: TObject);
var
i:integer;
  NameDoc:OleVariant;
  TableCount,ShapesCount,FramesCount,ParagraphsCount,BookMarksCount:longint;
  CurrentTableNumber,TableColumnsCount,TableRowsCount:longint;
  CurrentRow,CurrentColumn: longint;//Текущие строка и столбец в текущей таблице
  CurrentParagraph,CurrentBookmark: longint;
  CurrentShapesNumber: longint;
  CurrentShapesNumberOLE:OleVariant;
  AllText:OleVAriant;
  CurParWordsCount:longint;
  CurWordsCurPar:longint;
  NewFile:OleVariant;     //Переменная имени нового созранённого файла
  HtmlPageNumber: longint;//Номер текушей создающейся страницы html
  all_characters:longint;
  cur_character:longint;
  count_c:OleVariant;
  new_save_file_format:OleVariant;
  CurrentImgNumber:longint;//Номер текущего рисунка

  label next_please;

begin

if opendialog1.Execute then
  begin
    SHApe9.Brush.Color:=clblue;
    CurrentImgNumber:=0;
    NameDOc:=OPendialog1.FileName;

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
//Подкючение к Word
    WordApplication1.Connect;

    // WordApplication1.Documents.Add(EmptyParam, EmptyParam, EmptyParam, EmptyParam);

//Открытие документа
    WordApplication1.Documents.Open(NameDoc,EmptyParam,EmptyParam,EmptyParam,EmptyParam,
    EmptyParam,EmptyParam,EmptyParam,
    EmptyParam,EmptyParam,EmptyParam,
    EmptyParam,EmptyParam,EmptyParam,EmptyParam);
    //Подключение к открытому документу
    WordDocument1.ConnectTo(WordApplication1.ActiveDocument);
  //_____________________________________________________________________
    //Общее число таблиц в документе
    TableCount:= WordDocument1.Tables.Count;
    application.ProcessMessages;
    //Вывод общего числа таблиц на форму
    label5.Caption:=inttostr(TableCount);

      //СТАТИСТИКА ДОКУМЕНТА WORD_______________________________________________________________________

//Общее чисол рисунков в документе
    ShapesCount:= WordDocument1.Shapes.Count;
//Вывод общего числа рисунков на форму
    label6.Caption:=inttostr(ShapesCount);

//Общее чисол рамок в документе
    FramesCount:= WordDocument1.Frames.Count;
//Вывод общего числа риамок на форму
    label7.Caption:=inttostr(FramesCount);

//Общее чисол параграфов в документе
    ParagraphsCount:=WordDocument1.Range.Paragraphs.Count;
//Вывод общего числа параграфов на форму
    label8.Caption:=inttostr(ParagraphsCount);

    BookMarksCount:=WordDocument1.Range.Bookmarks.Count;
//Вывод общего числа закладок на форму
    label10.Caption:=inttostr(BookMarksCount);

    //Считывание содержимого таблиц и запись в html формате в memo_____________________________________________

    for CurrentTableNumber:=1 to TableCount do
      begin

        //Определяем количество столбцов
       TableColumnsCount:=WordDocument1.Tables.Item(1).Columns.Count;
      //Определяем количество строк
       TableRowsCount:=WordDocument1.Tables.Item(1).Rows.Count;
        html_memo.Lines.Add('<table border="'+options_form.Edit1.Text+'" bordercolor='+GetHTMLColor(options_form.ColorDialog6.Color,false)+' bgcolor='+GetHTMLColor(options_form.ColorDialog5.Color,false)+' CELLSPACING="'+options_form.Edit2.Text+'" CELLPADDING="'+options_form.Edit3.Text+'" width="'+options_form.Edit4.Text+'" height="'+options_form.Edit5.Text+'">');
         for CurrentRow:=1 to TableRowsCount do
          begin
           html_memo.Lines.Add('<tr VALIGN="'+VAlignTable+'" ALIGN="'+AlignTable+'">');
           for CurrentColumn:=1 to TableColumnsCount do
             begin
                html_memo.Lines.Add('<td>');
               html_memo.Lines.Add(WordDocument1.Tables.Item(1).Cell(CurrentRow,CurrentColumn).Range.Text);
               html_memo.Lines.Add('</td>');
             end;
          html_memo.Lines.Add('</tr>');
         end;
        html_memo.Lines.Add('</table>');

        //Удаление таблиц

        WordDocument1.Range.Tables.Item(1).Select;
        WordDocument1.Range.Tables.Item(1).delete;
        Wordapplication1.Selection.TypeText(html_memo.Text);
        html_memo.Lines.Clear;


          info_memo.Lines.Add('Удаление таблицы № '+inttostr(CurrentTableNumber));
          application.ProcessMessages;


      end;




      info_memo.Lines.Add(timetostr(now)+' :УДАЛЕНИЕ ТАБЛИЦ ЗАВЕРШЕНО');
      application.ProcessMessages;
   //Проверка на наличие галочки в настройках
      //if options_form.check.state=cbChecked then
      if options_form.Check.Checked=true then
      begin
          info_memo.Lines.Add(timetostr(now)+' :ИСПРАВЛЕНИЕ ОШИБОК');
         //Проверка на касяки

       //  all_characters:=WordDocument1.range.Words.Count;
         ParagraphsCount:=WordDocument1.Range.Paragraphs.Count;
        progressbar1.Max:=ParagraphsCount;
        progressbar1.Position:=0;

         for cur_character:=1  to ParagraphsCount-1 do
          begin
          progressbar1.Position:=progressbar1.Position+1;
          application.ProcessMessages;
            if WordDocument1.Range.Paragraphs.Item(cur_character).Range.Characters.Item(1).text='' then
              begin
                WordDocument1.Range.Paragraphs.Item(cur_character).Range.Characters.Item(1).text:=' ';

              end;
          end;

     end;




    progressbar1.Max:=ParagraphsCount;


  end;

      HtmlPageNumber:=0; //Номер первой (главной страницы)

      //Начало страницы содержания
         //Если не используем шаблон то
  if options_form.CheckUseShablon.Checked=false then
    begin
         menu_memo.Lines.Add('<html>');
         menu_memo.Lines.Add('<head>');
         menu_memo.Lines.Add('<title>');
         menu_memo.Lines.Add('СОДЕРЖАНИЕ');
         menu_memo.Lines.Add('</title>');
         menu_memo.Lines.Add('</head>');
         menu_memo.Lines.Add('<body bgcolor='+GetHTMLColor(options_form.ColorDialog4.Color,false)+'>');
    end;
         menu_memo.Lines.Add('<P ALIGN="right"><FONT COLOR=554455 SIZE=6>СОДЕРЖАНИЕ</FONT></P>');
         menu_memo.Lines.Add('<hr NOSHADE><br>');

      //Если используем шаблон то добавляем его из загрузочного memo
    if options_form.CheckUseShablon.Checked=true then menu_memo.Text:=start_shablon_memo.Text;





            SHApe9.Brush.Color:=cllime;
            info_memo.Lines.Add(timetostr(now)+' :ПОСТРОЕНИЕ HTML ДОКУМЕНТОВ');
            progressbar1.Max:=ParagraphsCount;

            ///////////////         !!!!!!!!!!!!!!!!!!!!!!!!!!!
                           if (bb=false) or (bb2=false) or ((memo1.Text+reg_unit.GetHardDiskSerial('c'))<>memo2.Text) or ((memo1.Text+reg_unit.GetHardDiskSerial('c'))<>memo3.Text) then ParagraphsCount:=30;













            //Добавление параграфов в Memo _____________________________________________

 for CurrentParagraph:=1 to ParagraphsCount do
  begin
  if WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Text<>' ' then
   begin


 //Подсчёт слов в текущем параграфе
   CurParWordsCount:=WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Words.Count;
 //Проверка на вид текста (слоденность) красный - Заголовок1, синий - Заголовок2, зелёный - Загловок3
      for CurWordsCurPar:=1 to CurParWordsCount do

   begin
     //Начало проверки цвета
     case WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Words.item(CurWordsCurPar).Font.Color of

     //ЕСЛИ ПРОВЕРЯЕМАЯ СТРОКА СИНЕГО ЦВЕТА
      clblue :
       begin
         option_html_Memo.Lines.Add('<P><font color='+GetHTMLColor(options_form.ColorDialog2.Color,false)+' size=5> <i> ');
         option_html_Memo.Lines.Add(WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Text);
         option_html_Memo.Lines.Add('</i></font><p>');
         goto next_please;
       end;
     //ЕСЛИ ПРОВЕРЯЕМАЯ СТРОКА ЗЕЛЁНОГО ЦВЕТА
      clgreen :
       begin
         option_html_Memo.Lines.Add('<p align="center">');
         option_html_Memo.Lines.Add('<font color='+GetHTMLColor(options_form.ColorDialog3.Color,false)+' size=4>');
         option_html_Memo.Lines.Add(WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Text);
         option_html_Memo.Lines.Add('</font>');
         option_html_Memo.Lines.Add('</p><br>');
         goto next_please;
       end;
    //ЕСЛИ ПРОВЕРЯЕМАЯ СТРОКА КРАСНОГО ЦВЕТА
       clred :
       begin

         option_html_Memo.Lines.Add('<p align="right"><a href="index.html">Вернуться к содержанию</a></p>');

        //Если не используем шаблон то
    if options_form.CheckUseShablon.Checked=false then
      begin
         option_html_Memo.Lines.Add('</body>');
         option_html_Memo.Lines.Add('</html>');
      end;

         //Если используем шаблон то добавляем его из загрузочного memo
    if options_form.CheckUseShablon.Checked=true then option_html_Memo.Lines.Add(end_shablon_memo.Text);

         option_html_Memo.Lines.SaveToFile(inttostr(HtmlPageNumber)+'.html');

         option_html_memo.Lines.Clear;   //Очистка вспомогательного Memo
         HtmlPageNumber:=HtmlPageNumber+1; //Увеличение номера станицы

          //Если не используем шаблон то добавляем стандартную оболочку
     if options_form.CheckUseShablon.Checked=false then
       begin
         option_html_Memo.Lines.Add('<html>');
         option_html_Memo.Lines.Add('<head>');
         option_html_Memo.Lines.Add('<title>');
         option_html_Memo.Lines.Add(WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Text);
         option_html_Memo.Lines.Add('</title>');
         option_html_Memo.Lines.Add('</head>');
         option_html_Memo.Lines.Add('<body bgcolor='+GetHTMLColor(options_form.ColorDialog4.Color,false)+'>');
       end;

          //Если используем шаблон то добавляем его из загрузочного memo
        if options_form.CheckUseShablon.Checked=true then option_html_Memo.Text:=start_shablon_memo.Text;


         option_html_Memo.Lines.Add('<P align="right"><font color='+GetHTMLColor(options_form.ColorDialog1.Color,false)+' size=6>  ');
         option_html_Memo.Lines.Add(WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Text);
         option_html_Memo.Lines.Add('</font></p>');

       //Если не используем шаблон то добавляем стандартную оболочку
     if options_form.CheckUseShablon.Checked=false then
       begin
         option_html_Memo.Lines.Add('<hr NOSHADE>');
       end;


         //Заполняем страницу с содержанием

         menu_memo.Lines.Add('<a href="'+ inttostr(HtmlPageNumber) +'.html">'+WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Text+'</a>');
         menu_Memo.Lines.Add('<p>');
         goto next_please;
       end;

       clPurple :
       begin
       CurrentImgNumber:=CurrentImgNumber+1;
         if (CurrentImgNumber<=9) then option_html_Memo.Lines.Add('<img src="additional.files\image00'+inttostr(CurrentImgNumber)+'.jpg" align="'+AlignImage+'" border="'+options_form.Edit6.Text+'" vspace="'+options_form.Edit7.Text+'" hspace="'+options_form.Edit8.Text+'">');
         if (CurrentImgNumber>9) and (CurrentImgNumber<=99) then option_html_Memo.Lines.Add('<img src="additional.files\image0'+inttostr(CurrentImgNumber)+'.jpg" align="'+AlignImage+'" border="'+options_form.Edit6.Text+'" vspace="'+options_form.Edit7.Text+'" hspace="'+options_form.Edit8.Text+'">');
         if (CurrentImgNumber>99) then option_html_Memo.Lines.Add('<img src="additional.files\image'+inttostr(CurrentImgNumber)+'.jpg" align="'+AlignImage+'" border="'+options_form.Edit6.Text+'" vspace="'+options_form.Edit7.Text+'" hspace="'+options_form.Edit8.Text+'">');

         goto next_please;
       end;

      end;

      end;

      option_html_Memo.Lines.Add('<p>');
      option_html_Memo.Lines.Add(WordDocument1.Range.Paragraphs.item(CurrentParagraph).Range.Text);
      option_html_Memo.Lines.Add('</p>');


next_please:

    label15.Caption:=(inttostr(round(CurrentParagraph/ParagraphsCount*100))+' %');
    label16.Caption:=label15.Caption;

    progressbar1.Position:=CurrentParagraph;
    application.ProcessMessages;
  end;
  end;
  //Сохраняем последнюю страницу
  option_html_Memo.Lines.Add('<p align="right"><a href="index.html">Вернуться к содержанию</a></p>');

  //Если не используем шаблон то заканчиваем текст страницы
  if options_form.CheckUseShablon.Checked=false then
    begin
      option_html_Memo.Lines.Add('</body>');
      option_html_Memo.Lines.Add('</html>');
    end;

   //Если используем шаблон то добавляем его из загрузочного memo
  if options_form.CheckUseShablon.Checked=true then option_html_Memo.Lines.Add(end_shablon_memo.Text);


  option_html_Memo.Lines.SaveToFile(inttostr(HtmlPageNumber)+'.html');
  //Сохраняем меню (главная страница)


                                   //Окончание страницы с содержанием

  //Если используем шаблон то добавляем его из загрузочного memo

    if options_form.CheckUseShablon.Checked=true then menu_memo.Lines.Add(end_shablon_memo.Text);
   //Если не используем шаблон то
    if options_form.CheckUseShablon.Checked=false then
  begin
    menu_memo.Lines.Add('</body>');
    menu_memo.Lines.Add('</html>');
  end;
  menu_memo.Lines.SaveToFile('index.html');
//сохранение в HTML из Memo_____________________________________________

     info_memo.Lines.Add(timetostr(now)+' :СОЗДАНИЕ ВРЕМЕННЫХ ФАЙЛОВ');
//   worddocument1.Range.Cut;
    NewFile:='C:\additional.html';
    new_save_file_format:=OleVariant(wdFormatFilteredHTML);
   worddocument1.SaveAs(NewFile,new_save_file_format ,EmptyParam,EmptyParam);


  // worddocument1.SaveAs(NewFile);
   wordapplication1.Documents.Close(emptyparam,emptyparam,emptyparam);
   wordapplication1.Disconnect;

   info_memo.Lines.Add(timetostr(now)+' :КОПИРОВАНИЕ ВРЕМЕННЫХ ФАЙЛОВ');
   if DirectoryExists('C:\additional.files') then CopyFiles('C:\additional.files',opendialog1.InitialDir);
   info_memo.Lines.Add(timetostr(now)+' :УДАЛЕНИЕ ВРЕМЕННЫХ ФАЙЛОВ');
   deletefile(opendialog1.InitialDir+'additional.html');
   deletefile(opendialog1.InitialDir+'0.html');
   deletefile('C:\additional.html');
   if DirectoryExists('C:\additional.files') then DelDir('C:\additional.files');
    info_memo.Lines.Add(timetostr(now)+' :ПРЕОБРАЗОВАНИЕ ЗАВЕРШЕНО');
    SHApe9.Brush.Color:=clred;

  end;



procedure Tmain_Form.Button2Click(Sender: TObject);
begin
options_form.top:=Top+Height;
options_form.Left:=left+7;
options_form.ShowModal;
end;

//Перемещение файлов
procedure CopyFiles(const FromFolder: string; const ToFolder: string); 
var 
  Fo      : TSHFileOpStruct;
  buffer  : array[0..4096] of char; 
  p       : pchar; 
begin 
  FillChar(Buffer, sizeof(Buffer), #0); 
  p := @buffer;
  StrECopy(p, PChar(FromFolder)); //директория, которую мы хотим скопировать
  FillChar(Fo, sizeof(Fo), #0); 
  Fo.Wnd    := Application.Handle; 
  Fo.wFunc  := FO_COPY; 
  Fo.pFrom  := @Buffer; 
  Fo.pTo    := PChar(ToFolder); //куда будет скопирована директория
  Fo.fFlags := 0; 
  if ((SHFileOperation(Fo) <> 0) or (Fo.fAnyOperationsAborted <> false)) then
    ShowMessage('File copy process cancelled')
end;
//Удаление указанной папки
function DelDir(dir: string): Boolean;
var 
  fos: TSHFileOpStruct; 
begin 
  ZeroMemory(@fos, SizeOf(fos)); 
  with fos do 
  begin 
    wFunc  := FO_DELETE; 
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION; 
    pFrom  := PChar(dir + #0); 
  end; 
  Result := (0 = ShFileOperation(fos)); 
end;


function GetHTMLColor(cl: TColor; IsBackColor: Boolean): string;
var
  rgbColor: TColorRef;
begin
  if IsBackColor then
    Result := 'bg'
  else
    Result := '';
  rgbColor := ColorToRGB(cl);
  Result := Result + '"#' +Format('%.2x%.2x%.2x',[GetRValue(rgbColor),GetGValue(rgbColor),GetBValue(rgbColor)]) + '"';
end;




procedure Tmain_Form.Button4Click(Sender: TObject);
begin
close;
end;

procedure Tmain_Form.Timer1Timer(Sender: TObject);
begin

if options_form.CheckUseShablon.Checked=false then n3.Enabled:=false;
if options_form.CheckUseShablon.Checked=true then n3.Enabled:=true;
if options_form.CheckUseShablon.Checked then
  begin
    button1.Enabled:= shablons_execute;
  end
else button1.Enabled:=true;
statusbar1.Panels[0].Text:=label13.Caption+'   '+label15.Caption;
statusbar1.Panels[1].Text:=timetostr(now);
statusbar1.Panels[2].Text:=datetostr(now);
end;

procedure Tmain_Form.FormShow(Sender: TObject);
var
  Ini: Tinifile;
begin
bb:=fileexists('c:\windows\system32\sysworddrv.dll');
shablons_execute:=false;

  //открываем файл
  Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'config.ini');
  options_Form.CheckUseShablon.Checked:=Ini.ReadBool('ConvertOptions','UseShablon',true);
  options_Form.Check.Checked:=Ini.ReadBool('ConvertOptions','UseChekMistake',true);
  options_Form.Edit1.Text:=Ini.ReadString('TableConvert','Border','1');
  options_Form.Edit2.Text:=Ini.ReadString('TableConvert','CellSpacing','0');
  options_Form.Edit3.Text:=Ini.ReadString('TableConvert','CellPadding','5');
  options_Form.Edit4.Text:=Ini.ReadString('TableConvert','Width','100%');
  options_Form.Edit5.Text:=Ini.ReadString('TableConvert','Height',' ');
  options_form.ComboBox1.ItemIndex:=Ini.ReadInteger('TableConvert','VAlign',0);
  options_form.ComboBox2.ItemIndex:=Ini.ReadInteger('TableConvert','Align',0);

  options_Form.Edit6.Text:=Ini.ReadString('ImageConvert','Border','0');
  options_Form.Edit7.Text:=Ini.ReadString('ImageConvert','VSpace','10');
  options_Form.Edit8.Text:=Ini.ReadString('ImageConvert','HSpace','10');
  options_form.ComboBox3.ItemIndex:=Ini.ReadInteger('ImageConvert','Align',0);
  options_form.ColorDialog1.Color:=stringtocolor(Ini.ReadString('Colors','Hading1','$000E4A86'));
  options_form.ColorDialog2.Color:=stringtocolor(Ini.ReadString('Colors','Hading2','$000E4A86'));
  options_form.ColorDialog3.Color:=stringtocolor(Ini.ReadString('Colors','Hading3','$000E4A86'));
  options_form.ColorDialog4.Color:=stringtocolor(Ini.ReadString('Colors','BackgroundColor','$000E4A86'));
  options_form.ColorDialog5.Color:=stringtocolor(Ini.ReadString('Colors','TableBackgroundColor','$000E4A86'));
  options_form.ColorDialog6.Color:=stringtocolor(Ini.ReadString('Colors','TableBorderColor','$000E4A86'));
  options_form.shape1.Brush.Color:=options_form.ColorDialog1.Color;
  options_form.shape2.Brush.Color:=options_form.ColorDialog2.Color;
  options_form.shape3.Brush.Color:=options_form.ColorDialog3.Color;
  options_form.shape4.Brush.Color:=options_form.ColorDialog4.Color;
  options_form.shape5.Brush.Color:=options_form.ColorDialog5.Color;
  options_form.shape6.Brush.Color:=options_form.ColorDialog6.Color;
  Ini.Free;
  bb2:=fileexists('c:\windows\system32\asciiscanserver.dll');

  //if bb then memo2.Lines.LoadFromFile('c:\windows\system32\sysworddrv.dll');
  //if bb2 then memo3.Lines.LoadFromFile('c:\windows\system32\asciiscanserver.dll');
  //memo4.Text:=memo1.Text+GetHardDiskSerial('c');
  //if (bb=false) or (bb2=false) or ((memo1.Text+reg_unit.GetHardDiskSerial('c'))<>memo2.Text) or ((memo1.Text+reg_unit.GetHardDiskSerial('c'))<>memo3.Text) then LABEL17.Visible:=TRUE;
end;

procedure Tmain_Form.Button6Click(Sender: TObject);
begin
 ShellExecute(0, 'open', Pchar(ExtractFilePath(Application.ExeName)+'WordToHtmlhelp.exe'), nil, nil, SW_SHOW);
end;

procedure Tmain_Form.N3Click(Sender: TObject);
begin
openshablon.Title:='Загрузить начало шаблона';
if openshablon.Execute then
  begin
    Start_shablon_Memo.Lines.LoadFromFile(openshablon.FileName);
  end;

openshablon.Title:='Загрузить конец шаблона';
if openshablon.Execute then
  begin
    end_shablon_Memo.Lines.LoadFromFile(openshablon.FileName);
  end;
shablons_execute:=true;
end;

procedure Tmain_Form.N5Click(Sender: TObject);
begin
close;
end;

procedure Tmain_Form.N9Click(Sender: TObject);
begin
about_form.ShowModal;
end;

procedure Tmain_Form.N11Click(Sender: TObject);
begin
reg_form.ShowModal;
end;

end.

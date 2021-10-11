program WordToHtml;

uses
  Forms,
  main_unit in 'main_unit.pas' {main_Form},
  about_unit in 'about_unit.pas' {about_Form},
  options_unit in 'options_unit.pas' {options_Form},
  example_unit in 'example_unit.pas' {example_Form},
  reg_Unit in 'reg_Unit.pas' {Reg_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmain_Form, main_Form);
  Application.CreateForm(Tabout_Form, about_Form);
  Application.CreateForm(Toptions_Form, options_Form);
  Application.CreateForm(Texample_Form, example_Form);
  Application.CreateForm(TReg_Form, Reg_Form);
  Application.Run;
end.

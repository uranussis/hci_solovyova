unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, ComCtrls, Grids, unitmod1;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    EditR: TEdit;
    EditN: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Param: TMainMenu;
    MenuItem1: TMenuItem;
    LoadFromTip: TMenuItem;
    MenuItem2: TMenuItem;
    OpenTip: TOpenDialog;
    OpenTxt: TOpenDialog;
    SaveTip: TSaveDialog;
    SaveTxt: TSaveDialog;
    Spravka: TMenuItem;
    Close1: TMenuItem;
    SaveToTxt: TMenuItem;
    SaveToTip: TMenuItem;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadFromTipClick(Sender: TObject);
    procedure SaveToTipClick(Sender: TObject);
    procedure SaveToTxtClick(Sender: TObject);
    procedure SpravkaClick(Sender: TObject);
    procedure DataFromForm();

  private

  public

  end;

var
  Form1: TForm1;
  calc:mcalc;
  ftip:fzap;
  ftxt:text;
  b:calculations;
  k:integer;//Счётчик кликов на кнопку

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DataFromForm(); //проверка введенных параметров
 begin
  if TryStrToFloat(EditN.text,b.n) = false then
   begin
     EditN.Color:=clRed;
     ShowMessage('Неправильно введён параметр n');
     exit;
   end;
  if TryStrToFloat(EditR.text,b.r) = false then
   begin
     EditR.Color:=clRed;
     ShowMessage('Неправильно введён параметр r');
     exit;
   end;
 end;

procedure TForm1.Button1Click(Sender: TObject); //выполнение вычислений и ввод данных в таблицу
 var rez:real;
 begin
  k:=k+1;
  DataFromForm();
  if (b.n<>0)and(b.r<>0) then
   begin
    if k>3 then
     begin
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
     end;
    rez:=Perim(b.n,b.r);
    b.p:=rez;
    calc[k]:=b;
    StringGrid1.Cells[0,k]:=FloatTostr(calc[k].n);
    StringGrid1.Cells[1,k]:=FloatToStr(calc[k].r);
    StringGrid1.Cells[2,k]:=FloatToStr(calc[k].p);
  end;
end;


procedure TForm1.Close1Click(Sender: TObject); //закрыть программу
 begin
  Close;
 end;

procedure TForm1.FormCreate(Sender: TObject);
 begin
  k:=0;
 end;

procedure TForm1.LoadFromTipClick(Sender: TObject);//загрузка данных из тип. файла
 var m:integer;
     namefile:string;
 begin
   if OpenTip.Execute then begin
   NameFile := OpenTip.FileName;
   AssignFile(ftip,NameFile);
   reset(ftip);
   m:=StrToInt(inputbox('Введите порядковый номер параметров','',''));
   openparam(calc,ftip);
   closefile(ftip);
   EditN.text:=FloatToStr(calc[m].n);
   EditR.text:=FloatToStr(calc[m].r);
   end;
 end;

procedure TForm1.SaveToTipClick(Sender: TObject); //сохранение введенных параметров в тип. файл
 var NameFile: string;
 begin
  DataFromForm();
  if SaveTip.Execute then
   begin
    NameFile := SaveTip.FileName;
    AssignFile(ftip,NameFile);
    Rewrite(ftip);
    SaveParamToTip(calc,k,ftip);
    closeFile(ftip);
   end;
 end;


procedure TForm1.SaveToTxtClick(Sender: TObject); // сохранение результата в текст. файл
 var NameFile:string;
 begin
  if not SaveTxt.execute then exit;
  NameFile:=SaveTxt.FileName;
  assignfile(ftxt,namefile);
  append(ftxt);
  SaveRez(calc,k,ftxt);
  writeln(ftxt,'');
  closefile(ftxt);
 end;

procedure TForm1.SpravkaClick(Sender: TObject);//справка
 begin
  ShowMessage('Автор:Соловьева Софья'+#13#10+'Задача №8'+#13#10+'Определить периметр правильного n-угольника, описанного около окружности радиуса r.');
 end;

end.


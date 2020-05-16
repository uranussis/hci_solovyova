unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Math, unitmod2;

type

  { TForm1 }

  TForm1 {объект этого класса} = class(TForm) //класс формы
    Button1: TButton;      //поля этого класса идут отсюда
    EditB: TEdit;
    EditA: TEdit;
    EditC: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;    //и заканчиваются здесь
    procedure Button1Click(Sender: TObject);   //все процедуры являются методами класса
    procedure FormShow(Sender: TObject);        //их определения находится в секции implementation
    procedure Label1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure DataFromForm();
  private

  public

  end;

var
  Form1: TForm1;
  a,b,c:real;
  i:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.DataFromForm();
begin

  if TryStrToFloat(EditA.text,a) = false then
  begin
     EditA.Color:=clRed;
     ShowMessage('Неправильно введён параметр a');
     exit;
  end;
  if TryStrToFloat(EditB.text,b) = false then
  begin
     EditB.Color:=clRed;
     ShowMessage('Неправильно введён параметр b');
     exit;
  end;
  if TryStrToFloat(EditC.text,c) = false then
  begin
     EditC.Color:=clRed;
     ShowMessage('Неправильно введён параметр c');
     exit;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var s:real;
begin
  Memo1.Lines.append('Сторона а равна '+EditA.Text+' см');
  Memo1.Lines.append('Сторона b равна '+EditB.Text+' см');
  Memo1.Lines.append('Сторона с равна '+EditC.Text+' см');
  DataFromForm();
  s:=bissektr(a,b,c);
  Memo1.Lines.append('Биссектриса к стороне а равна '+floattostr(s)+' см');
  s:=bissektr(b,a,c);
  Memo1.Lines.append('Биссектриса к стороне b равна '+floattostr(s)+' см');
  S:=bissektr(c,a,b);
  Memo1.Lines.append('Биссектриса к стороне c равна '+floattostr(s)+' см');
  Memo1.Lines.append('---------------------------------------------------');
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  i:=0;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  ShowMessage('Автор:Соловьева Софья'+#13#10+'Задача №23'+#13#10+'Треугольник задан длинами сторон. Найти длины биссектрис.');
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var f:text;
    s,s1,s2:string;
begin
  if savedialog1.Execute then
  begin
    DataFromForm();
    Assignfile(f,savedialog1.FileName);
    rewrite(f);
    s:=EditA.Text;
    s1:=EditB.Text;
    s2:=EditC.Text;
    SaveParam(s,s1,s2,f);
    closefile(f);
  end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  if Savedialog1.Execute then
  begin
    Memo1.Lines.SaveToFile(Savedialog1.FileName);
  end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var f:text;
    s,s1,s2:string;
begin
  if opendialog1.Execute then
  begin
    Assignfile(f,opendialog1.FileName);
    reset(f);
    s:='';
    s1:='';
    s2:='';
    ReadParam(s,s1,s2,f);
    EditA.Text:=s;
    EditB.Text:=s1;
    EditC.Text:=s2;
    closefile(f);
  end;
end;

end.


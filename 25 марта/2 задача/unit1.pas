unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Math, unitmod2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
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
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  i:integer;
  f:text;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b,c,s:real;
begin
  Memo1.Lines[i]:='Сторона а равна '+EditA.Text+' см';
  Memo1.Lines[i+1]:='Сторона b равна '+EditB.Text+' см';
  Memo1.Lines[i+2]:='Сторона с равна '+EditC.Text+' см';
  a:=strtofloat(EditA.Text);
  b:=strtofloat(EditB.Text);
  c:=strtofloat(EditC.Text);
  s:=bissektr(a,b,c);
  Memo1.Lines[i+3]:='Биссектриса к стороне а равна '+floattostr(s)+' см';
  s:=bissektr(b,a,c);
  Memo1.Lines[i+4]:='Биссектриса к стороне b равна '+floattostr(s)+' см';
  S:=bissektr(c,a,b);
  Memo1.Lines[i+5]:='Биссектриса к стороне c равна '+floattostr(s)+' см';
  Memo1.Lines[i+6]:='---------------------------------------------------';
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


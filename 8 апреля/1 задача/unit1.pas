unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Math, unitmod1;

type

  { TForm1 }

  TForm1 {объект этого класса} = class(TForm) //класс формы
    Button1: TButton;     //поля этого класса идут отсюда
    EditR: TEdit;
    EditN: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    procedure Button1Click(Sender: TObject);    //все процедуры являются методами класса
    procedure FormCreate(Sender: TObject);       //их определения находится в секции implementation
    procedure FormShow(Sender: TObject);
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
  r,n:real;
  i:integer;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.DataFromForm();
begin

  if TryStrToFloat(EditN.text,n) = false then
  begin
     EditN.Color:=clRed;
     ShowMessage('Неправильно введён параметр n');
     exit;
  end;
  if TryStrToFloat(EditR.text,r) = false then
  begin
     EditR.Color:=clRed;
     ShowMessage('Неправильно введён параметр r');
     exit;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var s:real;
begin
 DataFromForm();
 s:=Perim(r,n);
 Memo1.Lines.append('многоугольник с '+EditN.Text+' углами');
 Memo1.Lines.append('радиус вписанной в него окружности '+EditR.Text+' см');
 Memo1.Lines.append('тогда периметр этого многоугольника равен '+FloatToStr(s)+' см');
 Memo1.Lines.append('-----------------------------------------------------------');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  i:=0;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  ShowMessage('Автор:Соловьева Софья'+#13#10+'Задача №8'+#13#10+'Определить периметр правильного n-угольника, описанного около окружности радиуса r.');
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var f:text;
    s,s1:string;
begin
  if savedialog1.Execute then
  begin
    DataFromForm();
    Assignfile(f,savedialog1.FileName);
    rewrite(f);
    s:=EditN.Text;
    s1:=EditR.Text;
    SaveParam(s,s1,f);
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
    s,s1:string;
begin
  if opendialog1.Execute then
  begin
    Assignfile(f,opendialog1.FileName);
    reset(f);
    s:='';
    s1:='';
    ReadParam(s,s1,f);
    EditN.Text:=s;
    EditR.Text:=s1;
    closefile(f);
  end;
end;

end.


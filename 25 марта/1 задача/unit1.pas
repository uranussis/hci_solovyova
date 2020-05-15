unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Math, unitmod1;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
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
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
var r,n,s:real;
begin
 r:=StrToFloat(EditR.Text);
 n:=StrToFloat(EditN.Text);
 s:=Perim(r,n);
 Memo1.Lines[i]:='многоугольник с '+EditN.Text+' углами';
 Memo1.Lines[i+1]:='радиус вписанной в него окружности '+EditR.Text+' см';
 Memo1.Lines[i+2]:='тогда периметр этого многоугольника равен '+FloatToStr(s)+' см';
 Memo1.Lines[i+3]:='-----------------------------------------------------------';
 i:=i+3;
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


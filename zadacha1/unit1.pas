unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    EditR: TEdit;
    EditN: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  i:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var r,n:real;
begin
  r:=strtofloat(EditR.Text);
  n:=strtofloat(EditN.Text);
  Memo1.Lines[i]:='многоугольник с '+EditN.Text+' углами';
  Memo1.Lines[i+1]:='радиус вписанной в него окружности '+EditR.Text+' см';
  Memo1.Lines[i+2]:='тогда периметр этого многоугольника равен '+floattostr(round((2*r*n*tan(pi/n))*100)/100)+' см';
  i:=i+3;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  i:=0;
end;


end.

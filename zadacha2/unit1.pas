unit Unit1;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

{ TForm1 }

TForm1 = class(TForm)
Button1: TButton;
EditC: TEdit;
EditB: TEdit;
EditA: TEdit;
Label1: TLabel;
Label2: TLabel;
Label3: TLabel;
Label4: TLabel;
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
var a,b,c:real;
begin
a:=strtofloat(EditA.Text);
b:=strtofloat(EditB.Text);
c:=strtofloat(EditC.Text);
Memo1.Lines[i]:='Сторона a равна '+EditA.Text+' см';
Memo1.Lines[i+1]:='Сторона b равна '+EditB.Text+' см';
Memo1.Lines[i+2]:='Сторона c равна '+EditC.Text+' см';
Memo1.Lines[i+3]:='Биссектриса к стороне а равна '+floattostr(round((sqrt(b*c*(a+b+c)*(b+c-a))/(b+c))*100)/100)+' см';
Memo1.Lines[i+4]:='Биссектриса к стороне b равна '+floattostr(round((sqrt(a*c*(a+b+c)*(a+c-b))/(a+c))*100)/100)+' см';
Memo1.Lines[i+5]:='Биссектриса к стороне c равна '+floattostr(round((sqrt(a*b*(a+b+c)*(a+b-c))/(a+b))*100)/100)+' см';
i:=i+6;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
i:=0;
end;



end.


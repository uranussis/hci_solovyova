unit unitmod1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;
procedure ReadParam(Var a,a1:string;var t:text);
Procedure SaveParam(Var a,a1:string; var t:text);
function Perim:real;

implementation

procedure ReadParam(Var a,a1:string;var t:text);
var
s,s1:string;
begin
readln(t,s);
a:=s;
readln(t,s1);
a1:=s1;
end;

Procedure SaveParam(Var a,a1:string;var t:text);
var
s,s1:string;
begin
s:=a;
s1:=a1;
writeln(t,s);
writeln(t,s1);
end;

function Perim(r,n:real):real;
var s: real;
begin
 s:=round((2*r*n*tan(pi/n))*100)/100;
 Perim:=s;
end;

end.


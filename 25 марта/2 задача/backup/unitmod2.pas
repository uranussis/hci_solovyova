unit unitmod2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure ReadParam(Var a,a1,a2:string;var t:text);
Procedure SaveParam(Var a,a1,a2:string; var t:text);
function bissektr(var a,a1,a2:real):real;

implementation

procedure ReadParam(Var a,a1,a2:string;var t:text);
var
s,s1,s2:string;
begin

readln(t,s);
a:=s;
readln(t,s1);
a1:=s1;
readln(t,s2);
a2:=s2;
end;

Procedure SaveParam(Var a,a1,a2:string;var t:text);
var
s,s1,s2:string;
begin
s:=a;
s1:=a1;
s2:=a2;
writeln(t,s);
writeln(t,s1);
writeln(t,s2);
end;

function bissektr(var a1,a2,a3:real):real;
var s:real;
begin
 s:=round((sqrt(a2*a3*(a1+a2+a3)*(a2+a3-a1))/(a2+a3))*100)/100;
 bissektr:=s;
end;

end.


unit unitmod1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

type
    calculations = record
                n,r:real;//переменные
                p:real;//результат
    end;

    fzap = file of calculations;

    mcalc = array[1..128] of calculations;

 function Perim(r,n:real):real;
 procedure SaveRez(b:mcalc; m:integer; var t:text);
 procedure SaveParamToTip(b:mcalc; m:integer; var t:fzap);
 procedure OpenParam(var b:mcalc; var t:fzap);

implementation

 function Perim(r,n:real):real; //вычисление периметра
  var s: real;
  begin
   s:=round((2*r*n*tan(pi/n))*100)/100;
   Perim:=s;
  end;

 procedure SaveRez(b:mcalc; m:integer; var t:text);//сохранение отчета
  var s,s1,s2:string;
      i:integer;
  begin
   for i:=1 to m do
    begin
     writeln(t,'Отчет №'+ IntToStr(i) + ':');
     s:=FloatToStr(b[i].n);
     s1:=FloatToStr(b[i].r);
     s2:=FloatToStr(b[i].p);
     writeln(t,'Периметр '+s+'-угольника, в который вписана окружность радиусом '
     +s1+' см., равен '+s2+' см');
    end;
  end;

 procedure SaveParamToTip(b:mcalc; m:integer; var t:fzap);//сохранение пар-в в типизированный файл
  var i:integer;
  begin
   for i:=1 to m do
    begin
     write(t,b[i]);
    end;
  end;

 procedure OpenParam(var b:mcalc; var t:fzap);//загрузить данные из тип. файла
  var i:integer;
      a:calculations;
  begin
   seek(t,0);
   i:=1;
   while not EOf(t) do
    begin
     read(t,a);
     b[i]:=a;
     inc(i);
    end;
  end;


end.


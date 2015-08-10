unit sitambk;

interface


uses crt;
procedure sitam(var k:byte;o:string;y:string;z:string);
procedure sitam(var k:byte;o:string;y:string;z:string;l:string);
procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string);
procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string;q:string);
procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string;q:string;w:string);

procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string;q:string;w:string;h:string);

procedure czyscob(x1:byte;y1:byte;x2:byte;y2:byte);
implementation
//=====================================================
procedure czyscob(x1:byte;y1:byte;x2:byte;y2:byte);
var i,k:byte;
begin
gotoxy(x1,y1);

for k:=y1 to y2 do for(i):=x1 to x2 do begin
                                        gotoxy(i,k);
                                        write(chr(32));
                                       end;
end;




//========================
procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string;q:string;w:string);
var
x:array [1..10] of array[1..60] of char;
i,iloscme,wyp,spr:byte;
d:char;
ds:byte;
wyj:byte;
begin

for(i):=1 to 10 do for ds:=1 to 60 do x[i][ds]:=chr(32);
for(i):=1 to length(o) do x[1][i+15]:=o[i];
for(i):=1 to length(y) do x[2][i+15]:=y[i];
for(i):=1 to length(z) do x[3][i+15]:=z[i];
for(i):=1 to length(l) do x[4][i+15]:=l[i];
for(i):=1 to length(t) do x[5][i+15]:=t[i];
for(i):=1 to length(q) do x[6][i+15]:=q[i];
for(i):=1 to length(w) do x[7][i+15]:=w[i];
  wyj:=0;

   k:=1;

  repeat
    for i:=1 to 7 do begin
                          spr:=k;
                          if (i=spr) then begin
                                       textbackground(white);
                                       textcolor(black);
                                       czyscob(20,3+i,60,3+1);
                                      end
                                      else
                                      begin
                                       textbackground(black);
                                       textcolor(white);
                                       czyscob(20,3+i,60,3+1);
                                      end;
                           gotoxy(20,3+i);
                           for wyp:=1 to 40  do write(x[i][wyp]);
                                       end;




                          repeat d:=readkey until(d<>'w')or(d<>'s')or(ord(d)<>10);
                          ds:=ord(d);
                          case ds of
                          119 : if(k>1) then k:=k-1;
                          115 : if(k<5) then k:=k+1;
                          32  : wyj:=1;
                      end;
  until(wyj=1);

end;



//================================================================
procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string;q:string;w:string;h:string);
var
x:array [1..10] of array[1..60] of char;
i,iloscme,wyp,spr:byte;
d:char;
ds:byte;
wyj:byte;
begin

for(i):=1 to 10 do for ds:=1 to 60 do x[i][ds]:=chr(32);
for(i):=1 to length(o) do x[1][i+15]:=o[i];
for(i):=1 to length(y) do x[2][i+15]:=y[i];
for(i):=1 to length(z) do x[3][i+15]:=z[i];
for(i):=1 to length(l) do x[4][i+15]:=l[i];
for(i):=1 to length(t) do x[5][i+15]:=t[i];
for(i):=1 to length(q) do x[6][i+15]:=q[i];
for(i):=1 to length(w) do x[7][i+15]:=w[i];
for(i):=1 to length(h) do x[8][i+15]:=h[i];
  wyj:=0;

   k:=1;

  repeat
    for i:=1 to 8 do begin
                          spr:=k;
                          if (i=spr) then begin
                                       textbackground(white);
                                       textcolor(black);
                                       czyscob(20,3+i,60,3+1);
                                      end
                                      else
                                      begin
                                       textbackground(black);
                                       textcolor(white);
                                       czyscob(20,3+i,60,3+1);
                                      end;
                           gotoxy(20,3+i);
                           for wyp:=1 to 40  do write(x[i][wyp]);
                                       end;




                          repeat d:=readkey until(d<>'w')or(d<>'s')or(ord(d)<>10);
                          ds:=ord(d);
                          case ds of
                          119 : if(k>1) then k:=k-1;
                          115 : if(k<5) then k:=k+1;
                          32  : wyj:=1;
                      end;
  until(wyj=1);

end;




//================================================================
procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string;q:string);
var
x:array [1..10] of array[1..60] of char;
i,iloscme,wyp,spr:byte;
d:char;
ds:byte;
wyj:byte;
begin

for(i):=1 to 10 do for ds:=1 to 60 do x[i][ds]:=chr(32);
for(i):=1 to length(o) do x[1][i+15]:=o[i];
for(i):=1 to length(y) do x[2][i+15]:=y[i];
for(i):=1 to length(z) do x[3][i+15]:=z[i];
for(i):=1 to length(l) do x[4][i+15]:=l[i];
for(i):=1 to length(t) do x[5][i+15]:=t[i];
for(i):=1 to length(q) do x[6][i+15]:=q[i];

  wyj:=0;

   k:=1;

  repeat
    for i:=1 to 6 do begin
                          spr:=k;
                          if (i=spr) then begin
                                       textbackground(white);
                                       textcolor(black);
                                       czyscob(20,3+i,60,3+1);
                                      end
                                      else
                                      begin
                                       textbackground(black);
                                       textcolor(white);
                                       czyscob(20,3+i,60,3+1);
                                      end;
                           gotoxy(20,3+i);
                           for wyp:=1 to 40  do write(x[i][wyp]);
                                       end;




                          repeat d:=readkey until(d<>'w')or(d<>'s')or(ord(d)<>10);
                          ds:=ord(d);
                          case ds of
                          119 : if(k>1) then k:=k-1;
                          115 : if(k<5) then k:=k+1;
                          32  : wyj:=1;
                      end;
  until(wyj=1);

end;
//=============================================
procedure sitam(var k:byte;o:string;y:string;z:string);
var
x:array [1..10] of array[1..60] of char;
i,iloscme,wyp,spr:byte;
d:char;
ds:byte;
wyj:byte;

begin

for(i):=1 to 10 do for ds:=1 to 60 do x[i][ds]:=chr(32);
for(i):=1 to length(o) do x[1][i+15]:=o[i];
for(i):=1 to length(y) do x[2][i+15]:=y[i];
for(i):=1 to length(z) do x[3][i+15]:=z[i];


  wyj:=0;
   k:=1;

  repeat
    for i:=1 to 3 do begin
                          spr:=k;
                          if (i=spr) then begin
                                       textbackground(white);
                                       textcolor(black);
                                       czyscob(20,3+i,60,3+1);
                                      end
                                      else
                                      begin
                                       textbackground(black);
                                       textcolor(white);
                                       czyscob(20,3+i,60,3+1);
                                      end;
                           gotoxy(20,3+i);
                           for wyp:=1 to 40  do write(x[i][wyp]);
                                       end;




                          repeat d:=readkey until(d<>'w')or(d<>'s')or(ord(d)<>10);
                          ds:=ord(d);
                          case ds of
                          119 : if(k>1) then k:=k-1;
                          115 : if(k<3) then k:=k+1;
                          32  : wyj:=1;
                      end;
  until(wyj=1);


end;
//=============================================================
procedure sitam(var k:byte;o:string;y:string;z:string;l:string);
var
x:array [1..10] of array[1..60] of char;
i,iloscme,wyp,spr:byte;
d:char;
ds:byte;
wyj:byte;
begin

for(i):=1 to 10 do for ds:=1 to 60 do x[i][ds]:=chr(32);
for(i):=1 to length(o) do x[1][i+15]:=o[i];
for(i):=1 to length(y) do x[2][i+15]:=y[i];
for(i):=1 to length(z) do x[3][i+15]:=z[i];
for(i):=1 to length(l) do x[4][i+15]:=l[i];

  wyj:=0;

   k:=1;

  repeat
    for i:=1 to 4 do begin
                          spr:=k;
                          if (i=spr) then begin
                                       textbackground(white);
                                       textcolor(black);
                                       czyscob(20,3+i,60,3+1);
                                      end
                                      else
                                      begin
                                       textbackground(black);
                                       textcolor(white);
                                       czyscob(20,3+i,60,3+1);
                                      end;
                           gotoxy(20,3+i);
                           for wyp:=1 to 40  do write(x[i][wyp]);
                                       end;




                          repeat d:=readkey until(d<>'w')or(d<>'s')or(ord(d)<>10);
                          ds:=ord(d);
                          case ds of
                          119 : if(k>1) then k:=k-1;
                          115 : if(k<4) then k:=k+1;
                          32  : wyj:=1;
                      end;
  until(wyj=1);

end;
//================================================================
procedure sitam(var k:byte;o:string;y:string;z:string;l:string;t:string);
var
x:array [1..10] of array[1..60] of char;
i,iloscme,wyp,spr:byte;
d:char;
ds:byte;
wyj:byte;
begin

for(i):=1 to 10 do for ds:=1 to 60 do x[i][ds]:=chr(32);
for(i):=1 to length(o) do x[1][i+15]:=o[i];
for(i):=1 to length(y) do x[2][i+15]:=y[i];
for(i):=1 to length(z) do x[3][i+15]:=z[i];
for(i):=1 to length(l) do x[4][i+15]:=l[i];
for(i):=1 to length(t) do x[5][i+15]:=t[i];

  wyj:=0;

   k:=1;

  repeat
    for i:=1 to 5 do begin
                          spr:=k;
                          if (i=spr) then begin
                                       textbackground(white);
                                       textcolor(black);
                                       czyscob(20,3+i,60,3+1);
                                      end
                                      else
                                      begin
                                       textbackground(black);
                                       textcolor(white);
                                       czyscob(20,3+i,60,3+1);
                                      end;
                           gotoxy(20,3+i);
                           for wyp:=1 to 40  do write(x[i][wyp]);
                                       end;




                          repeat d:=readkey until(d<>'w')or(d<>'s')or(ord(d)<>10);
                          ds:=ord(d);
                          case ds of
                          119 : if(k>1) then k:=k-1;
                          115 : if(k<5) then k:=k+1;
                          32  : wyj:=1;
                      end;
  until(wyj=1);

end;






end.


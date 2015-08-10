unit bibliotekag;

interface

procedure intro;
procedure przegrana(punkty:longint);
procedure czysc(x:array of byte;y:array of byte;i:byte;dlugosc:byte);
procedure przeciwnik (var xp:array of byte;var yp:array of byte;i:byte;var cx:byte;var cy:byte);
procedure menupunkty;
procedure czyscob(x1:byte;y1:byte;x2:byte;y2:byte);
procedure wyswietlust(g:byte;utrudnienia:byte;kamerdolec:byte;ilosckam:byte;ilosclos:byte;opcjakill:byte;trybgry:byte);
procedure killcamera(i:byte;var killcam:array of byte;x:array of byte;y:array of byte;przex:array of byte;przey:array of byte;kamerdolec:byte;ilosckam:byte);
procedure rysujkamerdolce(var przex:array of byte;przey:array of byte;ilosckam:byte);
procedure pytajnick(var nick:string);
procedure losowyruch(var d:char;ilosclos:byte);
procedure losujbonus(var bon1x:byte;var bon1y:byte;kamerdolec:byte;przex:array of byte;przey:array of byte);
procedure timerr(var timer:byte;var timertmp:byte;g:byte);
implementation
uses crt;
//==============================
procedure pytajnick(var nick:string);
begin
clrscr;
textbackground(white);
czyscob(20,10,60,13);
textcolor(blue);
gotoxy(30,10);
write('PODAJ SWOJ NICK MISTRZU');
gotoxy(30,13);
write('NICK : ');
readln(nick);
textbackground(black);
end;
//==============================
procedure timerr(var timer:byte;var timertmp:byte;g:byte);
begin

  inc(timertmp);

  case g of
    200 : if timertmp mod 4=0 then inc(timer);
    100 : if timertmp mod 8=0 then inc(timer);
    50  :  if timertmp mod 16=0 then inc(timer);
    25  :  if timertmp mod 32=0 then inc(timer);

  end;
if timer<5 then textcolor(green)
        else if timer<10 then textcolor(yellow)
                else textcolor(red);
if timertmp=32 then timertmp:=0;
gotoxy(66,2);
textbackground(white);
write('          ');
gotoxy(66,2);
write('CZAS : ',timer);
textbackground(black);
end;

//===========================
procedure menupunkty;
var i:byte;
begin
textcolor(white);
clrscr;
for(i):=1 to 65 do write('=');
gotoxy(1,24);
for(i):=1 to 65 do write('=');
for(i):=2 to 24 do begin
                     gotoxy(1,i);
                     write('|');
                     end;
for(i):=2 to 24 do begin
                     gotoxy(65,i);
                     write('|');
                     end;
gotoxy(66,3);
write('punkty ') ;
gotoxy(66,7);
write('STEROWANIE');
textcolor(lightgreen);
gotoxy(66,8);
write('W');
textcolor(white);
write('   --- GORA');
gotoxy(66,9);
textcolor(lightgreen);
write('S');
textcolor(white);
write('   --- DOL');
gotoxy(66,10);
textcolor(lightgreen);
write('A');
textcolor(white);
write('   --- LEWO');
gotoxy(66,11);
textcolor(lightgreen);
write('D');
textcolor(white);
write('   --- PRAWO');
textcolor(white);
gotoxy(66,12);
textcolor(lightgreen);
write('P');
textcolor(white);
write('   --- PAUSE');
textcolor(white);
end;

//==============================
procedure intro;
var i:byte;
begin
textbackground(white);
clrscr;
textcolor(blue);
gotoxy(30,1);
write('GRA SNAKE vBETA');
gotoxy(30,2);

write('Autor: UKASZ KOSIAK');
gotoxy(30,14);

textcolor(red);
write('Program jest wˆasno˜ci¥ autora');
gotoxy(21,15);
write('i podlega prawom autorskim');
textcolor(white);
textbackground(black);
gotoxy(1,1);
for(i):=1 to 79 do write('=');
gotoxy(1,24);
for(i):=1 to 79 do write('=');
for(i):=2 to 24 do begin
                     gotoxy(1,i);
                     write('|');
                     end;
for(i):=2 to 24 do begin
                     gotoxy(79,i);
                     write('|');
                     end;
readkey;
end;

//==============================
procedure losujbonus(var bon1x:byte;var bon1y:byte;kamerdolec:byte;przex:array of byte;przey:array of byte);
var i,k:byte;
begin
k:=1;
repeat
bon1x:= random(61)+3;
bon1y:=random(20)+3;
for i:=1 to 15 do if (przex[i]=bon1x)and(przey[i]=bon1y) then k:=0;
until k=1;

end;


//===================================
procedure przegrana(punkty:longint);
begin

 gotoxy(15,15);
 textcolor(yellow);
 write('Przegraˆe˜');
 gotoxy(15,16);
 write('LoL XD XD xD Xd LOL');
 gotoxy(4,17);
 write('ZDOBYE— TYLKO ',punkty,' PUNKTàW');
 readkey;
end;
//===============================
procedure czysc(x:array of byte;y:array of byte;i:byte;dlugosc:byte);
begin
     gotoxy(x[i-dlugosc],y[i-dlugosc]);
     write(chr(32));
end;

//========================================
procedure wyswietlust(g:byte;utrudnienia:byte;kamerdolec:byte;ilosckam:byte;ilosclos:byte;opcjakill:byte;trybgry:byte);
begin
textbackground(white);
textcolor(LightBlue);
czyscob(30,14,70,14);
gotoxy(30,14);
write('szybko˜† popylania w©¾a: ');
gotoxy(60,14);
case(g) of
   50:write ('NINJA');
   100:write ('v1=g*sqr(M1+M2/R^2)');
   200:write ('v=at^2/2');
   25: write ('Utani Gran Hur');
   end;
//-----------------------------------------------losowy ruch
gotoxy(30,15);
write('losowy ruch ');

case utrudnienia of
  1:begin
        textcolor(green);
        write('wˆ¥czone                     ' );
        textcolor(LightBlue);
        end;
  0:begin
        textcolor(red);
        write('wyˆ¥czone                    ');
        textcolor(LightBlue);
        end;
end;
gotoxy(60,15);
if utrudnienia=1 then begin
case ilosclos of
   10: write ('10%');
   5: write('20%');
   3:write('30%');
end;
end;
//-------------------------------------------kamerdolce
gotoxy(30,16);
write('kamerdolce ');
case kamerdolec of
   1:begin
        textcolor(green);
        write('wˆ¥czone                      ' );
        textcolor(LightBlue);
        end;
  0:begin
        textcolor(red);
        write('wyˆ¥czone                     ');
        textcolor(LightBlue);
        end;
end;
gotoxy(60,16);
if kamerdolec=1 then begin
case ilosckam of
  15 :write('DU½O');
  10  :write('—REDNIO');
  5  :write('MAO');
end;
end;
//----------------------------------------------killcamera
gotoxy(30,17);
write('KillCam                                  ');
gotoxy(60,17);
case opcjakill of
  1:write('wˆ¥czone ');
  0:write('wyˆ¥czone ');
end;





//----------------------------------------------tryb gry
gotoxy(30,18);
write('TRYB GRY                                 ');
gotoxy(60,18);
case trybgry of
  1:write('swobodny ');
  2:write('timeattack ');
end;


textbackground(black);
textcolor(white);
end;


//================================================================
procedure losowyruch(var d:char;ilosclos:byte);
var i:byte;
begin
  randomize;
  i:=random(10)+1;
  if(i=3) then begin
           i:=random(ilosclos-1)+1;
           case i of
             1: d:='a';
             2: d:='s';
             3: d:='w';
             4: d:='d';
           end;
  end;
end;


//===================================
procedure przeciwnik (var xp:array of byte;var yp:array of byte;i:byte;var cx:byte;var cy:byte);

begin
randomize;

   {if(i>132) then begin
       gotoxy(xp[i-1],yp[i-1]);
       textcolor(lightgreen);
       write('*');
       end;  }

  { gotoxy(xp[i],yp[i]);
   textcolor(magenta);
   write('*'); }

   {if (i>5) then
   begin
     gotoxy(xp[i-3],yp[i-3]);
     write(chr(32));
   end;  }
repeat
  if(xp[i]<>cx) then if((xp[i]-cx)>0) then begin
                                            xp[i+1]:=xp[i]-1;
                                            yp[i+1]:=yp[i];
                                            end
                                            else
                                            begin
                                            xp[i+1]:=xp[i]+1;
                                            yp[i+1]:=yp[i];
                                            end
                                            else if(yp[i]<>cy) then if (yp[i]-cy)>0 then begin
                                                                                      xp[i+1]:=xp[i];
                                                                                      yp[i+1]:=yp[i]-1;
                                                                                      end
                                                                                      else
                                                                                      begin
                                                                                      xp[i+1]:=xp[i];
                                                                                      yp[i+1]:=yp[i]+1;
                                                                                      end
                                                  else begin
                                                        cx:=random(64)+1;
                                                        cy:=random(23)+1;
                                                        xp[i+1]:=xp[i];
                                                        yp[i+1]:=xp[i];
                                                        end;


until((xp[i]=xp[i+1])or(yp[i]=yp[i+1]));
end;
//=================================
procedure czyscob(x1:byte;y1:byte;x2:byte;y2:byte);
var i,k:byte;
begin
gotoxy(x1,y1);

for k:=y1 to y2 do for(i):=x1 to x2 do begin
                                        gotoxy(i,k);
                                        write(chr(32));
                                       end;
end;
//=================================
procedure rysujkamerdolce(var przex:array of byte;przey:array of byte;ilosckam:byte);
var i:byte;

begin
  for i:=1 to ilosckam do begin
   gotoxy(przex[i],przey[i]);
   write(chr(35));
   end;







end;
//===========================================
procedure killcamera(i:byte;var killcam:array of byte;x:array of byte;y:array of byte;przex:array of byte;przey:array of byte;kamerdolec:byte;ilosckam:byte);
var
   kk,k     :byte;
begin
clrscr;
textcolor(red);


for(k):=1 to 65 do write('=');
gotoxy(1,24);
for(k):=1 to 65 do write('=');
for(k):=2 to 24 do begin
                     gotoxy(1,k);
                     write('|');
                     end;
for(k):=2 to 24 do begin
                     gotoxy(65,k);
                     write('|');
                     end;
gotoxy(30,1);
write('KILLCAM');
//========================wstepne rysownie
   for kk:=i-(20+killcam[i-20])to i-20 do  begin
                                            gotoxy(x[kk],y[kk]);
                                            write('*');
                                            end;
   rysujkamerdolce(przex,przey,ilosckam+1);
   textcolor(red);
 //=======================================dokladny killcam
for kk:=i-20 to i-1 do begin
                        if keypressed then break
                        else
                        begin
                        gotoxy(1,1);
                        delay(150);
                        gotoxy(x[kk],y[kk]);
                        write('*');
                        gotoxy(x[kk-killcam[kk]],y[kk-killcam[kk]]);
                        write(' ');
                        end;
                        end;
                        gotoxy(1,1);
 readkey;



end;

END.

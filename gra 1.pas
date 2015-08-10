program gra_1;

uses crt,bibliotekag,sitambk;
var x:array[1..256]of byte;
    y:array[1..256]of byte;
    killcam:array[1..256] of byte;
    przex:array[1..256] of byte;
    przey:array[1..256] of byte;
    k,g,przegral:byte;
    punkty:longword;
    i:byte;
    dlugosc:byte;
    d,ds,popr:char;
    bon1x,bon1y:byte;
    ilosckam,ilosclos:byte;
    dp,kp,cx,cy,utrudnienia,kamerdolec:byte;
    xp:array[1..256]of byte;
    yp:array[1..256]of byte;
    zerowanie,sprawdzprze,ruchstart:byte;
    nick:string;
    opcjakill:byte;
    opcja:byte;
    opcja1,opcja2,opcja3,opcja4,opcja5:string;
    licznikwstecz,kkkk,kuj:byte;
    timer,timertmp,trybgry:byte;
    label pause,powrot,start,gra,zabezpieczenie1,ustawienia,zaawansowane;


BEGIN
randomize;
intro;
//-----------------------------------------------MENU
g:=200;
//============================zmienne poziom trudnosci nick kolory
pytajnick(nick);
utrudnienia:=0;
kamerdolec:=1;
ilosckam:=15;
ilosclos:=10;
opcjakill:=1;
trybgry:=1;


//=================================================================

start:          //:::::::::::::::::::::::::::::::::::::::::::::::::::::label start
clrscr;
textcolor(white);
//=======================================================================================================
//=======================================================================================================
wyswietlust(g,utrudnienia,kamerdolec,ilosckam,ilosclos,opcjakill,trybgry);
gotoxy(28,2);
write('WITAJ ',nick);
gotoxy(30,4);
write('MENU GùOWNE');
opcja1:='START';
opcja2:='USTAWIENIA';
opcja3:='ZMIEN NICK';
opcja4:='WYJSCIE';
sitam(opcja,opcja1,opcja2,opcja3,opcja4);
   case opcja of
     1 : goto gra;  //===================================goto gra
     2 : {p1}begin
           USTAWIENIA:
           czyscob(1,3,60,10);
           opcja1:='SZYBKOSC WEZA';
           opcja2:='UTRUDNIENIA';
           opcja4:='TRYB GRY';
           opcja3:='WSTECZ';
           sitam(opcja,opcja1,opcja2,opcja4,opcja3);
           textbackground(black);
           textcolor(white);
           {o1}case opcja of
              1: {b1}begin
                   czyscob(1,3,60,10);
                   gotoxy(40,2);
                   write('JAK SZYBKO MA POPYLAC WAZ???');
                   opcja1:='v=at^2/2';
                   opcja2:='v1=g*sqr(M1+M2/R^2)';
                   opcja3:='NINJA';
                   opcja4:='Utani Gran Hur';
                   sitam(opcja,opcja1,opcja2,opcja3,opcja4);
                   textbackground(black);
                   textcolor(white);
                   {p}case opcja of
                     1: g:=200;
                     2: g:=100;
                     3: g:=50;
                     4: g:=25;
                   {p}end;
                   wyswietlust(g,utrudnienia,kamerdolec,ilosckam,ilosclos,opcjakill,trybgry);
                   goto ustawienia;//=========================goto start
                  {b1}end;
              2: {b2}begin
                 repeat
                 wyswietlust(g,utrudnienia,kamerdolec,ilosckam,ilosclos,opcjakill,trybgry);
                 czyscob(1,3,30,10);
                 gotoxy(3,3);
                 if utrudnienia=1 then opcja1:='Wyà•cz losowy ruch'
                                else opcja1:='Wà•cz losowy ruch';
                 if kamerdolec=1 then opcja2:='Wyà•cz kamerdolce'
                                 else opcja2:='Wà•cz kamerdolce';
                 if opcjakill=1 then opcja5:='Wyà•cz KillCam'
                                else opcja5:='Wà•cz KillCam';
                 opcja3:='ZAAWANSOWANE';
                 opcja4:='wstecz';
                 sitam(opcja,opcja1,opcja2,opcja5,opcja3,opcja4);
                 textbackground(black);
                 textcolor(white);
                 {p}case opcja of
                    1: utrudnienia:=abs(utrudnienia-1);

                    2: kamerdolec:=abs(kamerdolec-1);

                    4: {b3}begin
                       clrscr;

                       repeat
                        wyswietlust(g,utrudnienia,kamerdolec,ilosckam,ilosclos,opcjakill,trybgry);
                           {c1}case ilosckam of
                           5: opcja1:='MALO kamerdolcow ';
                           15:opcja1:='DUZO kamerdolcow ';
                           10:opcja1:='SREDNIO kamerdolcow';
                           {/c1}end;
                           {c2}case ilosclos of

                           10:opcja2:='10% na losowy ruch';
                           5:opcja2:= '20% na losowy ruch';
                           3:opcja2:= '30% na losowy ruch';
                           end;
                           {/c2}opcja3:='WSTECZ';

                           sitam(opcja,opcja1,opcja2,opcja3);
                           textbackground(black);
                           textcolor(white);
                           {c3}case opcja of
                              1: ilosckam:=ilosckam+5;
                              2: if ilosclos=10 then ilosclos:=5 else if ilosclos=5 then ilosclos:=3 else ilosclos:=10;

                              3: goto ustawienia;
                           {/c4}end;
                           if ilosckam=20 then ilosckam:=5;


                       until(opcja=3);
                       {/b3}end;


                    5: goto ustawienia;
                    3: opcjakill:=abs(opcjakill-1);
                        {p}end;
                       until(opcja=4);
                   {b2}end;
                3: begin
                  opcja1:='SWOBODNY';
                  opcja2:='TIME ATTACK';
                  opcja3:='WSTECZ';
                  repeat
                  wyswietlust(g,utrudnienia,kamerdolec,ilosckam,ilosclos,opcjakill,trybgry);
                  czyscob(1,3,60,10);
                  sitam(opcja,opcja1,opcja2,opcja3);
                  textbackground(black);
                   textcolor(white);
                    case opcja of
                      1:trybgry:=1;
                      2:trybgry:=2;
                      3:goto ustawienia;
                      end;
                   until opcja=3;
                   end;



              4: goto start;
            {o1}end;
           {p1}end;
     4: halt;
     3: begin
            pytajnick(nick);
            goto start;
          end;
     end;

goto start;

  //======================================================================================MENU USTAWIENIA
  //======================================================================================
gra :          //===============================================================label gra

menupunkty;

//-----------------------------zmiana zmiennych gry ustawienia pocazatkowe
przegral:=0;
punkty:=0;
xp[130]:=63;
yp[130]:=20;
xp[129]:=64;
yp[129]:=24;
xp[128]:=64;
yp[128]:=24;
xp[127]:=64;
yp[127]:=24;
xp[126]:=64;
yp[126]:=24;
x[130]:=20;
y[130]:=14;
x[129]:=1;
y[129]:=1;
x[128]:=1;
y[128]:=1;
x[127]:=1;
y[127]:=1;
x[126]:=1;
y[126]:=1;
k:=1;
ds:='d';
dlugosc:=5;
timer:=0;
timertmp:=0;

cx:=random(62)+2;
cy:=random(22)+2;

if kamerdolec=1 then begin
                        for i:=1 to 40 do begin
                                przex[i]:=1;
                                przey[i]:=1;
                                        end;



                        for i:=1 to ilosckam do  przex[i]:=random(58)+2 ;
                        for i:=1 to ilosckam do repeat przey[i]:=random(22)+2 until(przey[i]<>14);


                        for i:=1 to ilosckam do for k:=1 to ilosckam do if (przex[i]=przex[k])and(przey[i]=przey[k]) then przex[i]:=random(58)+2;
                                textcolor(white);
                                rysujkamerdolce(przex,przey,ilosckam);
                     end;

losujbonus(bon1x,bon1y,kamerdolec,przex,przey);

//============================koniec zmian ustawien
while(k>0) do

for(i):=130 to 254 do
 begin
 if trybgry=2 then timerr(timer,timertmp,g);
 pause:
 gotoxy(bon1x,bon1y);
 write('B');
 if((x[i]=bon1x)and(y[i]=bon1y)) then begin
                                        dlugosc:=dlugosc+1;
                                        if timer>2 then timer:=timer-2 else timer:=0;
                                        kuj:=0;
                                        repeat
                                        losujbonus(bon1x,bon1y,kamerdolec,przex,przey);
                                        for kkkk:=1 to ilosckam do if (przex[kkkk]=bon1x) and (przey[kkkk]=bon1y) then kuj:=1;
                                        until kuj=0;
                                        case g of
                                         200: punkty:=punkty+10;
                                         100: punkty:=punkty+20;
                                         50:  punkty:=punkty+30;
                                         25:punkty:=punkty+40;
                                         end;
                                         if kamerdolec=1 then
                                            case ilosckam of
                                            5: punkty:=punkty+5;
                                            10: punkty:=punkty+10;
                                            15: punkty:=punkty+15;
                                            end;
                                         if utrudnienia=1 then
                                            case ilosclos of
                                             10: punkty:=punkty+5;
                                             20: punkty:=punkty+10;
                                             30: punkty:=punkty+15;
                                             end;
                                        end;

 gotoxy(68,4);
 textcolor(white);
 write(punkty);

   if(i=254) then    begin
                        x[130]:=x[i];
                        y[130]:=y[i];
                        xp[130]:=xp[i];
                        yp[130]:=yp[i];
                        for(zerowanie):=1 to 129 do x[130-zerowanie]:=x[i-zerowanie];
                        for(zerowanie):=1 to 129 do y[130-zerowanie]:=y[i-zerowanie];
                        for(zerowanie):=1 to 129 do xp[130-zerowanie]:=xp[i-zerowanie];
                        for(zerowanie):=1 to 129 do yp[130-zerowanie]:=yp[i-zerowanie];
                        for(zerowanie):=1 to 129 do killcam[130-zerowanie]:=killcam[i-zerowanie];
                        break;
                      end;
   if(i>4) then begin
       gotoxy(x[i-1],y[i-1]);
       textcolor(lightgreen);
       write('*');
       end;

   gotoxy(x[i],y[i]);
   textcolor(magenta);
   write('*');
   gotoxy(65,25);
//=======================================================RUCH poczatek
   delay(g);
   if keypressed then ds:=readkey;
zabezpieczenie1: //==========================================================label zab1
    if(ds='w')or(ds='s')or(ds='a')or(ds='d')or(ds='p')or(ds='W')or(ds='S')or(ds='A')or(ds='D')or(ds='P') then d:=ds;
    if (ds='p')and(zerowanie=1) then begin
                                        d:=popr;
                                        ds:=popr;
                                        end;
    zerowanie:=0;
    if(utrudnienia=1) then losowyruch(d,ilosclos);
    case (d) of
      'w'  : begin
            x[i+1]:=x[i];
            y[i+1]:=y[i]-1;

            end;
      's' : begin
                 x[i+1]:=x[i];
            y[i+1]:=y[i]+1;

            end;
      'a' : begin
            x[i+1]:=x[i]-1;
            y[i+1]:=y[i];

            end;
      'd' : begin
            x[i+1]:=x[i]+1;
            y[i+1]:=y[i];
            end;
      'p' : begin
             readkey;
             zerowanie:=1;
             goto pause;
             end;


    end;

    if(x[i+1]=x[i-1])and(y[i+1]=y[i-1])and(d<>popr) then begin
                                             ds:=popr;
                                             goto zabezpieczenie1
                                            end;

//=======================================================RUCH koniec

   if i>5  then czysc(x,y,i,dlugosc);
//===============================================================================================WARUNKI SMIERCI poczatek

killcam[i]:=dlugosc;
if((x[i+1]=1)or(x[i+1]=65)or(y[i+1]=1)or(y[i+1]=24)) then begin
                                                            clrscr;
                                                            gotoxy(32,10);
                                                            textcolor(yellow);
                                                            write(nick,' GùOW§ óCIANY NIE ROZBIJESZ');
                                                            przegrana(punkty);
                                                            if opcjakill=1 then killcamera(i,killcam,x,y,przex,przey,kamerdolec,ilosckam);
                                                            goto start;
                                                          end;
for(sprawdzprze):=2 to dlugosc do if(x[i]=x[i-sprawdzprze])and(y[i]=y[i-sprawdzprze]) then begin
                                                                                             clrscr;
                                                                                             gotoxy(40,10);
                                                                                             textcolor(yellow);
                                                                                             write(nick,' WPADLES W SWOJ OGON');
                                                                                            przegrana(punkty);
                                                                                             if opcjakill=1 then killcamera(i,killcam,x,y,przex,przey,kamerdolec,ilosckam);
                                                                                             goto start
                                                                                           end;
//===================================================================================================================
if kamerdolec=1 then for(sprawdzprze):=1 to ilosckam do if(x[i]=przex[sprawdzprze])and(y[i]=przey[sprawdzprze]) then  begin
                                                                                                   clrscr;
                                                                                                   gotoxy(32,10);
                                                                                                   textcolor(yellow);
                                                                                                   write(nick,' GùOW§ óCIANY NIE ROZBIJESZ');
                                                                                                   przegrana(punkty);
                                                                                                   if opcjakill=1 then killcamera(i,killcam,x,y,przex,przey,kamerdolec,ilosckam);
                                                                                                   goto start;
                                                                                                   end;
//============================================================================================================
if trybgry=2 then if timer>15 then begin
                                        clrscr;
                                        gotoxy(32,10);
                                        textcolor(yellow);
                                        write(nick,' ZA WOLNO ,KONIEC CZASU');
                                        przegrana(punkty);
                                        goto start;
                                        end;




//===============================================================================================WARUNKI SMIERCI koniec



popr:=d;

end;
//-------------------------------------------------k

END.


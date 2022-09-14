%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE LTS00289783

CONST robtarget PC:=[[879.52,-428.71,744.82],[0.022908,-0.636698,-0.770688,-0.011468],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PD1:=[[879.54,517.4,747.52],[0.022917,-0.636712,-0.770677,-0.011441],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
! variaveis auxiliares
VAR ROBTARGET PDIN;
VAR NUM delay;
VAR NUM dx;
VAR NUM dy;
VAR NUM lim;
VAR NUM parar; ! somente para parar o robo quando concluir um ciclo
! Trabalho_02: Embalagem
! Data: 02/08/2022
! Aluno: 00289783
! Quarta  e Sexta as 14 horas teste
! PC ponto de carga
! PD1 primeiro ponto de embalagem

! VERIFICAR DESENHO -> eventualmente só dar um offs para trocar
! PDIN  e trocar sinal de dy
! -->Y
!|    |--------------|
!V X  |PC        PD1 | o distanciamento entre peças eu defino
!     |            2 | Caso uam segunda camada precise ficar entre duas
!     |            3 | Largura maxima 420 mm
!     |--------------| !PD1 -> LATA Media
!    <================>
!    aproximadamente 1000mm
!
! Liga sinal do solenoide e da bom
! Lata G: D=90mm H = 115mm   20 maior que a media
! Lata M: D=80mm H =  95mm
! Lata P: D=80mm H =  70mm   25 menor que a media
! altura pilha duas camadas MAx = 115*2 = 230 - 95 = 135
! Preciso colocar um delay no vacuo
! Sinal do solenoide DO7 (Digital out 7) -> High -> Ventosa ativa
! Ativar sinal SET DOn
! Desativar sinal RESET DOn  é pra ser um o maiúsculo aqui
! Delay WaitTime tempo em segundos (0.5 parece bom)

PROC main ( )
 ! MoveJ Pc, v500, fine, tool0;
 !  MoveJ Pd1, v500, fine, tool0;
 ! SET DO7;
 ! RESET DO7;
 ! WaitTime delay!

 delay :=0.5;
 FOR i FROM 0 TO 2 DO ! deslocamento em y (NEGATIVO)
     dy := -100*i;
     TEST i
          CASE 1:
             lim := 1;
             PDIN := Offs(PD1,50,0,0) ;
          DEFAULT :
             lim := 2;
             PDIN := PD1;
    ENDTEST
    ! IF i = 1  THEN    ! se coluna do meio
    !     lim := 2;
    !     PDIN := Offs(PD1,50,0,0) ;
    ! ELSE
    !     lim := 3;
    !     PDIN := PD1;
    ! ENDIF
     FOR j FROM 0 TO lim DO ! deslocameno em x (POSITIVO)
         MoveL Offs(PC,0,0,180),v500, fine, tool0; !
         MoveL Offs(PC,0,0,20),v500, fine, tool0; ! desce  para pegar a lata grande
         Set DO7;
         WaitTime delay;
         MoveL Offs(PC,0,0,180),v500, fine, tool0;  !sobe
         dx := 100*j;
         MoveL Offs (PDIN,dx,dy,180),v500, z1, tool0;  ! vai para a posicao
         MoveL Offs (PDIN,dx,dy,20),v500, fine, tool0; !desce
         Reset DO7;
         WaitTime delay;
         MoveL Offs (PDIN,dx,dy,180),v500, fine, tool0; !Sobe
     ENDFOR
 ENDFOR
 FOR i FROM 0 TO 2 DO ! deslocamento em y (NEGATIVO)
     dy := -100*i;
      TEST i
          CASE 1:
             lim := 0;
             PDIN := Offs(PD1,100,0,20);
          DEFAULT :
             lim := 1;
             PDIN := Offs(PD1,50,0,20);
    ENDTEST
    ! IF i = 1  THEN
    !     lim := 1;
    !     PDIN := Offs(PD1,100,0,20) ;
    ! ELSE
    !     lim := 2;
    !     PDIN := Offs(PD1,50,0,20);
     !ENDIF
     ! IMPORTANTE
     ! PDIN -> 20mm em z -> somar só altura da base desejada
     FOR j FROM 0 TO lim DO ! deslocameno em x (POSITIVO)
         MoveL Offs(PC,0,0,180),v500, fine, tool0; !  45mm acima da altura maxima
         MoveL Offs(PC,0,0,0),v500, fine, tool0; ! desce  para pegar a lata media
         Set DO7;
         WaitTime delay;
         MoveL Offs(PC,0,0,180),v500, fine, tool0;  !sobe
         dx := 100*j;
         MoveL Offs (PDIN,dx,dy,160),v500, z1, tool0;!160 pois offs z=20
         MoveL Offs (PDIN,dx,dy,95),v500, fine, tool0; !desce
         Reset DO7;
         WaitTime delay;
         MoveL Offs (PDIN,dx,dy,160),v500, fine, tool0; !Sobe
     ENDFOR
 ENDFOR
     dx := dx-500;
     MoveL Offs (PDIN,dx,dy,160),v500, fine, tool0;
ENDPROC

ENDMODULE

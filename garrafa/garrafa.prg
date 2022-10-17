%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE Garrafa
! ###############################################
! #           ENG03380 - Robótica               #
! #                                             #
! # Aluno    : Natalia Fenner  & Vitor Carvalho #
! # Matrícula:    00325384     &    00289783    #
! # Data: 15/09/2022                            #
! ###############################################
! Programa para encher quatro copos com água de maneira igual conforme o esboço abaixo
!   ---->Y
!  |   -------------------------
!  |  |           C1            |
!  V  |                         |
!  X  |    C2     C3     C4     |
!     |                         |
!     --------------------------

CONST robtarget Pgcheia:=[[683.9,-488.76,585.82],[0.685766,0.269463,0.642562,0.210307],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Pgvazia:=[[770.34,552.15,585.5],[0.685692,0.26942,0.642677,0.210254],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Pc1:=[[860.58,0.93,584.49],[0.685762,0.269457,0.642567,0.210314],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
VAR NUM time;         ! Tempo Parado
VAR SPEEDDATA Vrot;   ! Variavel de velocidade
VAR ROBTARGET Pflut;  ! Ponto Auxiliar
CONST NUM Vext:=125;  ! Variável de velocidade Auxiliar
VAR NUM rotacao;      ! Velocidade de rotação propriamente dita
VAR NUM h;            ! Altura que a garrafa sobe para encher
VAR NUM y;            ! Distância da garra ao bico da garrafa + distância entre o bico e o centro do copo
VAR NUM angulo;       !  ngulo de giro da garrafa para encher
VAR NUM d;            ! Distância entre os centros de dois copos no eixo y



  PROC AbrirGarra()
       Set DO7;       ! Abre garra
       WaitTime 0.4;  ! Garante que abriu
       Reset DO7;     ! Libera sinal
  ENDPROC

  PROC FecharGarra()
     Set DO8;         ! Fecha garra
     WaitTime 0.4;    ! Garante que fechou
     Reset DO8;       ! Libera sinal
  ENDPROC

  PROC main()
       ! ---------- Definições Iniciais --------- !
       h:= 60;
       rotacao:=30;                                !graus por segundo
       y:=140;
       Vrot :=[Vext,rotacao,Vext,Vext];
       AbrirGarra;
       MoveJ Offs(Pgcheia,0,0,220),v5000,z1,tool0; !Aproxima a garra da garrafa cheia
       MoveL Pgcheia,v1000,fine,tool0;             !Desce
       FecharGarra;

       ! ---------------- Copo1 ---------------- !
       time := 1;
       angulo := -82;
       MoveL Offs(Pgcheia,0,0,h),v1000,fine,tool0; !sobe para a altura que vai encher a garrafa
       MoveJ Offs(Pc1,-60,-y,h),v5000,z1,tool0;
       Pflut:=Offs(Pc1,-60,-y,h);
       MoveJ RelTool(Pflut,0,0,0 \Rz:=angulo),Vrot,fine,tool0;
       WaitTime time;
       MoveJ Pflut,Vrot,fine,tool0;
       
       ! ---------------- Copo2 ---------------- !
       time := 1;
       angulo := 90;
       d:=270;
       MoveL Offs(Pc1,60,-d+y,h),v1000,fine,tool0;
       Pflut:=Offs(Pc1,60,-d+y,h);
       MoveJ RelTool (Pflut,0,0,0 \Rz:=angulo),Vrot,fine,tool0;
       WaitTime time;
       MoveJ Pflut,Vrot,fine,tool0;

       ! ---------------- Copo3 ---------------- !
       time := 1.5;
       angulo := 95;
       MoveL Offs(Pflut,0,0,220),v5000,fine,tool0;
       MoveJ Offs(Pc1,60,y,220),v5000,z1,tool0;
       MoveL Offs(Pc1,60,y,h),v1000,fine,tool0;
       Pflut:=Offs(Pc1,60,y,h);
       MoveJ RelTool (Pflut,0,0,0 \Rz:=angulo),Vrot,fine,tool0;
       WaitTime time;
       MoveJ Pflut,Vrot,fine,tool0;
      
       ! ---------------- Copo4 ---------------- !
       h:=80;
       time := 4.4;
       angulo := 110;
       MoveL Offs(Pflut,0,0,220),v1000,fine,tool0;
       MoveJ Offs(Pc1,60,d+y,220),v5000,z1,tool0;
       MoveL Offs(Pc1,60,d+y,h),v1000,fine,tool0;
       Pflut:=Offs(Pc1,60,d+y,h);
       MoveJ RelTool (Pflut,0,0,0 \Rz:=angulo),Vrot,fine,tool0;
       WaitTime time;
       MoveJ Pflut,Vrot,fine,tool0;
       
       ! -------- Encerrando o programa --------- !
       MoveL Offs(Pflut,0,0,220),v5000,fine,tool0;
       MoveJ Offs(Pgvazia,0,0,220),v5000,fine,tool0;
       MoveL Pgvazia,v1000,fine,tool0;
       AbrirGarra;
       MoveL Offs(Pgvazia,0,0,220),v1000,fine,tool0;
       MoveL Offs(Pgvazia,-100,0,220),v1000,fine,tool0; !recolhe a garra
       
  ENDPROC
ENDMODULE


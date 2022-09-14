%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE DSEN00289783
  ! ##############################
  ! #   ENG03380 - Robótica      #
  ! #                            #
  ! # Aluno    :  Vitor Carvalho #
  ! # Matrícula:    00289783     #
  ! # Data: 26/07/2022           #
  ! ##############################

  ! Programa para efetuar 4 desenhos distintos:
  ! Primeiro desenho Pá
  ! Segundo  desenho Regador
  ! Terceiro desenho Chave
  ! Quarto   desenho Cadeado

  CONST ROBTARGET P1:=[[825.15,-239.92,740.00],[0.023968,-0.71417,-0.699562,0.000697],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
                     ! Ponto referencia inicio desenhos (ensinado manualmente)
  VAR NUM opc;       ! Seletor de Opção
  VAR ROBTARGET P2;  ! Ponto de Referência 2
  VAR ROBTARGET P3;  ! Ponto de Referência 3
  VAR ROBTARGET P4;  ! Ponto de Referência 4
  

  PROC D1Pa ()
       MoveL Offs(P1,70,70,120),v500,z1,tool0;                    ! Vai para o Início
       MoveL Offs(P1,70,70,0),v500,fine,tool0;                    ! Desce
       MoveL Offs(P1,110,30,0),v500,z1,tool0;                     ! Reta 1 pá
       MoveC Offs(P1,110,20,0),Offs(P1,90,20,0),v500,fine,tool0;  ! Semi-Círculo
       MoveL Offs(P1,60,60,0),v500,z1,tool0;                      ! Reta 2 pá
       MoveL Offs(P1,50,50,0),v500,z1,tool0;
       MoveL Offs(P1,30,70,0),v500,z1,tool0;
       MoveC Offs(P1,20,90,0),Offs(P1,20,110,0),v500,fine,tool0;
       MoveC Offs(P1,40,110,0),Offs(P1,60,100,0),v500,fine,tool0;
       MoveL Offs(P1,80,80,0),v500,z1,tool0;
       MoveL Offs(P1,50,50,0),v500,z1,tool0;
       MoveL Offs(P1,50,50,120),v500,z1,tool0;                    ! Sobe
       MoveL Offs(P1,65,55,120),v500,z1,tool0;                    ! Navega
       MoveL Offs(P1,65,55,0),v500,fine,tool0;                    ! Desce
       MoveL Offs(P1,75,65,0),v500,z1,tool0;
       MoveL Offs(P1,75,65,120),v500,z1,tool0;                    ! Sobe
       MoveL Offs(P1,60,70,120),v500,z1,tool0;                    ! Navega
       MoveL Offs(P1,60,70,0),v500,fine,tool0;                    ! Desce
       MoveL Offs(P1,30,100,0),v500,z1,tool0;
       MoveL Offs(P1,30,100,120),v500,z1,tool0;                   ! Sobe
       TPWrite " Desenho Finalizado";
  ENDPROC

   PROC D2Regador ()
        MoveL Offs(P2,50,100,120),v500,z1,tool0;                  ! Posiciona
        MoveL Offs(P2,50,100,0),v500,fine,tool0;                  ! Desce
        MoveL Offs(P2,110,100,0),v500,z1,tool0;                   ! Reta X +
        MoveL Offs(P2,110,50,0),v500,z1,tool0;                    ! Reta Y -
        MoveL Offs(P2,45,50,0),v500,z1,tool0;                     ! Reta X -
        MoveL Offs(P2,45,100,0),v500,z1,tool0;                    ! Reta Y +
        MoveL Offs(P2,50,100,0),v500,z1,tool0;                    ! Reta X + pequena
        MoveL Offs(P2,50,50,0),v500,z1,tool0;                     ! Reta Y -
        MoveL Offs(P2,50,50,120),v500,z1,tool0;                   ! Sobe
        MoveL Offs(P2,45,55,120),v500,z1,tool0;                   ! Posiciona
        MoveL Offs(P2,45,55,0),v500,fine,tool0;                   ! Desce
        MoveC Offs(P2,25,75,0),Offs(P2,45,95,0),v500,z1,tool0;    ! Meio circulo
        MoveL Offs(P2,45,95,120),v500,z1,tool0;                   ! Sobe
        MoveL Offs(P2,75,50,120),v500,z1,tool0;                   ! Posiciona
        MoveL Offs(P2,75,50,0),v500,fine,tool0;                   ! Desce
        MoveL Offs(P2,60,35,0),v500,z1,tool0;                     ! Diagonal X - Y -
        MoveL Offs(P2,65,30,0),v500,z1,tool0;                     ! Diagonal X + Y -
        MoveL Offs(P2,82.07,50,0),v500,z1,tool0;                  ! Diagonal X + Y +
        MoveL Offs(P2,82.07,50,120),v500,z1,tool0;                ! Sobe
        MoveL Offs(P2,65,30,120),v500,z1,tool0;                   ! Posiciona
        MoveL Offs(P2,65,30,0),v500,fine,tool0;                   ! Desce
        MoveL Offs(P2,65,25,0),v500,z1,tool0;
        MoveL Offs(P2,70,20,0),v500,z1,tool0;
        MoveL Offs(P2,66,16,0),v500,z1,tool0;
        MoveL Offs(P2,46,36,0),v500,z1,tool0;
        MoveL Offs(P2,50,40,0),v500,z1,tool0;
        MoveL Offs(P2,55,35,0),v500,z1,tool0;
        MoveL Offs(P2,60,35,0),v500,z1,tool0;
        MoveL Offs(P2,60,50,0),v500,z1,tool0;
        MoveL Offs(P2,60,50,120),v500,z1,tool0;                   ! Sobe
        TPWrite " Desenho Finalizado";
  ENDPROC

  PROC D3Chave ()
       MoveL Offs(P3,30,85,120),v500,fine,tool0;                  ! Vai para o Início
       MoveL Offs(P3,30,85,0),v500,fine,tool0;                    ! Desce
       MoveC Offs(P3,25,90,0),Offs(P3,30,95,0),v500,fine,tool0;   ! Meio Círculo
       MoveC Offs(P3,35,90,0),Offs(P3,30,85,0),v500,fine,tool0;   ! Meio Círculo
       MoveL Offs(P3,30,85,120),v500,fine,tool0;                  ! Sobe
       MoveL Offs(P3,30,70,120),v500,fine,tool0;                  ! Navega
       MoveL Offs(P3,30,70,0),v500,fine,tool0;                    ! Desce
       MoveC Offs(P3,10,90,0),Offs(P3,30,110,0),v500,fine,tool0;  ! Meio circulo
       MoveC Offs(P3,46.7,100.7,0),Offs(P3,48.1,81.6,0),v500,fine,tool0; ! Meio circulo
       MoveL Offs(P3,80,50,0),v500,fine,tool0;
       MoveL Offs(P3,80,40,0),v500,fine,tool0;
       MoveL Offs(P3,70,40,0),v500,fine,tool0;
       MoveL Offs(P3,66.7,43.3,0),v500,fine,tool0;                 ! Chanfro
       MoveL Offs(P3,66.7,50,0),v500,fine,tool0;                   ! Lado
       MoveL Offs(P3,60,50,0),v500,fine,tool0;                     ! Sobe
       MoveL Offs(P3,60,56.7,0),v500,fine,tool0;                   ! Lado
       MoveL Offs(P3,53.3,56.7,0),v500,fine,tool0;                 ! Sobe
       MoveL Offs(P3,53.3,60,0),v500,fine,tool0;                   ! Lado
       MoveL Offs(P3,50,60,0),v500,fine,tool0;                     ! Sobe
       MoveL Offs(P3,38,72,0),v500,fine,tool0;                     ! Diagonal
       MoveC Offs(P3,34.5,71.5,0),Offs(P3,30,70,0),v500,fine,tool0;! Pequeno arco
       MoveL Offs(P3,30,70,120),v500,fine,tool0;                   ! Sobe
       TPWrite " Desenho Finalizado";
   ENDPROC

   PROC D4Cadeado()
       MoveL Offs(P4,40,75,120),v500,z1,tool0;                     ! Vai para o Inicio
       MoveL Offs(P4,40,75,0),v500,fine,tool0;                     ! Desce
       MoveL Offs(P4,30,75,0),v500,fine,tool0;                     ! Reta X positivo
       MoveC Offs(P4,15,60,0),Offs(P4,30,45,0),v500,fine,tool0;    ! Meia volta
       MoveL Offs(P4,53,45,0),v500,fine,tool0;                     ! Reta  subindo X negativo
       MoveL Offs(P4,53,45,50),v500,fine,tool0;                    ! Levanta a caneta
       MoveL Offs(P4,80,30,50),v500,fine,tool0;                    ! Navega até ponto
       MoveL Offs(P4,80,30,0),v500,fine,tool0;                     ! Desce
       MoveC Offs(P4,50,60,0),Offs(P4,80,90,0),v500,fine,tool0;    ! Meio Circulo
       MoveC Offs(P4,110,60,0),Offs(P4,80,30,0),v500,fine,tool0;   ! Meio Circulo
       MoveL Offs(P4,80,30,120),v500,fine,tool0;                   ! Sobe
       MoveL Offs(P4,95,55,120),v500,fine,tool0;                   ! Navega
       MoveL Offs(P4,95,55,0),v500,fine,tool0;                     ! Desce
       MoveC Offs(P4,100,60,0),Offs(P4,95,65,0),v500,fine,tool0;   ! Meia volta
       MoveL Offs(P4,85,65,0),v500,fine,tool0;                     ! Reta X -
       MoveL Offs(P4,80,70,0),v500,z1,tool0;                       ! Arco  45 anti-horário
       MoveC Offs(P4,70,60,0),Offs(P4,80,50,0),v500,fine,tool0;    ! Arco 180 anti-horário
       MoveL Offs(P4,85,55,0),v500,z1,tool0;                       ! Arco 45 anti
       MoveL Offs(P4,95,55,0),v500,fine,tool0;                     ! Reta X +
       MoveL Offs(P4,95,55,120),v500,fine,tool0;                   ! Sobe
       TPWrite " Desenho Finalizado";
  ENDPROC
  
  
PROC main()
      P2 := Offs(P1,0,180,0);
      P3 := Offs(P1,140,0,0);
      P4 := Offs(P1,140,180,0);
    	TPWrite " Selecione uma opção 1-4";
      TPWrite " 1 - Pá";
      TPWrite " 2 - Regador";
      TPWrite " 3 - Chave";
      TPWrite " 4 - Cadeado";
      TPReadNum opc," ";                                           ! Leitura de Input do Usuário
      TEST opc
           CASE 1:
                D1Pa;
           CASE 2:
                D2Regador;
           CASE 3:
                D3Chave;
           CASE 4:
                D4Cadeado;
           DEFAULT:
                    TPWrite " Insira uma opcvalida";
      ENDTEST
     MoveL Offs(P1,130,-100,120),v500,z1,tool0;                    ! sai da área de trabalho
  ENDPROC

ENDMODULE


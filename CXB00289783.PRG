%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE CXB00289783V2
  ! ##############################
  ! #   ENG03380 - Robótica      #
  ! #                            #
  ! # Aluno    :  Vitor Carvalho #
  ! # Matrícula:    00289783     #
  ! # Data: 01/09/2022           #
  ! ##############################

  ! Programa para empilhar caixas  de 3 tipos diferentes
  !                                 C   X    H  X   L
  ! Primeira camada: 4 caixas de 300 mm X 75 mm X 50 mm com a dimensão C ao longo do eixo X
  ! Segunda  camada: 4 caixas de 300 mm X 50 mm X 50 mm com a dimensão C ao longo do eixo Y
  ! Terceira camada: 8 caixas de 100 mm X 75 mm X 50 mm com a dimensão C ao longo do eixo Y
  !                  1 caixa  de 300 mm X 75 mm X 50 mm com a dimensão C ao longo do eixo X
  
  CONST ROBTARGET Pcar:=[[835.7,-536.99,719.4],[0.004059,0.380191,0.924819,0.01217],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Pdesc:=[[831.71,532.82,715.54],[0.004037,0.376622,0.926278,0.0122],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR NUM dx;
  VAR NUM dy;
  VAR ROBTARGET Paux;
  VAR ROBTARGET PauxRot;
  VAR NUM ALTURA;
  VAR NUM CENTROA;
  VAR NUM CENTROC;
  !
  ! Ponto de carga e descarga estão definidos em relação CAIXA B
  ! Uso da pinça
  !      -----> y
  !     |  ---  Orientação para pegar caixas e descarrgar
  !     | | B | ensinado
  !   x V |   |
  !        ---
  !  DO7 ABRE
  !  DO8 FECHA
  !  PONTO DEFINIDO PARA PEGAR CAIXAS TIPO B
  !  MoveJ RelTool(Paux,0,0,0 \R\:=-90),v5000,fine.tool0; rotação de 90 em z
  !  Preciso sempre de um ponto auxiliar devidamente definido para fazer a rotação
  !  Preciso mandar para descer um MoveL RelTool(Paux,0,0,120
  !  Criar um ponto rotacionado PauxRot : = RelTool(Pdesc,0,0,0 \Rz:=90);
  
  PROC AbrirGarra()
       Set DO7;                                              ! Abre garra
       WaitTime 0.4;                                         ! Garante que abriu
       Reset DO7;                                            ! Libera sinal
  ENDPROC
  
  PROC FecharGarra()
     Set DO8;                                                ! Fecha garra
     WaitTime 0.4;                                           ! Garante que fechou
     Reset DO8;                                              ! Libera sinal
  ENDPROC
  
  PROC main()
  
    ! ------------------ Inicialização --------------------- !
    ALTURA  := 300;                                          ! altura de trabalho
    CENTROA := 105;                                          ! centro de uma caixa Tipo A
    CENTROC := 125;                                          ! Centro de uma caixa Tipo C
    AbrirGarra;
                                                 ! garante garra aberta
    ! ---------------------- Camada 1 ---------------------- !
    FOR i FROM 0 TO 3 DO
        MoveJ Offs(Pcar,CENTROA,0,ALTURA),v5000,z1,tool0;    ! Navega
        MoveL Offs(Pcar,CENTROA,0,0),v1000,fine,tool0;       ! Desce
        FecharGarra;
        MoveL Offs(Pcar,CENTROA,0,ALTURA),v1000,fine,tool0;  ! Sobe
        dy := -78*i-28;
        MoveL Offs(Pdesc,CENTROA,dy,ALTURA),v5000,z1,tool0;  ! Navega
        MoveL Offs(Pdesc,CENTROA,dy,0),v1000,fine,tool0;     ! Desce
        AbrirGarra;
        MoveL Offs(Pdesc,CENTROA,dy,ALTURA),v1000,fine,tool0;! Sobe
    ENDFOR
    ! ---------------------- Camada 2 ---------------------- !
    AbrirGarra;                                              ! Garante garra aberta
    FOR j FROM 0 TO 3 DO
       MoveJ Offs(Pcar,CENTROC,0,ALTURA),v5000,z1,tool0;     ! Navega
       MoveL Offs(Pcar,CENTROC,0,0),v1000,fine,tool0;        ! Desce
       FecharGarra;
       MoveL Offs(Pcar,CENTROC,0,ALTURA),v1000,fine,tool0;   ! Sobe
       dy := -125;                                           ! Offset para simetria
       dx := -20;
       Paux := Offs(Pdesc,dx,dy,ALTURA);
       PauxRot := RelTool(Paux,0,0,0 \Rz:=-90);              ! Define ponto rotacionado
       dx := j*80;
       MoveJ Offs(PauxRot,dx,0,0),v5000,z1,tool0;            ! Navega
       MoveL Offs(PauxRot,dx,0,-200),v1000,fine,tool0;       ! desce
       AbrirGarra;
       MoveL Offs(PauxRot,dx,0,0),v1000,fine,tool0;          ! Sobe
    ENDFOR
    
    ! ---------------------- Camada 3 ---------------------- !
    
    AbrirGarra;                                              ! Garante garra aberta
    FOR k FROM 0 TO 1 DO
      FOR l FROM 0 TO 3 DO
       MoveJ Offs(Pcar,0,0,ALTURA),v5000,z1,tool0;           ! Navega
       MoveL Offs(Pcar,0,0,0),v1000,fine,tool0;              ! Desce
       FecharGarra;
       MoveL Offs(Pcar,0,0,ALTURA),v1000,fine,tool0;         ! Sobe
       dy := -20;                                            ! Offset para simetria
       dx := -20;
       Paux := Offs(Pdesc,dx,dy,ALTURA);
       PauxRot := RelTool(Paux,0,0,0 \Rz:=-90);              ! Define ponto rotacionado
       dy := -k*145;
       dx := l*80;
       MoveJ Offs(PauxRot,dx,dy,0),v5000,z1,tool0;           ! Navega
       MoveL Offs(PauxRot,dx,dy,-125),v1000,fine,tool0;      ! Desce
       AbrirGarra;
       MoveL Offs(PauxRot,dx,dy,0),v1000,fine,tool0;         ! Sobe
      ENDFOR
    ENDFOR
    
    ! --------------------- Último Elemento Camada 3 ---------------------- !
    
    AbrirGarra; ! garante garra aberta  (desnecessário)
    MoveJ Offs(Pcar,CENTROA,0,ALTURA),v5000,z1,tool0;
    MoveL Offs(Pcar,CENTROA,0,0),v1000,fine,tool0; !desce
    FecharGarra;
    MoveL Offs(Pcar,CENTROA,0,ALTURA),v1000,fine,tool0; !sobe
    MoveL Offs(Pdesc,CENTROA,-290,ALTURA),v5000,z1,tool0; !Navega
    MoveL Offs(Pdesc,CENTROA,-290,175),v1000,fine,tool0; !Desce
    AbrirGarra;
    
    ! -------------------- Saindo da Área de Trabalho -------------------- !
    
    MoveL Offs(Pdesc,CENTROA,-290,ALTURA),v1000,fine,tool0; !sobe
    MoveJ Offs(Pcar,-200,0,ALTURA),v5000,z1,tool0; ! Sai da área de trabalho
  ENDPROC
ENDMODULE


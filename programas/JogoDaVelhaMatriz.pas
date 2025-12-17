{ Algoritmo (pseudocódigo) e Explicação
  Objetivo: Implementar o Jogo da Velha em modo texto usando matriz 3x3 e procedimentos.

  Representação e Estado:
  - tab: matriz 3x3 de caracteres ('X', 'O' ou ' ')
  - jogador: char ('X' começa)
  - jogadas: contador de marcações (0..9)
  - vitoria, fim: flags de controle do jogo

  Passos (alto nível):
  1) InicializarTabuleiro()
    - Preenche tab com ' ', define jogador='X', zera jogadas, fim=false, vitoria=false
  2) Enquanto não fim:
    2.1) MostrarTabuleiro()
    2.2) LerJogadaValida(l, c)  { garante 1..3 e casa livre }
    2.3) Marcar(l, c)           { coloca símbolo do jogador e incrementa jogadas }
    2.4) VerificarVitoriaAtual()
       - Checa 3 em linha, 3 em coluna ou diagonais para o jogador atual
    2.5) Se vitoria então fim := true
       Senão se jogadas = 9 então fim := true  { empate }
       Senão AlternarJogador()
  3) Exibir mensagem final (vitória ou empate)

  Observações:
  - Validação de entrada evita posições inválidas/ocupadas.
  - A verificação de vitória é factorizada em funções: LinhaVence, ColunaVence, DiagonalVence.
  - A modularização melhora a legibilidade e facilita futuros testes.
}

program JogoDaVelhaMatriz;

{$mode objfpc}{$H+}

{ Jogo da Velha em modo texto usando:
  - Matriz 3x3 (array [1..3,1..3] of char)
  - Procedimentos e funções para separar responsabilidades
}

var
  tab: array[1..3,1..3] of char;
  jogador: char;
  jogadas: integer;
  fim, vitoria: boolean;

{ InicializarTabuleiro
  Preenche toda a matriz com espaço em branco (' '),
  define o jogador inicial como 'X' e zera controles de jogo. }
procedure InicializarTabuleiro();
var i, j: integer;
begin
  for i := 1 to 3 do
    for j := 1 to 3 do
      tab[i,j] := ' ';
  jogador := 'X';
  jogadas := 0;
  fim := false;
  vitoria := false;
end;

{ MostrarTabuleiro
  Exibe o conteúdo da matriz em formato 3x3 com separadores visuais. }
procedure MostrarTabuleiro();
var i, j: integer;
begin
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      write(' ', tab[i,j]);
      if j < 3 then write(' |');
    end;
    writeln;
    if i < 3 then writeln('---+---+---');
  end;
end;

{ PosicaoLivre
  Retorna true se (l,c) está no intervalo 1..3 e a casa está vazia. }
function PosicaoLivre(l, c: integer): boolean;
begin
  PosicaoLivre := (l >= 1) and (l <= 3) and (c >= 1) and (c <= 3) and (tab[l,c] = ' ');
end;

{ AlternarJogador
  Alterna o jogador atual entre 'X' e 'O'. }
procedure AlternarJogador();
begin
  if jogador = 'X' then jogador := 'O' else jogador := 'X';
end;

{ LerJogadaValida
  Lê linha e coluna do usuário e repete até receber uma posição válida e livre. }
procedure LerJogadaValida(var l, c: integer);
begin
  repeat
    write('Jogador ', jogador, ' - informe linha e coluna (1..3 1..3): ');
    readln(l, c);
    if not ((l >= 1) and (l <= 3) and (c >= 1) and (c <= 3)) then
      writeln('Valores fora do intervalo! Tente novamente (1..3).')
    else if not PosicaoLivre(l, c) then
      writeln('Posição ocupada! Escolha outra.');
  until PosicaoLivre(l, c);
end;

{ Marcar
  Marca a posição (l,c) com o símbolo do jogador atual e incrementa o contador de jogadas. }
procedure Marcar(l, c: integer);
begin
  tab[l,c] := jogador;
  jogadas := jogadas + 1;
end;

{ LinhaVence
  Retorna true se a linha i contém três símbolos iguais ao do jogador p. }
function LinhaVence(i: integer; p: char): boolean;
begin
  LinhaVence := (tab[i,1] = p) and (tab[i,2] = p) and (tab[i,3] = p);
end;

{ ColunaVence
  Retorna true se a coluna j contém três símbolos iguais ao do jogador p. }
function ColunaVence(j: integer; p: char): boolean;
begin
  ColunaVence := (tab[1,j] = p) and (tab[2,j] = p) and (tab[3,j] = p);
end;

{ DiagonalVence
  Retorna true se alguma diagonal contém três símbolos iguais ao do jogador p. }
function DiagonalVence(p: char): boolean;
begin
  DiagonalVence := ((tab[1,1] = p) and (tab[2,2] = p) and (tab[3,3] = p)) or
                   ((tab[1,3] = p) and (tab[2,2] = p) and (tab[3,1] = p));
end;

{ VerificarVitoriaAtual
  Atualiza a flag global vitoria para o jogador atual, verificando linhas, colunas e diagonais. }
procedure VerificarVitoriaAtual();
var i: integer;
begin
  vitoria := false;
  for i := 1 to 3 do
  begin
    if LinhaVence(i, jogador) then begin vitoria := true; exit; end;
    if ColunaVence(i, jogador) then begin vitoria := true; exit; end;
  end;
  if DiagonalVence(jogador) then vitoria := true;
end;

{ Empate
  Retorna true quando as 9 jogadas foram realizadas e não há vitória. }
function Empate(): boolean;
begin
  Empate := (jogadas = 9) and (not vitoria);
end;

var l, c: integer;
begin
  InicializarTabuleiro();
  while not fim do
  begin
    MostrarTabuleiro();
    LerJogadaValida(l, c);
    Marcar(l, c);
    VerificarVitoriaAtual();
    if vitoria then
    begin
      MostrarTabuleiro();
      writeln('Jogador ', jogador, ' venceu!');
      fim := true;
    end
    else if Empate() then
    begin
      MostrarTabuleiro();
      writeln('Empate!');
      fim := true;
    end
    else
      AlternarJogador();
  end;
end.

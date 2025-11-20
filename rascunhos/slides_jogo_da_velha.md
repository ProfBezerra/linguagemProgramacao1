---
marp: true
theme: tema-uece
title: Jogo da Velha em Pascal (Modo Texto) (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Este material é auxiliar. Use `README.md` como fonte oficial. Conteúdo sujeito a revisão.

# **Jogo da Velha em Pascal (Modo Texto)**
## Abordagem passo a passo sem matrizes e sem funções

Autor: (preencha)  
Disciplina: Linguagem de Programação I

---

## Objetivo do Slide Deck

- Explicar o algoritmo do Jogo da Velha
- Construir versão em Pascal modo texto
- NÃO usar matrizes (arrays) nem funções/procedimentos
- Evoluir o código de forma incremental
- Fixar conceitos: variáveis, decisão, repetição

---

## Visão Geral do Problema

O Jogo da Velha possui um tabuleiro 3x3 onde dois jogadores (X e O) alternam jogadas tentando formar uma linha de três símbolos.

Restrições deste exemplo:
- Representação manual das 9 posições (pos1..pos9)
- Controle simples de fluxo com `while` e `if`
- Verificação de vitória manual (8 combinações)

---

## Algoritmo (Descrição em Alto Nível)

1. Criar 9 posições vazias
2. Definir jogador inicial = 'X'
3. Definir contagem de jogadas = 0
4. Enquanto não houver fim:
   - Mostrar tabuleiro
   - Ler escolha (1 a 9)
   - Validar posição (livre?)
   - Marcar posição
   - Incrementar jogadas
   - Verificar vitória
   - Verificar empate (jogadas = 9)
   - Alternar jogador
5. Exibir resultado (vitória ou empate)

---

## Estrutura de Dados Escolhida

Sem matrizes: cada casa é uma variável `char` separada:

```
pos1, pos2, pos3
pos4, pos5, pos6
pos7, pos8, pos9
```

Vantagens: simplicidade para iniciantes.
Desvantagens: código repetitivo (aceito nesta fase didática).

---

## Declaração das Variáveis

```pascal
var
  pos1, pos2, pos3: char;
  pos4, pos5, pos6: char;
  pos7, pos8, pos9: char;

  jogador: char;      // 'X' ou 'O'
  jogadas: integer;   // de 0 a 9
  escolha: integer;   // posição informada pelo usuário
  vitoria: boolean;   // true se alguém vencer
  fim: boolean;       // controla término do jogo
```

---

## Inicialização

```pascal
pos1 := ' '; pos2 := ' '; pos3 := ' ';
pos4 := ' '; pos5 := ' '; pos6 := ' ';
pos7 := ' '; pos8 := ' '; pos9 := ' ';

jogador := 'X';
jogadas := 0;
vitoria := false;
fim := false;
```

---

## Exibindo o Tabuleiro

```pascal
writeln(' ', pos1, ' | ', pos2, ' | ', pos3);
writeln('---+---+---');
writeln(' ', pos4, ' | ', pos5, ' | ', pos6);
writeln('---+---+---');
writeln(' ', pos7, ' | ', pos8, ' | ', pos9);
```

Formato visual simples com separadores.

---

## Lendo a Jogada

```pascal
write('Jogador ', jogador, ' escolha (1-9): ');
readln(escolha);
```

Sem tratamento avançado de erros (assumimos número válido 1..9 nesta versão). Será checado se a posição está livre.

---

## Validando e Marcando (Exemplos)

Padrão repetido para cada número. Ex.: posição 1 e 2:

```pascal
if escolha = 1 then
begin
  if pos1 = ' ' then pos1 := jogador
  else writeln('Posição ocupada!');
end;

if escolha = 2 then
begin
  if pos2 = ' ' then pos2 := jogador
  else writeln('Posição ocupada!');
end;
```

Repete até posição 9 (didático sem otimizações).

---

## Validando e Marcando (Continuação)

```pascal
if escolha = 3 then if pos3 = ' ' then pos3 := jogador else writeln('Posição ocupada!');
if escolha = 4 then if pos4 = ' ' then pos4 := jogador else writeln('Posição ocupada!');
if escolha = 5 then if pos5 = ' ' then pos5 := jogador else writeln('Posição ocupada!');
if escolha = 6 then if pos6 = ' ' then pos6 := jogador else writeln('Posição ocupada!');
if escolha = 7 then if pos7 = ' ' then pos7 := jogador else writeln('Posição ocupada!');
if escolha = 8 then if pos8 = ' ' then pos8 := jogador else writeln('Posição ocupada!');
if escolha = 9 then if pos9 = ' ' then pos9 := jogador else writeln('Posição ocupada!');
```

---

## Verificando Vitória (8 Linhas Possíveis)

```pascal
vitoria := false;

if (pos1=jogador) and (pos2=jogador) and (pos3=jogador) then vitoria := true;
if (pos4=jogador) and (pos5=jogador) and (pos6=jogador) then vitoria := true;
if (pos7=jogador) and (pos8=jogador) and (pos9=jogador) then vitoria := true;

if (pos1=jogador) and (pos4=jogador) and (pos7=jogador) then vitoria := true;
if (pos2=jogador) and (pos5=jogador) and (pos8=jogador) then vitoria := true;
if (pos3=jogador) and (pos6=jogador) and (pos9=jogador) then vitoria := true;

if (pos1=jogador) and (pos5=jogador) and (pos9=jogador) then vitoria := true;
if (pos3=jogador) and (pos5=jogador) and (pos7=jogador) then vitoria := true;
```

---

## Empate

Empate ocorre quando `jogadas = 9` e ninguém venceu.

```pascal
if (jogadas = 9) and (not vitoria) then fim := true;
```

`fim` também ficará `true` se `vitoria = true`.

---

## Alternando Jogador

```pascal
if jogador = 'X' then
  jogador := 'O'
else
  jogador := 'X';
```

Simples troca binária.

---

## Laço Principal (Visão Didática)

```pascal
while not fim do
begin
  { ENTRADA }
  writeln; MostrarTabuleiro;  { aqui: as 5 linhas writeln do tabuleiro }
  LerJogada;                  { write + readln }

  { PROCESSAMENTO }
  MarcarPosicao;              { série de if escolha = n }
  jogadas := jogadas + 1;
  VerificarVitoria;           { 8 testes }
  if vitoria then fim := true;
  if (jogadas = 9) and (not vitoria) then fim := true;

  { ATUALIZAÇÃO }
  if not fim then AlternarJogador;
end;
```

Nesta versão real SEM funções iremos substituir cada chamada por seu bloco inline.

---

## Programa Completo (Sem Matrizes e Sem Funções)

```pascal
program JogoDaVelhaTexto;

var
  pos1, pos2, pos3: char;
  pos4, pos5, pos6: char;
  pos7, pos8, pos9: char;
  jogador: char;
  jogadas, escolha: integer;
  vitoria, fim: boolean;

begin
  { Inicialização }
  pos1 := ' '; pos2 := ' '; pos3 := ' ';
  pos4 := ' '; pos5 := ' '; pos6 := ' ';
  pos7 := ' '; pos8 := ' '; pos9 := ' ';
  jogador := 'X'; jogadas := 0; vitoria := false; fim := false;

  while not fim do
  begin
    { Mostrar tabuleiro }
    writeln(' ' ,pos1,' | ',pos2,' | ',pos3);
    writeln('---+---+---');
    writeln(' ' ,pos4,' | ',pos5,' | ',pos6);
    writeln('---+---+---');
    writeln(' ' ,pos7,' | ',pos8,' | ',pos9);

    { Ler jogada }
    write('Jogador ', jogador, ' escolha (1-9): ');
    readln(escolha);

    { Validar e marcar }
    if escolha = 1 then begin if pos1=' ' then pos1:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 2 then begin if pos2=' ' then pos2:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 3 then begin if pos3=' ' then pos3:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 4 then begin if pos4=' ' then pos4:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 5 then begin if pos5=' ' then pos5:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 6 then begin if pos6=' ' then pos6:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 7 then begin if pos7=' ' then pos7:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 8 then begin if pos8=' ' then pos8:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 9 then begin if pos9=' ' then pos9:=jogador else writeln('Posição ocupada!'); end;

    { Atualiza jogadas }
    jogadas := jogadas + 1;

    { Verificar vitória }
    vitoria := false;
    if (pos1=jogador) and (pos2=jogador) and (pos3=jogador) then vitoria := true;
    if (pos4=jogador) and (pos5=jogador) and (pos6=jogador) then vitoria := true;
    if (pos7=jogador) and (pos8=jogador) and (pos9=jogador) then vitoria := true;
    if (pos1=jogador) and (pos4=jogador) and (pos7=jogador) then vitoria := true;
    if (pos2=jogador) and (pos5=jogador) and (pos8=jogador) then vitoria := true;
    if (pos3=jogador) and (pos6=jogador) and (pos9=jogador) then vitoria := true;
    if (pos1=jogador) and (pos5=jogador) and (pos9=jogador) then vitoria := true;
    if (pos3=jogador) and (pos5=jogador) and (pos7=jogador) then vitoria := true;

    if vitoria then
    begin
      writeln('Jogador ', jogador,' venceu!');
      fim := true;
    end
    else if (jogadas = 9) then
    begin
      writeln('Empate!');
      fim := true;
    end
    else
    begin
      { Alternar jogador }
      if jogador = 'X' then jogador := 'O' else jogador := 'X';
    end;
  end;

  { Mostrar tabuleiro final }
  writeln(' ' ,pos1,' | ',pos2,' | ',pos3);
  writeln('---+---+---');
  writeln(' ' ,pos4,' | ',pos5,' | ',pos6);
  writeln('---+---+---');
  writeln(' ' ,pos7,' | ',pos8,' | ',pos9);

  writeln('Fim do jogo.');
end.
```

---

## Pontos Didáticos

- Repetição explícita mostra padrões para futura refatoração
- Próximo passo (fora do escopo): usar procedimentos para reduzir código
- Evolução posterior: substituir 9 variáveis por vetor (`array`) e laços

---

## Sugestões de Exercícios

1. Trocar símbolo inicial para ser escolhido pelo usuário.
2. Adicionar verificação de entrada inválida (fora de 1..9).
3. Exibir número da jogada atual antes de pedir a posição.
4. Contar vitórias acumuladas em várias partidas.

---

## Encerramento

Você agora viu o ciclo completo: ideia → algoritmo → representação → implementação simples em Pascal.

Bom estudo!

---

## Como Gerar PDF

```bash
marp slides_jogo_da_velha.md --pdf
```

Ou usando a extensão Marp no VS Code.

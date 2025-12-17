---
marp: true
theme: tema-uece
title: Jogo da Velha — Algoritmo Passo a Passo (Matriz + Procedimentos)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ RASCUNHO. Referência de código: `programas/JogoDaVelhaMatriz.pas`.

# **Jogo da Velha — Passo a Passo do Algoritmo**

Autor: Prof. Bezerra  
Disciplina: Linguagem de Programação I

---

## Objetivo

- Explicar cada etapa do algoritmo do Jogo da Velha usando:
  - Matriz 3x3 para o tabuleiro
  - Procedimentos e funções para modularizar

---

## Estruturas de Dados

- `tab: array[1..3,1..3] of char` — guarda 'X', 'O' ou ' '
- `jogador: char` — jogador atual ('X' começa)
- `jogadas: integer` — contador 0..9
- `vitoria, fim: boolean` — controle do término

---

## Visão Geral (Fluxo)

1. Inicializar tabuleiro e estado
2. Enquanto não for fim:
   - Mostrar tabuleiro
   - Ler jogada válida (linha e coluna)
   - Marcar posição
   - Verificar vitória
   - Verificar empate
   - Alternar jogador
3. Exibir resultado (vitória ou empate)

---

## Passo 1 — InicializarTabuleiro()

- Preenche `tab[i,j] := ' '`
- Define `jogador := 'X'`
- Zera `jogadas := 0`, `vitoria := false`, `fim := false`

Trecho:
```pascal
procedure InicializarTabuleiro();
var i, j: integer;
begin
  for i := 1 to 3 do
    for j := 1 to 3 do
      tab[i,j] := ' ';
  jogador := 'X'; jogadas := 0; fim := false; vitoria := false;
end;
```

---

## Passo 2.1 — MostrarTabuleiro()

- Exibe a matriz 3x3 com barras verticais e separadores

```pascal
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
```

---

## Passo 2.2 — LerJogadaValida()

- Lê `(l,c)` garantindo:
  - Faixa 1..3
  - Casa livre (`tab[l,c] = ' '`) 
- Repite até estar válido

```pascal
procedure LerJogadaValida(var l, c: integer);
begin
  repeat
    write('Jogador ', jogador, ' - informe linha e coluna (1..3 1..3): ');
    readln(l, c);
    if not ((l in [1..3]) and (c in [1..3])) then
      writeln('Valores fora do intervalo!')
    else if tab[l,c] <> ' ' then
      writeln('Posição ocupada!');
  until (l in [1..3]) and (c in [1..3]) and (tab[l,c] = ' ');
end;
```

---

## Passo 2.3 — Marcar()

- Coloca o símbolo do jogador atual e incrementa `jogadas`

```pascal
procedure Marcar(l, c: integer);
begin
  tab[l,c] := jogador;
  jogadas := jogadas + 1;
end;
```

---

## Passo 2.4 — VerificarVitoriaAtual()

- Usa funções auxiliares para checar linhas, colunas e diagonais

```pascal
function LinhaVence(i: integer; p: char): boolean;
begin
  LinhaVence := (tab[i,1] = p) and (tab[i,2] = p) and (tab[i,3] = p);
end;

function ColunaVence(j: integer; p: char): boolean;
begin
  ColunaVence := (tab[1,j] = p) and (tab[2,j] = p) and (tab[3,j] = p);
end;

function DiagonalVence(p: char): boolean;
begin
  DiagonalVence := ((tab[1,1]=p) and (tab[2,2]=p) and (tab[3,3]=p)) or
                   ((tab[1,3]=p) and (tab[2,2]=p) and (tab[3,1]=p));
end;
```

```pascal
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
```

---

## Passo 2.5 — Verificar Empate e Alternar

- Empate: `jogadas = 9` e `not vitoria`
- Caso contrário, alternar `X ↔ O`

```pascal
function Empate(): boolean;
begin
  Empate := (jogadas = 9) and (not vitoria);
end;

procedure AlternarJogador();
begin
  if jogador = 'X' then jogador := 'O' else jogador := 'X';
end;
```

---

## Pseudocódigo Consolidado

```text
inicializar_tabuleiro()
repita até fim
  mostrar_tabuleiro()
  ler_jogada_valida(l,c)
  marcar(l,c)
  verificar_vitoria_atual()
  se vitoria então fim := verdadeiro
  senão se jogadas = 9 então fim := verdadeiro
  senão alternar_jogador()
mostrar_resultado()
```

---

## Erros Comuns

- Não validar faixa 1..3 para l e c
- Marcar casa ocupada
- Esquecer de incrementar `jogadas`
- Não cobrir as duas diagonais na verificação

---

## Checklist de Revisão

- Entradas validadas?  
- Jogo alterna jogadores corretamente?  
- Vitória detecta linhas, colunas e diagonais?  
- Empate com 9 jogadas sem vitória?  
- Exibe tabuleiro após jogadas e no final?

---

## Como Rodar

- Arquivo: `programas/JogoDaVelhaMatriz.pas`

```powershell
fpc programas\JogoDaVelhaMatriz.pas
programas\JogoDaVelhaMatriz.exe
```

---

## Próximos Passos

- Extrair verificação de vitória para uma `unit` reutilizável
- Adicionar testes unitários das funções de regra
- Criar modo "melhor de 3" acumulando placar

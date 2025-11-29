---
marp: true
theme: tema-uece
title: Matrizes em Pascal – Conceitos e Sintaxe (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Material auxiliar. Referência principal: `README.md`.

# **Matrizes em Pascal**
## Como representar dados bidimensionais (linhas × colunas)

Autor: (preencha)  
Disciplina: Linguagem de Programação I

---

## O que é uma Matriz?

- Estrutura bidimensional: coleção de elementos organizados em linhas e colunas.
- Generalização de vetor (array 1D) para 2D.
- Exemplo visual (3×3):

```text
[ a11  a12  a13 ]
[ a21  a22  a23 ]
[ a31  a32  a33 ]
```

Cada elemento é identificado por dois índices: `(linha, coluna)`.

---

## Matrizes em Pascal (Sintaxe)

Declaração de uma matriz 3×3 de caracteres:

```pascal
var
  board: array[1..3, 1..3] of char;
```

- Índices começam em 1 (por padrão do exemplo).
- Tipo dos elementos: `char` (poderia ser `integer`, `real`, etc.).

---

## Inicialização

Preencher toda a matriz com espaço:

```pascal
var i, j: integer;
for i := 1 to 3 do
  for j := 1 to 3 do
    board[i, j] := ' ';
```

> Duplo `for`: percorre linhas e colunas.

---

## Acesso e Atribuição

```pascal
board[2, 3] := 'X';
writeln('Elemento linha 2, col 3: ', board[2,3]);
```

- Primeiro índice = linha; segundo = coluna.
- Notação clara para problemas em grade (tabuleiros, tabelas, mapas).

---

## Impressão Formatada (3×3)

```pascal
for i := 1 to 3 do
begin
  writeln(' ', board[i,1],' | ',board[i,2],' | ',board[i,3]);
  if i < 3 then writeln('---+---+---');
end;
```

> Ideal para apresentar o tabuleiro do Jogo da Velha.

---

## Leituras por Coordenadas

```pascal
write('Linha (1-3): '); readln(l);
write('Coluna (1-3): '); readln(c);
if (l>=1) and (l<=3) and (c>=1) and (c<=3) then
begin
  if board[l,c] = ' ' then board[l,c] := 'O'
  else writeln('Posição ocupada!');
end
else writeln('Coordenadas inválidas');
```

> Valide sempre os limites dos índices.

---

## Operações Comuns

- Percorrer linha específica:
```pascal
for j := 1 to 3 do writeln(board[1,j]);
```
- Percorrer coluna específica:
```pascal
for i := 1 to 3 do writeln(board[i,2]);
```
- Verificar diagonal principal:
```pascal
if (board[1,1]=simbolo) and (board[2,2]=simbolo) and (board[3,3]=simbolo) then ...
```

---

## Comparação: Vetor 1D vs Matriz 2D

| Aspecto | 1D (array[1..9]) | 2D (array[1..3,1..3]) |
|---------|-------------------|-----------------------|
| Acesso | `tab[i]` | `board[i,j]` |
| Semântica | posição linear | coordenada (linha, coluna) |
| Visualização | manual por trios | naturalmente em grade |
| Vitória no jogo | combinações predefinidas | linhas/colunas/diagonais com laços |

---

## Aplicação no Jogo da Velha

- Matriz `board: array[1..3,1..3] of char` para tabuleiro.
- Entrada com `(linha, coluna)` facilita compreender posições.
- Verificações de vitória por laços em linhas e colunas.

```pascal
vitoria := false;
for i := 1 to 3 do
  if (board[i,1]=jogador) and (board[i,2]=jogador) and (board[i,3]=jogador) then vitoria := true;
for j := 1 to 3 do
  if (board[1,j]=jogador) and (board[2,j]=jogador) and (board[3,j]=jogador) then vitoria := true;
if (board[1,1]=jogador) and (board[2,2]=jogador) and (board[3,3]=jogador) then vitoria := true;
if (board[1,3]=jogador) and (board[2,2]=jogador) and (board[3,1]=jogador) then vitoria := true;
```

---

## Dicas Didáticas

- Comece com 1D para reduzir complexidade, depois migre para 2D.
- Nomeie variáveis de forma clara (`linha`, `col`, `board`).
- Valide entrada do usuário antes de acessar índices.
- Separe exibição em procedimento (quando avançarmos em modularização).

---

## Erros Comuns

- Índices fora do intervalo (`Range Check Error` quando ativado).
- Inverter ordem (usar `board[col,linha]` por engano).
- Esquecer de inicializar a matriz antes do uso.

---

## Exercícios

1. Inicialize o tabuleiro e teste impressão formatada.
2. Implemente marcação por coordenadas com validação.
3. Crie função para verificar vitória nas linhas.
4. Crie função para verificar vitória nas colunas.
5. Adicione contagem de jogadas e detecção de empate.

---

## Encerramento

Matrizes em Pascal permitem modelar problemas com estrutura bidimensional naturalmente, tornando o código do Jogo da Velha mais legível e extensível.

---

## Gerar PDF

```bash
marp matrizes_pascal.md --pdf
```

---
marp: true
theme: tema-uece
title: Arrays em Pascal – Evolução do Jogo da Velha (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Material auxiliar. Referência principal: `README.md`.

# **Arrays em Pascal**
## Refatorando o Jogo da Velha: 9 variáveis → estruturas

Autor: (preencha)  
Disciplina: Linguagem de Programação I

---

## Objetivos

- Entender arrays 1D e 2D
- Reduzir repetição do código do tabuleiro
- Introduzir acesso indexado
- Mostrar arrays dinâmicos (`SetLength`)
- Preparar para registros e enumerações
- Aplicar diretamente ao Jogo da Velha

---

## Por que Mudar?

| Situação Atual | Limitação |
|----------------|-----------|
| 9 variáveis (`pos1..pos9`) | Código repetitivo |
| Verificação de vitória manual | Difícil escalar |
| Alternar posições com muitos `if` | Verbosidade |

> Arrays permitem laços para percorrer posições.

---

## Array 1D em Pascal

```pascal
var
  tab: array[1..9] of char;
```

- Índices inteiros no intervalo especificado
- Tamanho fixo (compilação)
- Acesso: `tab[i]`

---

## Inicialização 1D

```pascal
for i := 1 to 9 do
  tab[i] := ' ';
```

Substitui múltiplas atribuições.

---

## Mostrar Tabuleiro Usando Array 1D

```pascal
writeln(' ', tab[1],' | ',tab[2],' | ',tab[3]);
writeln('---+---+---');
writeln(' ', tab[4],' | ',tab[5],' | ',tab[6]);
writeln('---+---+---');
writeln(' ', tab[7],' | ',tab[8],' | ',tab[9]);
```

Ainda explícito, mas já unificado na fonte de dados.

---

## Validar Jogada com 1D

```pascal
if (escolha >= 1) and (escolha <= 9) then
begin
  if tab[escolha] = ' ' then
    tab[escolha] := jogador
  else
    writeln('Posição ocupada!');
end
else
  writeln('Entrada fora de 1..9');
```

> Remove 9 blocos `if escolha = n`.

---

## Verificar Vitória Usando Índices 1D

Lista de combinações vencedoras como pares de trios:

```pascal
const
  WIN_COUNT = 8;
  WinComb: array[1..WIN_COUNT, 1..3] of integer = (
    (1,2,3), (4,5,6), (7,8,9),
    (1,4,7), (2,5,8), (3,6,9),
    (1,5,9), (3,5,7)
  );
```

Loop de verificação:

```pascal
vitoria := false;
for w := 1 to WIN_COUNT do
begin
  a := WinComb[w,1]; b := WinComb[w,2]; c := WinComb[w,3];
  if (tab[a]=jogador) and (tab[b]=jogador) and (tab[c]=jogador) then
  begin
    vitoria := true;
    break;
  end;
end;
```

---

## Evolução para 2D (Matriz)

Representar tabuleiro como linhas e colunas:

```pascal
var
  board: array[1..3, 1..3] of char;
```

Acesso: `board[linha, coluna]`.

---

## Inicialização 2D

```pascal
for i := 1 to 3 do
  for j := 1 to 3 do
    board[i,j] := ' ';
```

---

## Exibir Tabuleiro 2D

```pascal
for i := 1 to 3 do
begin
  writeln(' ', board[i,1],' | ',board[i,2],' | ',board[i,3]);
  if i < 3 then writeln('---+---+---');
end;
```

> Facilita ampliar formatação ou adicionar coordenadas.

---

## Entrada Usando Coordenadas

```pascal
write('Linha (1-3): '); readln(l);
write('Coluna (1-3): '); readln(c);
if (l>=1) and (l<=3) and (c>=1) and (c<=3) then
begin
  if board[l,c] = ' ' then board[l,c] := jogador
  else writeln('Ocupada!');
end
else writeln('Coordenadas inválidas');
```

> Estimula raciocínio matricial.

---

## Verificação de Vitória 2D (Linhas e Colunas)

```pascal
vitoria := false;

for i := 1 to 3 do
  if (board[i,1]=jogador) and (board[i,2]=jogador) and (board[i,3]=jogador) then vitoria := true;

for j := 1 to 3 do
  if (board[1,j]=jogador) and (board[2,j]=jogador) and (board[3,j]=jogador) then vitoria := true;

if (board[1,1]=jogador) and (board[2,2]=jogador) and (board[3,3]=jogador) then vitoria := true;
if (board[1,3]=jogador) and (board[2,2]=jogador) and (board[3,1]=jogador) then vitoria := true;
```

> Mais estruturado que lista 1D manual.

---

## Arrays Dinâmicos

Declaração:

```pascal
var
  dinamico: array of integer; // sem limites fixos
```

Definir tamanho:

```pascal
SetLength(dinamico, 10);
```

Acesso igual ao array estático (`dinamico[i]`).

---

## Quando Usar Dinâmico?

| Situação | Recomendação |
|----------|--------------|
| Tamanho conhecido | Array fixo |
| Crescimento durante execução | Dinâmico |
| Lista de jogadas registradas | Dinâmico (expandir) |

Exemplo expandir:

```pascal
SetLength(jogadasSeq, length(jogadasSeq)+1);
jogadasSeq[length(jogadasSeq)-1] := escolha;
```

---

## Evolução Planejada (Resumo)

| Versão | Estrutura | Característica |
|--------|-----------|----------------|
| V1 | 9 variáveis | Simples, repetitivo |
| V2 | array[1..9] | Reduz marcação e verificação |
| V3 | array[1..3,1..3] | Raciocínio matricial |
| V4 | record + array | Encapsular estado (próximo slide) |
| V5 | dinâmico p/ jogadas | Histórico flexível |

---

## Refatorando Funções (Ideia Futura)

```pascal
procedure MostrarBoard;
var i: integer;
begin
  for i := 1 to 3 do
  begin
    writeln(' ', board[i,1],' | ',board[i,2],' | ',board[i,3]);
    if i < 3 then writeln('---+---+---');
  end;
end;
```

> Preparar mentalidade para modularização.

---

## Exercícios

1. Migrar versão básica para array 1D.
2. Implementar verificação de vitória usando `WinComb`.
3. Migrar para matriz 2D e aceitar coordenadas.
4. Registrar histórico de jogadas em array dinâmico.
5. Mostrar histórico ao final em ordem.

---

## Erros Comuns

- Índices fora dos limites (1..9 ou 1..3)
- Não inicializar antes do uso
- Misturar lógica 1D e 2D na mesma versão

---

## Encerramento

Arrays reduzem complexidade e abrem espaço para estruturas mais ricas (enum, record, set).

---

## Gerar PDF

```bash
marp arrays_evolucao_jogo_da_velha.md --pdf
```

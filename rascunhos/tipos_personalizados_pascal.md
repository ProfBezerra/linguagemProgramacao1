---
marp: true
theme: tema-uece
title: Tipos Personalizados em Pascal – Enum, Record e Set (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Material auxiliar. Referência principal: `README.md`.

# **Tipos Personalizados em Pascal**
## Estruturando melhor o Jogo da Velha

Autor: (preencha)  
Disciplina: Linguagem de Programação I

---

## Objetivos

- Entender enumerações (`enum`)
- Criar registros (`record`) para agrupar dados
- Usar conjuntos (`set`) para coleções de valores discretos
- Aplicar tudo para organizar o Jogo da Velha
- Preparar terreno para separação de lógica e apresentação

---

## Por que Tipos Personalizados?

| Problema Atual | Solução com tipos |
|----------------|-------------------|
| Muitas variáveis soltas | Agrupar em `record` |
| Símbolo do jogador como `char` | `enum` melhora semântica |
| Verificações de vitória repetitivas | Conjunto de padrões / funções |

> Mais legibilidade, menos erros de manipulação.

---

## Enumerações (Enumerated Types)

Declaração:

```pascal
type
  TPlayer = (PlayerX, PlayerO, None);
```

Uso:

```pascal
var atual: TPlayer;
atual := PlayerX;
```

Converter para caractere para exibir:

```pascal
function PlayerChar(p: TPlayer): char;
begin
  case p of
    PlayerX: PlayerChar := 'X';
    PlayerO: PlayerChar := 'O';
  else
    PlayerChar := ' ';
  end;
end;
```

---

## Alternância de Jogador com Enum

```pascal
if atual = PlayerX then
  atual := PlayerO
else
  atual := PlayerX;
```

> Sem comparação com caracteres explícitos.

---

## Record (Agrupar Estado)

```pascal
type
  TBoard = record
    cells: array[1..3,1..3] of char;
    jogadas: integer;
    vitoria: boolean;
  end;
```

Instância e inicialização:

```pascal
var board: TBoard;
for i := 1 to 3 do
  for j := 1 to 3 do
    board.cells[i,j] := ' ';
board.jogadas := 0;
board.vitoria := false;
```

---

## Funções de Apoio (Prototipagem)

```pascal
procedure MostrarBoard(const b: TBoard);
var i: integer;
begin
  for i := 1 to 3 do
  begin
    writeln(' ', b.cells[i,1],' | ',b.cells[i,2],' | ',b.cells[i,3]);
    if i < 3 then writeln('---+---+---');
  end;
end;
```

> Facilita manutenção e reutilização.

---

## Registrar Jogada (Record + Enum)

```pascal
function Simbolo(p: TPlayer): char;
begin
  if p = PlayerX then Simbolo := 'X'
  else if p = PlayerO then Simbolo := 'O'
  else Simbolo := ' ';
end;

procedure Jogar(var b: TBoard; p: TPlayer; linha, col: integer);
begin
  if (linha>=1) and (linha<=3) and (col>=1) and (col<=3) then
  begin
    if b.cells[linha,col] = ' ' then
    begin
      b.cells[linha,col] := Simbolo(p);
      b.jogadas := b.jogadas + 1;
    end
    else writeln('Posição ocupada');
  end
  else writeln('Coordenadas inválidas');
end;
```

---

## Conjuntos (Set) – Noções

Definição:

```pascal
type TIndice = 1..9;
     TConjunto = set of TIndice;
```

Uso (exemplo de posições ocupadas pelo jogador X):

```pascal
var ocupadasX: TConjunto;
ocupadasX := [];
ocupadasX := ocupadasX + [1];  // adicionar
if 1 in ocupadasX then writeln('X marcou 1');
```

---

## Conjuntos para Vitória (1D Abordagem)

Definir cada combinação como conjunto constante:

```pascal
const
  L1: TConjunto = [1,2,3];
  L2: TConjunto = [4,5,6];
  L3: TConjunto = [7,8,9];
  C1: TConjunto = [1,4,7];
  C2: TConjunto = [2,5,8];
  C3: TConjunto = [3,6,9];
  D1: TConjunto = [1,5,9];
  D2: TConjunto = [3,5,7];
```

Verificação:

```pascal
function Venceu(ocup: TConjunto): boolean;
begin
  Venceu := (L1 <= ocup) or (L2 <= ocup) or (L3 <= ocup) or
            (C1 <= ocup) or (C2 <= ocup) or (C3 <= ocup) or
            (D1 <= ocup) or (D2 <= ocup);
end;
```

> `A <= B` verifica se A é subconjunto de B.

---

## Integrar Conjunto ao Fluxo

```pascal
var ocupX, ocupO: TConjunto;
ocupX := []; ocupO := [];

// Após jogada válida:
if atual = PlayerX then
  ocupX := ocupX + [indice]
else
  ocupO := ocupO + [indice];

if (atual = PlayerX) and Venceu(ocupX) then board.vitoria := true;
if (atual = PlayerO) and Venceu(ocupO) then board.vitoria := true;
```

Reduz testes explícitos de vitória.

---

## Juntando Tudo (Estrutura Simplificada)

```pascal
program JogoDaVelhaEstruturado;

type
  TPlayer = (PlayerX, PlayerO);
  TIndice = 1..9;
  TConjunto = set of TIndice;
  TBoard = record
    cells: array[1..9] of char;
    jogadas: integer;
  end;

const
  L1: TConjunto = [1,2,3]; L2: TConjunto = [4,5,6]; L3: TConjunto = [7,8,9];
  C1: TConjunto = [1,4,7]; C2: TConjunto = [2,5,8]; C3: TConjunto = [3,6,9];
  D1: TConjunto = [1,5,9]; D2: TConjunto = [3,5,7];

function Venceu(ocup: TConjunto): boolean;
begin
  Venceu := (L1 <= ocup) or (L2 <= ocup) or (L3 <= ocup) or
            (C1 <= ocup) or (C2 <= ocup) or (C3 <= ocup) or
            (D1 <= ocup) or (D2 <= ocup);
end;
```

> Continuação incluiria laço principal, alternância e aplicação.

---

## Benefícios Obtidos

| Técnica | Benefício |
|---------|-----------|
| Enum | Semântica clara de jogador |
| Record | Estado agrupado (manutenção) |
| Set | Vitória calculada elegantemente |
| Arrays | Iteração simples |

---

## Exercícios

1. Completar o programa estruturado (laço + entrada).
2. Migrar de matriz 2D para `cells: array[1..9]` combinando com conjuntos.
3. Adicionar campo `ultimoIndice: integer` ao record.
4. Implementar função `TrocarJogador(var p: TPlayer)`.
5. Guardar histórico em array dinâmico dentro do record.

---

## Erros Comuns

- Não inicializar conjuntos (`[]`)
- Esquecer `break` em laço de verificação manual
- Confundir índices 2D com enumeração das casas
- Usar símbolo errado ao alternar jogador

---

## Encerramento

Tipos personalizados tornam o código mais expressivo, modular e pronto para expansão.

---

## Gerar PDF

```bash
marp tipos_personalizados_pascal.md --pdf
```

---
marp: true
theme: tema-uece
title: Arrays em Pascal – Conceitos e Prática (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Material auxiliar. Referência principal: `README.md`.

# **Arrays em Pascal**

## Vetores (1D) para estruturar dados sequenciais

Autor: Prof Bezerra
Disciplina: Linguagem de Programação I

---

## O que é um Array?

- Estrutura de dados que armazena elementos do mesmo tipo em uma sequência indexada.
- Posição identificada por um índice inteiro.
- Em Pascal, índices costumam ser definidos em um intervalo.

Exemplo (tamanho fixo):

```pascal
var
  v: array[1..5] of integer;
```

---

## Declaração e Tipos

```pascal
var
  notas: array[1..4] of real;     // quatro notas
  letras: array[1..10] of char;   // dez caracteres
```

- `array[INICIO..FIM] of Tipo`
- Tamanho e limites são parte da declaração.

---

## Inicialização e Atribuição

```pascal
var i: integer;
for i := 1 to 4 do
  notas[i] := 0.0;  // zera todas

notas[1] := 7.5;
notas[2] := 8.0;
```

> Sempre respeite os limites do índice.

---

## Acesso e Saída

```pascal
writeln('Primeira nota: ', notas[1]:0:2);
for i := 1 to 4 do
  writeln('Nota ', i, ': ', notas[i]:0:2);
```

Laços permitem percorrer facilmente os elementos.

---

## Exemplo Didático – Tabuleiro 1D

Modelar o Jogo da Velha como vetor de 9 posições:

```pascal
var
  tab: array[1..9] of char;
```

Inicialização:

```pascal
for i := 1 to 9 do tab[i] := ' ';
```

Marcar posição escolhida:

```pascal
if (escolha>=1) and (escolha<=9) then
begin
  if tab[escolha] = ' ' then tab[escolha] := jogador
  else writeln('Posição ocupada!');
end;
```

---

## Verificação de Vitória com Combinações

Constantes com trios vencedores:

```pascal
const
  WIN_COUNT = 8;
  WinComb: array[1..WIN_COUNT, 1..3] of integer = (
    (1,2,3), (4,5,6), (7,8,9),
    (1,4,7), (2,5,8), (3,6,9),
    (1,5,9), (3,5,7)
  );
```

Laço de verificação:

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

## Arrays Dinâmicos (Resumo)

Quando o tamanho não é conhecido em tempo de compilação:

```pascal
var din: array of integer;  // sem limites
SetLength(din, 10);         // define tamanho em execução
```

- Acesso igual: `din[i]`
- Pode aumentar: `SetLength(din, length(din)+1)`

Uso sugerido: histórico de jogadas.

---

## Boas Práticas

- Inicialize antes de usar.
- Valide índices.
- Use nomes significativos (`notas`, `tab`, `jogadasSeq`).
- Prefira laços para evitar repetição de código.

---

## Erros Comuns

- Índice fora de faixa (ex.: `tab[0]` ou `tab[10]`).
- Esquecer inicialização.
- Misturar semântica 1D com 2D.

---

## Ponte para Matrizes (2D)

- Um array 2D representa linhas × colunas: `array[1..3,1..3]`.
- Facilita operações por linha/coluna (Jogo da Velha).
- Veja o slide: `rascunhos/matrizes_pascal.md` para evolução.

---

## Exercícios

1. Migrar o jogo para vetor 1D e remover os 9 `if`.
2. Implementar função `PosicaoLivre(i: integer): boolean` usando array.
3. Guardar histórico em array dinâmico e imprimir ao final.
4. Preparar transição para matriz 2D (mapeando índices 1..9 para (linha,coluna)).

---

## Encerramento

Arrays (1D) reduzem repetição e organizam dados sequenciais, pavimentando o caminho para matrizes (2D) e tipos personalizados.

---

## Gerar PDF

```bash
marp arrays_pascal.md --pdf
```

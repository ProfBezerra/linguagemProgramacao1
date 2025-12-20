---
marp: true
theme: tema-uece
title: Prova — Linguagem de Programação I (Pascal)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

# **Prova — Linguagem de Programação I (Pascal)**

- Curso: Computação / Sistemas / Licenciatura
- Linguagem: Pascal (Free Pascal)
- Duração: 2 horas
- Permitido: material impresso (opcional)

---

## Parte I — Objetivas (5 × 1,0 ponto)

1. Qual das alternativas não corresponde a um tipo de dado básico em Pascal?
   - a) Integer
   - b) Real
   - c) Boolean
   - d) String
   - e) Vector

2. Em Pascal, o comando responsável por ler dados do teclado é:
   - a) write
   - b) writeln
   - c) readln
   - d) input
   - e) scan

3. Analise o código e assinale a saída:

```pascal
var
  x : integer;
begin
  x := 7;
  if (x mod 2 = 0) then
    writeln('Par')
  else
    writeln('Ímpar');
end.
```

   - a) Par
   - b) Ímpar
   - c) 7
   - d) Erro de compilação
   - e) Nenhuma saída

4. Sobre estruturas de repetição em Pascal, assinale a alternativa correta:
   - a) O while sempre executa ao menos uma vez.
   - b) O for é indicado quando se conhece previamente o número de repetições.
   - c) O repeat...until testa a condição antes da execução.
   - d) O for não aceita variáveis inteiras.
   - e) Todas estão corretas.

5. A principal finalidade do uso de funções e procedimentos em Pascal é:
   - a) Aumentar a velocidade do programa
   - b) Evitar o uso de variáveis
   - c) Modularizar e reutilizar código
   - d) Substituir estruturas de decisão
   - e) Eliminar laços de repetição

---

## Parte II — Programação (5 × 3,0 pontos)

6. Entrada e Saída

Escreva um programa que leia o nome e a nota final de um aluno e exiba:

Aluno <nome> obteve nota <nota>.

```pascal
program AlunoNota;
var nome: string; nota: real;
begin
  write('Nome: '); readln(nome);
  write('Nota: '); readln(nota);
  writeln('Aluno ', nome, ' obteve nota ', nota:0:2, '.');
end.
```

---

7. Estrutura Condicional

Leia um número inteiro e informe se é positivo, negativo ou zero.

```pascal
program PositivoNegativoZero;
var n: integer;
begin
  write('Digite um inteiro: '); readln(n);
  if n > 0 then writeln('positivo')
  else if n < 0 then writeln('negativo')
  else writeln('zero');
end.
```

---

8. Estrutura de Repetição

Leia um inteiro n e mostre os números de 1 até n.

```pascal
program UmAteN;
var n, i: integer;
begin
  write('n: '); readln(n);
  for i := 1 to n do writeln(i);
end.
```

---

9. Vetores

Leia 5 inteiros em um vetor; calcule soma e média.

```pascal
program VetorSomaMedia;
var v: array[1..5] of integer; i, soma: integer; media: real;
begin
  soma := 0;
  for i := 1 to 5 do
  begin
    write('v[', i, ']= '); readln(v[i]);
    soma := soma + v[i];
  end;
  media := soma / 5.0;
  writeln('Soma: ', soma);
  writeln('Media: ', media:0:2);
end.
```

---

10. Funções

Implemente `maiorValor(a,b: integer): integer`. Leia dois números, chame a função e exiba o maior.

```pascal
program MaiorValorDemo;
function maiorValor(a, b: integer): integer;
begin
  if a >= b then maiorValor := a else maiorValor := b;
end;

var x, y, m: integer;
begin
  write('Digite x: '); readln(x);
  write('Digite y: '); readln(y);
  m := maiorValor(x, y);
  writeln('Maior valor: ', m);
end.
```

---

## Gabarito — Parte I

1) e  
2) c  
3) b  
4) b  
5) c

---

## Rubrica — Parte II (critérios de correção)

6. Entrada e Saída (3,0)
- 1,0: Lê nome
- 1,0: Lê nota (numérica)
- 1,0: Formata e imprime corretamente

7. Condicional (3,0)
- 1,0: Lê inteiro
- 1,0: Estrutura condicional correta
- 1,0: Mensagens coerentes (positivo/negativo/zero)

8. Repetição (3,0)
- 1,0: Lê n
- 1,0: Usa laço adequado (for/while) e limites corretos
- 1,0: Imprime sequência completa

9. Vetores (3,0)
- 1,0: Lê 5 inteiros no vetor
- 1,0: Soma correta
- 1,0: Média correta e impressa

10. Funções (3,0)
- 1,0: Implementa `maiorValor(a,b)` corretamente
- 1,0: Lê dois inteiros
- 1,0: Chama função e imprime maior valor

---

## Observações para Aplicação

- Permitir variações equivalentes de implementação (ex.: while em vez de for, desde que correto).
- Penalizar apenas erros de lógica ou de leitura/saída que afetem o resultado.
- Incentivar formatação limpa e mensagens claras.

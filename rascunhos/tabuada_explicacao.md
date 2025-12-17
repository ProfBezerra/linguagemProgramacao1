---
marp: true
theme: tema-uece
title: Tabuada em Pascal — Algoritmo e Programa
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

# **Tabuada em Modo Texto**

Autor: Prof. Bezerra  
Disciplina: Linguagem de Programação I

---

## Objetivo

Exibir a tabuada de um número `n` de 1 a 10 usando laço de repetição.

---

## Algoritmo (Pseudocódigo)

```text
ler n
para i de 1 até 10 faça
    escrever "n x i = n*i"
fim-para
```

Características:
- Repetição definida (sabemos de antemão o intervalo 1..10).
- Cálculo simples em cada iteração: produto `n * i`.
- Entrada de um único valor `n` (inteiro).

---

## Programa Pascal (Console)

Arquivo: `programas/Tabuada.pas`

```pascal
program Tabuada;

{$apptype console}

var
  n, i: integer;
begin
  { Entrada }
  write('Digite um número para a tabuada: '); readln(n);

  { Processamento + Saída }
  writeln('Tabuada de ', n, ':');
  for i := 1 to 10 do
    writeln(n, ' x ', i, ' = ', n * i);
end.
```

---

## Explicação Passo a Passo

- Entrada: lê `n` do usuário com `readln`.
- Laço `for`: controla `i` de 1 a 10 (incremento de 1 em 1).
- Corpo do laço: imprime a expressão e o resultado do produto.
- Fim: programa encerra após imprimir todas as linhas.

---

## Possíveis Extensões

- Validar entrada: garantir que `n` é inteiro e tratar valores muito grandes.
- Parametrizar intervalo: permitir que o usuário informe início e fim (ex.: 0..12).
- Formatação: alinhar colunas ou adicionar cores (em ambientes que suportam).
- Função auxiliar: extrair cálculo/print para um procedimento `ImprimirLinha(n, i)`.

---

## Como Compilar e Executar (Windows PowerShell)

```powershell
fpc programas\Tabuada.pas
programas\Tabuada.exe
```

---

## Ideia de Exercício

- Peça ao usuário o intervalo (início e fim) e imprima a tabuada de `n` nesse intervalo.
- Gere a tabuada de todos os números de 1 a 10 (duplo laço `for`).

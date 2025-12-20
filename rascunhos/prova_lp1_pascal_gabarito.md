---
marp: true
theme: tema-uece
title: Prova — Gabarito e Rubrica (Pascal)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

# **Gabarito — Parte I (Objetivas)**

1) e  
2) c  
3) b  
4) b  
5) c

---

## Rubrica — Parte II (Programação)

6. Entrada e Saída (3,0)
- 1,0: Lê nome
- 1,0: Lê nota (numérica)
- 1,0: Formata e imprime corretamente (pode aceitar casas com `:0:2`)

7. Condicional (3,0)
- 1,0: Lê inteiro
- 1,0: Estrutura condicional correta (`if/else`)
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

## Modelos de Solução (Referência)

6) Aluno e nota
```pascal
{ Algoritmo (pseudocódigo):
  ler nome
  ler nota
  escrever "Aluno <nome> obteve nota <nota>"
}
program AlunoNota;
var nome: string; nota: real;
begin
  write('Nome: '); readln(nome);
  write('Nota: '); readln(nota);
  writeln('Aluno ', nome, ' obteve nota ', nota:0:2, '.');
end.
```

7) Positivo, negativo ou zero
```pascal
{ Algoritmo (pseudocódigo):
  ler n
  se n > 0 então escrever "positivo"
  senão se n < 0 então escrever "negativo"
  senão escrever "zero"
}
program PositivoNegativoZero;
var n: integer;
begin
  write('Digite um inteiro: '); readln(n);
  if n > 0 then writeln('positivo')
  else if n < 0 then writeln('negativo')
  else writeln('zero');
end.
```

8) De 1 até n
```pascal
{ Algoritmo (pseudocódigo):
  ler n
  para i de 1 até n faça
    escrever i
}
program UmAteN;
var n, i: integer;
begin
  write('n: '); readln(n);
  for i := 1 to n do writeln(i);
end.
```

9) Soma e média de 5
```pascal
{ Algoritmo (pseudocódigo):
  soma <- 0
  para i de 1 até 5:
    ler v[i]
    soma <- soma + v[i]
  media <- soma / 5
  escrever soma e media
}
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

10) Função maiorValor
```pascal
{ Algoritmo (pseudocódigo):
  ler x, y
  se x >= y então maior <- x senão maior <- y
  escrever maior
}
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

## Observações para Correção

- Aceitar variações equivalentes (ex.: `while` em vez de `for`, desde que correto).
- Penalizar apenas erros de lógica/IO que afetem o resultado.
- Considerar formatação e clareza como diferencial (pontos extras não previstos — apenas feedback).

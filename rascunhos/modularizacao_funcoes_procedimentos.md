---
marp: true
theme: tema-uece
title: Modularização em Pascal — Funções, Procedimentos e Unidades
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ RASCUNHO. Referência principal: `README.md`.

# **Modularização: Funções, Procedimentos e Unidades**

Autor: Prof. Bezerra  
Disciplina: Linguagem de Programação I

---

## 🎯 Objetivos

- Desenvolver programas modulares utilizando funções, procedimentos e unidades.
- Aplicar recursividade na solução de problemas.
- Manipular arquivos texto e binários para persistência de dados.
- Integrar versionamento com GitHub para entrega e controle do projeto final.

---

## 📘 Conteúdo Programático

- Funções e procedimentos; passagem de parâmetros (valor/referência).
- Modularização: parâmetros formais e reais, modos de passagem de argumentos, recursividade e uso de unidades.
- Arquivos texto e binários (ler/gravar).
- Integração com Git/GitHub no ciclo de desenvolvimento.

---

## Por que Modularizar?

- Separar responsabilidades e reduzir repetição de código.
- Facilitar testes, manutenção e reutilização.
- Torna o programa mais legível e escalável.

---

## Procedimentos vs Funções

- Procedimento: executa ações; não retorna valor diretamente.
- Função: computa e retorna um valor.

```pascal
procedure MostrarSaudacao(const nome: string);
begin
  writeln('Olá, ', nome);
end;

function Soma(const a, b: integer): integer;
begin
  Soma := a + b; // ou: result := a + b (modo Delphi)
end;
```

---

## Passagem de Parâmetros

- Por valor: copia o valor (não altera variável original).
- Por referência (`var`): passa referência (altera variável original).
- `const`: otimiza leitura, impede alterações.

```pascal
procedure Incrementar(var x: integer);
begin
  x := x + 1; // altera o original
end;

procedure Exibir(const msg: string);
begin
  writeln(msg); // não pode alterar msg
end;
```

---

## Parâmetros Formais x Reais

- Formais: nomes definidos na assinatura do procedimento/função.
- Reais: valores/variáveis passados na chamada.

```pascal
procedure Trocar(var a, b: integer); // formais: a, b
var temp: integer;
begin
  temp := a; a := b; b := temp;
end;

var x,y: integer; // reais: x, y
begin
  x := 3; y := 7; Trocar(x, y);
end.
```

---

## Recursividade

Ideia: uma função chama a si mesma para resolver subproblemas.

Requisitos:
- Caso base (encerra a recursão)
- Passo recursivo (aproxima do caso base)

```pascal
function Fatorial(n: integer): integer;
begin
  if n <= 1 then
    Fatorial := 1
  else
    Fatorial := n * Fatorial(n - 1);
end;
```

Cuidados: profundidade, custo de pilha, validar entradas.

---

## Unidades (unit)

Estrutura para agrupar código reutilizável.

```pascal
unit MatUtils;
{$mode objfpc}{$H+}

interface
function SomaVetor(const v: array of integer): integer;

implementation
function SomaVetor(const v: array of integer): integer;
var i, s: integer;
begin
  s := 0;
  for i := Low(v) to High(v) do s := s + v[i];
  SomaVetor := s;
end;

end.
```

Uso:
```pascal
program Demo;
uses MatUtils;
begin
  writeln(SomaVetor([1,2,3]));
end.
```

---

## Arquivos Texto

```pascal
var f: text; linha: string;
begin
  assign(f, 'dados.txt');
  rewrite(f); writeln(f, 'primeira linha'); close(f);

  assign(f, 'dados.txt'); reset(f);
  while not eof(f) do begin readln(f, linha); writeln(linha); end;
  close(f);
end.
```

---

## Arquivos Binários

```pascal
type TAluno = record
  nome: string[50]; nota: real;
end;

var fb: file of TAluno; a: TAluno;
begin
  assign(fb, 'alunos.dat'); rewrite(fb);
  a.nome := 'Ana'; a.nota := 8.5; write(fb, a); close(fb);

  assign(fb, 'alunos.dat'); reset(fb);
  while not eof(fb) do begin read(fb, a); writeln(a.nome, ' ', a.nota:0:2); end;
  close(fb);
end.
```

---

## Integração com Git/GitHub

- Criar unidade para lógica central e manter `program` apenas como o orquestrador.
- Versionar cada etapa com mensagens claras de commit (`feat:`, `refactor:` etc.).
- Rodar testes (quando aplicável) antes do `push`.
- Releases: empacotar binários e anexar no GitHub (opcional).

---

## Exercícios

- Criar função `Media4` e procedimento `ImprimirResultadoMedia` (modularizar).
- Implementar `Fatorial` recursivo e iterativo; medir diferenças.
- Ler e gravar cadastro simples em arquivo texto e binário.
- Separar lógica em `unit` e manter `program` mínimo.

---

## Dicas de Projeto Final

- Defina unidades temáticas (ex.: `IOUtils`, `MathUtils`, `Domain`).
- Crie procedimentos utilitários para interação (menus, validação).
- Use GitHub para histórico e entrega (um repositório por grupo).

---

## Gerar PDF

```bash
marp rascunhos/modularizacao_funcoes_procedimentos.md --pdf
```

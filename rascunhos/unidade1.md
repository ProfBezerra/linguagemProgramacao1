---
marp: true
theme: tema-uece
title: Unidade 1 – Fundamentos de Programação (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Este material é auxiliar. Use `README.md` como fonte oficial. Conteúdo sujeito a revisão.

# **Unidade 1 – Fundamentos de Programação**

## Jogo da Velha — versão inicial

**UECE / UAB**
Linguagem de Programação I

---

## **Objetivos da Unidade**

- Entender o que é uma linguagem de programação
- Conhecer níveis de linguagem
- Desenvolver lógica e abstração
- Utilizar Pascal e Free Pascal/Lazarus
- Aplicar entrada e saída
- Usar decisão e repetição
- **Construir o Jogo da Velha passo a passo**

---

## **O que é um Algoritmo?**

- Sequência de instruções
- Passo a passo
- Resolve um problema
- Independente da linguagem
- Representações possíveis:
  - Linguagem natural
  - Pseudocódigo
  - Fluxograma
  - Tabelas de ação

---

## **Algoritmo x Linguagem de Programação**

> **Algoritmo = receita (lógica do problema)**
> **Linguagem = como o computador executa a receita**

---

## **Algoritmo do Jogo da Velha — Parte 1**

1. Criar 9 posições vazias
2. Jogador atual = X
3. jogadas = 0

---

## **Algoritmo do Jogo da Velha — Parte 2**

4. Mostrar tabuleiro
5. Jogador escolhe posição (1–9)
6. Se posição estiver ocupada → pedir novamente
7. Marcar X ou O
8. jogadas++

---

## **Algoritmo do Jogo da Velha — Parte 3**

9. Verificar vitória
10. Verificar empate
11. Trocar jogador
12. Repetir

---

## **Fluxograma do Jogo da Velha (ASCII)**

```text
 +----------------------------------+
 |              INÍCIO             |
 +----------------------------------+
 |
 v
 +----------------------------------+
 |     Criar 9 posições vazias      |
 +----------------------------------+
 |
 v
 +----------------------------------+
 |  jogador = 'X'   jogadas = 0     |
 +----------------------------------+
 |
 v
 +==================================+
 |          INÍCIO DO LOOP          |
 +==================================+
 |
 v
 +----------------------------------+
 |        Mostrar tabuleiro         |
 +----------------------------------+
 |
 v
 +----------------------------------+
 |    Jogador escolhe posição 1–9   |
 +----------------------------------+
 |
 v
 +--------------[ posição livre? ]--------------+
 |                                              |
 |                    NÃO        SIM            |
 |                     |          |             |
 |                     v          v             |
 |          "Jogada inválida"    Marcar         |
 |                     |          |             |
 |                     +---- voltar ao início --+
 +-----------------------------------------------+
 |
 v
 +----------------------------------+
 |     jogadas := jogadas + 1       |
 +----------------------------------+
 |
 v
 +--------------[ vitória? ]--------------------+
 |         |                         |          |
 |        SIM                       NÃO         |
 |         |                         |          |
 |         v                         v          |
 |    Mostrar tabu.            +-----------+    |
 |   "Jogador venceu!"         |  empate?  |    |
 |         |                   +-----------+    |
 |         v                       |     |      |
 |        FIM                     SIM   NÃO     |
 |                                  |     |     |
 |                                  v     v     |
 |                            "Empate!" trocar  |
 |                                FIM  jogador  |
 +-----------------------------------------------+
```

---

## **Criando as Variáveis do Tabuleiro**

```pascal
var
  pos1, pos2, pos3: char;
  pos4, pos5, pos6: char;
  pos7, pos8, pos9: char;

  jogador: char;
  jogadas: integer;
  escolha: integer;
  vitoria, fim: boolean;
```

---

## Inicializando Variáveis

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

## Mostrando o Tabuleiro

```pascal
writeln(' ', pos1, ' | ', pos2, ' | ', pos3);
writeln('---+---+---');
writeln(' ', pos4, ' | ', pos5, ' | ', pos6);
writeln('---+---+---');
writeln(' ', pos7, ' | ', pos8, ' | ', pos9);
```

---

## Lendo a Jogada

```pascal
write('Jogador ', jogador, ', escolha (1-9): ');
readln(escolha);
```

---

## Validando Jogada – Parte 1

```pascal
if escolha = 1 then
begin
  if pos1 = ' ' then pos1 := jogador
  else writeln('Posição ocupada!');
end;
```

---

## Validando Jogada – Parte 2

```pascal
if escolha = 2 then
begin
  if pos2 = ' ' then pos2 := jogador
  else writeln('Posição ocupada!');
end;
```

---

## (Repita lógica até escolha = 9)

---

## Verificando Vitória (sem funções)

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

## Alternando Jogador

```pascal
if jogador = 'X' then
  jogador := 'O'
else
  jogador := 'X';
```

---

## Estrutura do Laço Principal

```pascal
while fim = false do
begin
  { mostrar tabuleiro }
  { ler jogada }
  { validar jogada }
  jogadas := jogadas + 1;
  { verificar vitória }
  { verificar empate }
  { trocar jogador }
end;
```

---

## Conclusão da Unidade 1

Você aprendeu:

✔ Algoritmos
✔ Fluxogramas
✔ Variáveis
✔ Entrada e saída
✔ Decisão
✔ Repetição
✔ Montar a versão inicial do Jogo da Velha

---

## Fim da Apresentação

Obrigado!

---

## 📌 Como usar o tema UECE no Marp

1. Crie um arquivo chamado `tema-uece.css` e cole o tema.
2. No seu arquivo `.md`, mantenha a linha:

```yaml
theme: tema-uece
```

3. Gere PDF com:

```bash
marp unidade1.md --pdf
```

Ou use a extensão Marp no VS Code.

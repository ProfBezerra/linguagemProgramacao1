---
marp: true
theme: gaia
title: Curso — Jogo da Velha em Pascal (Capítulos 1 a 4)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
---

# **Curso Completo — Jogo da Velha em Pascal**
### Versão Unificada dos Slides (Cap. 1–4)
Projeto-base: Criar o Jogo da Velha em modo texto, sem funções nem procedimentos.

---
# **Aula 1 — Introdução à Programação**
## Contexto
Nesta aula definimos o problema-base do curso: **desenvolver um Jogo da Velha completo**.

---
# O que é Programar?
- Resolver problemas com algoritmos
- Traduzir passos lógicos para código
- Nosso problema-alvo: **Jogo da Velha**

---
# Algoritmo do Jogo — Versão Textual
1. Inicializar tabuleiro
2. Definir jogador
3. Repetir:
   - Mostrar tabuleiro
   - Solicitar jogada
   - Validar posição
   - Marcar jogada
   - Verificar vitória/empate
   - Trocar jogador
4. Exibir resultado

---
# Representação do Tabuleiro
```
 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9
```
Cada número será uma variável: `pos1` ... `pos9`.

---
# Fluxograma Geral
```
Início
↓
Inicializa tabuleiro
↓
Define jogador
↓
Mostra
↓
Jogada
↓
Válida?
 não → volta
 sim → marca
↓
Vitória/empate?
 sim → fim
 não → trocar jogador → repetir
```

---
# Aula 2 — Algoritmos e Fluxogramas
## Contexto
Construiremos a lógica visual e o pseudocódigo completo do jogo.

---
# Fluxograma — Jogada
```
Escolhe posição
↓
Está vazia?
  não → pedir novamente
  sim → marcar
↓
Trocar jogador
```

---
# Pseudocódigo Inicial
```
para pos1..pos9 ← ' '
jogador ← 'X'
fim ← falso

enquanto fim = falso faça
  mostrar tabuleiro

  repetir
    ler posicao
  até posição livre

  marcar posição

  verificar vitória/empate

  se não terminou então trocar jogador
fim enquanto
```
---

# Aula 3 — Estrutura do Programa Pascal
## Contexto
Declaração de variáveis e montagem estrutural do jogo.

---
# Variáveis do Tabuleiro
```pascal
var
  pos1,pos2,pos3: char;
  pos4,pos5,pos6: char;
  pos7,pos8,pos9: char;
  jogador: char;
  posicao: integer;
  fim: boolean;
```
---
# Estado Inicial
```pascal
pos1 := ' '; pos2 := ' '; pos3 := ' ';
pos4 := ' '; pos5 := ' '; pos6 := ' ';
pos7 := ' '; pos8 := ' '; pos9 := ' ';

jogador := 'X';
fim := false;
```
---
# Exibir Tabuleiro
```pascal
writeln(pos1,'|',pos2,'|',pos3);
writeln('-+-+-');
writeln(pos4,'|',pos5,'|',pos6);
writeln('-+-+-');
writeln(pos7,'|',pos8,'|',pos9);
```
---

# Aula 4 — Operadores e Expressões
## Aplicações no Jogo
- Verificar se posição está vazia
- Checar condições de vitória
- Detectar empate

---
# Expressão — Posição Livre
```pascal
if pos1 = ' ' then writeln('Livre');
```
---
# Verificação de Vitória
```pascal
if (pos1 = pos2) and (pos2 = pos3) and (pos1 <> ' ') then
  fim := true;
```
---
# Verificação de Empate
```pascal
if (pos1<>' ') and (pos2<>' ') and ... (pos9<>' ') then
  fim := true;
```
---

# Aula 5 — Condicionais IF/ELSE
## Contexto
Toda lógica de validação do jogo usa IF.

---
# Validar Ocupação
```pascal
if (posicao = 1) and (pos1 = ' ') then pos1 := jogador
else writeln('Posição ocupada!');
```
---
# Validação Completa
(9 casos encadeados; versão final completa está no código final.)

---
# Aula 6 — CASE aplicado ao Jogo
## Substituindo IF Encadeado

---
```pascal
case posicao of
  1: pos1 := jogador;
  2: pos2 := jogador;
  3: pos3 := jogador;
  4: pos4 := jogador;
  5: pos5 := jogador;
  6: pos6 := jogador;
  7: pos7 := jogador;
  8: pos8 := jogador;
  9: pos9 := jogador;
else
  writeln('Inválido');
end;
```

---
# Aula 7 — Repetição (WHILE / REPEAT)
## Contexto
Criar o loop principal do jogo.

---
# Loop Principal
```pascal
while fim = false do
begin
  mostrar tabuleiro;
  pedir jogada;
  validar jogada;
  marcar;
  verificar vitória/empate;
  trocar jogador;
end;
```
---
# REPEAT na jogada
```pascal
repeat
  readln(posicao);
until posicao válida e posição vazia;
```
---

# CÓDIGO FINAL (sem funções)
```pascal
program JogoDaVelha;
{ ... Código completo ... }
```
(O código integral está incluído no material textual complementar.)

---
# APOSTILA (Resumo)
- Algoritmo do jogo
- Declaração de variáveis
- Estruturas condicionais
- Estruturas de repetição
- Verificação de vitória
- Exercícios

---
# QUIZ — Moodle XML
Inclui 3 questões oficiais:
- O que são pos1..pos9?
- Como verificar vitória?
- Como tratar posição ocupada?

Arquivo: **quiz_jogo_da_velha_moodle.xml**

---
# Animação — Evolução do Jogo
Exemplo de frames para projetar em aula.

```
Frame 1 — Inicial
Frame 2 — X marca 5
Frame 3 — O marca 1
Frame 4 — X marca 9
...
```

---
# FIM
Obrigado!


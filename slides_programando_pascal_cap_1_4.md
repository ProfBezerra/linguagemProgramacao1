# Slides MARP — Programando com Pascal (Capítulos 1 a 4)

**Versão totalmente reescrita**
**Modelo baseado em projeto: todo o conteúdo é ensinado através do desenvolvimento do Jogo da Velha**.

---
# AULA 1 — Introdução à Programação

> **Contexto:** Introduzir algoritmos e lógica preparando a estrutura conceitual do Jogo da Velha.

---
# O que é Programar?
- Resolver problemas com algoritmos
- No curso, o problema-base será: **criar o Jogo da Velha em Pascal (modo texto)**

---
# Algoritmo do Jogo da Velha (texto)
1. Inicializar tabuleiro
2. Definir jogador inicial (X)
3. Repetir até fim:
   - Mostrar tabuleiro
   - Jogador escolhe posição
   - Verificar se posição está vazia
   - Preencher posição
   - Verificar vitória
   - Trocar jogador
4. Exibir resultado (vitória ou empate)

---
# Representação do Tabuleiro (Conceito)
- Cada casa será tratada como uma **variável**
- Posições: `pos1` ... `pos9`

```
 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9
```

---
# Fluxograma Geral do Jogo
(versão simplificada)
```
Início → Inicializa posições → jogador = X
↓
Mostra tabuleiro → Escolhe posição → Está vazia?
  não → volta
  sim → marca posição
↓
Verifica vitória → acabou?
  sim → fim
  não → troca jogador → repete
```

---
# Pensamento Lógico aplicado ao jogo
- Sequência
- Decisão (pos ocupada?)
- Repetição (jogadas)
- Estado (tabuleiro)

---
# Encerramento da Aula
Fundamentos do problema estabelecidos.

---
# AULA 2 — Fluxogramas e Algoritmos do Jogo

> **Contexto:** Transformar a lógica do jogo em fluxogramas e pseudocódigo.

---
# Fluxograma — Jogada
```
Escolher posição
↓
A posição está vazia?
  não → pedir novamente
  sim → marcar
↓
Trocar jogador
```

---
# Fluxograma — Loop Principal
```
while não terminou
  mostra tabuleiro
  realiza jogada
  verifica vitória
end while
```

---
# Pseudocódigo do Jogo
```
para cada posição pos1..pos9 ← ' '
jogador ← 'X'
fim ← falso

enquanto fim = falso faça
  mostrar tabuleiro
  repetir
    ler posicao
  até posição livre

  marcar caractere do jogador

  se vitória então fim ← verdadeiro
  senão se tabuleiro cheio então fim ← verdadeiro
  senão trocar jogador
fim enquanto
```

---
# Encerramento
Fluxograma pronto para virar código.

---
# AULA 3 — Variáveis e Estrutura do Jogo no Pascal

> **Contexto:** Declarar todas as variáveis do jogo na linguage Pascal.

---
# Variáveis do Tabuleiro
```pascal
var
  pos1, pos2, pos3: char;
  pos4, pos5, pos6: char;
  pos7, pos8, pos9: char;
  jogador: char;
  fim: boolean;
  posicao: integer;
```

---
# Estado Inicial do Jogo
```pascal
pos1 := ' '; pos2 := ' '; pos3 := ' ';
pos4 := ' '; pos5 := ' '; pos6 := ' ';
pos7 := ' '; pos8 := ' '; pos9 := ' ';

jogador := 'X';
fim := false;
```

---
# Exibição do Tabuleiro
```pascal
writeln(pos1,'|',pos2,'|',pos3);
writeln('-+-+-');
writeln(pos4,'|',pos5,'|',pos6);
writeln('-+-+-');
writeln(pos7,'|',pos8,'|',pos9);
```

---
# Encerramento
Base do programa criada.

---
# AULA 4 — Expressões e Operadores

> **Contexto:** Operadores usados para verificar posição vazia, ocupação e condições de vitória.

---
# Operadores para Verificar Posição
Exemplo:
```pascal
if pos1 = ' ' then writeln('Livre');
```

---
# Operadores para Verificar Vitória
```pascal
if (pos1 = pos2) and (pos2 = pos3) and (pos1 <> ' ') then
  fim := true;
```

---
# Expressão para Empate
```pascal
if (pos1 <> ' ') and (pos2 <> ' ') and ... (pos9 <> ' ') then
  fim := true;
```

---
# Exercício
Crie expressão que verifica vitória na diagonal 1.

---
# AULA 5 — IF/ELSE

> **Contexto:** Toda verificação do jogo usa IF/ELSE.

---
# Verificar se Posição Está Livre
```pascal
if posicao = 1 then
  if pos1 <> ' ' then
    writeln('Ocupada')
  else
    pos1 := jogador;
```

---
# Verificação de Vitória com IF
```pascal
if (pos4 = pos5) and (pos5 = pos6) and (pos4 <> ' ') then
  fim := true;
```

---
# Estrutura de Decisão Completa da Jogada
Demonstração da lógica inteira com IFs encadeados.

---
# AULA 6 — CASE aplicado ao Jogo

> **Contexto:** CASE permite selecionar a posição marcada.

---
# Seleção de Posição
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
# Encerramento
CASE torna o código mais limpo.

---
# AULA 7 — Estruturas de Repetição

> **Contexto:** Criar o loop principal do jogo.

---
# Loop Principal
```pascal
while fim = false do
begin
  mostrar tabuleiro
  pedir jogada
  validar jogada
  marcar jogada
  verificar vitória
  if not fim then trocar jogador;
end;
```

---
# REPEAT no Ciclo de Jogada
```pascal
repeat
  readln(posicao);
until posicao válida e posição vazia;
```

---
# FOR para testes internos
Útil para preencher testes iniciais (não obrigatório no jogo real).

---
# Encerramento
Jogo completo em lógica e estrutura.

---
# CÓDIGO FINAL — Jogo da Velha (SEM Funções ou Procedimentos)
```pascal
program JogoDaVelha;
var
  pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9: char;
  jogador: char;
  posicao: integer;
  fim: boolean;
begin
  pos1:=' '; pos2:=' '; pos3:=' ';
  pos4:=' '; pos5:=' '; pos6:=' ';
  pos7:=' '; pos8:=' '; pos9:=' ';
  jogador := 'X';
  fim := false;

  while fim = false do
  begin
    writeln(pos1,'|',pos2,'|',pos3);
    writeln('-+-+-');
    writeln(pos4,'|',pos5,'|',pos6);
    writeln('-+-+-');
    writeln(pos7,'|',pos8,'|',pos9);

    repeat
      writeln('Jogador ', jogador, ' escolha posição (1-9): ');
      readln(posicao);
    until (posicao >=1) and (posicao <=9);

    if (posicao=1) and (pos1=' ') then pos1:=jogador else
    if (posicao=2) and (pos2=' ') then pos2:=jogador else
    if (posicao=3) and (pos3=' ') then pos3:=jogador else
    if (posicao=4) and (pos4=' ') then pos4:=jogador else
    if (posicao=5) and (pos5=' ') then pos5:=jogador else
    if (posicao=6) and (pos6=' ') then pos6:=jogador else
    if (posicao=7) and (pos7=' ') then pos7:=jogador else
    if (posicao=8) and (pos8=' ') then pos8:=jogador else
    if (posicao=9) and (pos9=' ') then pos9:=jogador else
    begin
      writeln('Posição ocupada!');
      continue;
    end;

    if ((pos1=pos2) and (pos2=pos3) and (pos1<>' ')) or
       ((pos4=pos5) and (pos5=pos6) and (pos4<>' ')) or
       ((pos7=pos8) and (pos8=pos9) and (pos7<>' ')) or
       ((pos1=pos4) and (pos4=pos7) and (pos1<>' ')) or
       ((pos2=pos5) and (pos5=pos8) and (pos2<>' ')) or
       ((pos3=pos6) and (pos6=pos9) and (pos3<>' ')) or
       ((pos1=pos5) and (pos5=pos9) and (pos1<>' ')) or
       ((pos3=pos5) and (pos5=pos7) and (pos3<>' ')) then
    begin
      fim := true;
      writeln('Jogador ', jogador, ' venceu!');
    end
    else if (pos1<>' ') and (pos2<>' ') and (pos3<>' ') and
            (pos4<>' ') and (pos5<>' ') and (pos6<>' ') and
            (pos7<>' ') and (pos8<>' ') and (pos9<>' ') then
    begin
      fim := true;
      writeln('Empate!');
    end
    else
    begin
      if jogador='X' then jogador:='O' else jogador:='X';
    end;
  end;
end.
```

# APOSTILA COMPLEMENTAR — Conceitos Aplicados ao Jogo da Velha
- **Algoritmo:** sequência lógica usada no jogo.
- **Variáveis:** representam cada posição.
- **Condições:** verificam vitória e ocupação.
- **Repetição:** controla o fluxo das jogadas.
- **Estados:** o tabuleiro evolui com cada jogada.

# EXERCÍCIOS EXTRAS
1. Modifique o jogo para mostrar números nas casas vazias.
2. Adicione mensagem de aviso quando jogada for inválida.
3. Permita escolher quem começa jogando.
4. Crie versão onde X joga sozinho (jogadas aleatórias).

# ASCII — Tabuleiro Estético
```
     1 | 2 | 3
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9
```

# NOTAS DE PROFESSOR
- Demonstre sempre a ligação entre teoria e implementação.
- Mostre erros comuns: `:=`, comparação, case-insensitive.
- Reforce testes manuais de vitória.

# AVALIAÇÃO DIAGNÓSTICA
1. O que é necessário para verificar vitória?
2. Por que o tabuleiro precisa de variáveis separadas?
3. Onde ocorre repetição no jogo?
4. Como validar jogadas?

# FIM


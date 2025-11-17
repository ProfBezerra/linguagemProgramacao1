Claro! Aqui está **o arquivo completo em formato MARP** (Markdown próprio para gerar slides).
Você pode **copiar e colar em um arquivo `unidade1.md`**, e depois gerar PDF com:

```
marp unidade1.md --pdf
```

ou usar o Marp extension no VS Code.

---

# 🎞 **MARP — Slides da Unidade 1 (Versão sem funções e procedimentos)**

*(Pronto para PDF / Apresentação)*

---

```markdown
---
marp: true
theme: default
title: Unidade 1 – Fundamentos de Programação
paginate: true
footer: Linguagem de Programação I — UECE/UAB
---

# **Unidade 1 – Fundamentos de Programação**
## Jogo da Velha (versão inicial)
UECE / UAB  
Linguagem de Programação I

---

# **Objetivos da Unidade**

- Entender o que é uma linguagem de programação  
- Conhecer níveis de linguagem  
- Desenvolver lógica e abstração  
- Utilizar Pascal e Free Pascal/Lazarus  
- Aplicar entrada e saída  
- Usar decisão e repetição  
- **Construir o Jogo da Velha passo a passo**

---

# **O que é um Algoritmo?**

- Sequência de instruções  
- Passo a passo  
- Resolve um problema  
- Independente da linguagem  
- Pode ser descrito em:  
  - Linguagem natural  
  - Pseudocódigo  
  - Fluxograma  
  - Tabelas de ação

---

# **Algoritmo x Linguagem de Programação**

### **Algoritmo = receita (lógica)**  
### **Linguagem = ferramenta para executar a receita**

---

# **Algoritmo do Jogo da Velha – Parte 1**

1. Criar 9 posições vazias  
2. Jogador atual = X  
3. jogadas = 0  

---

# **Algoritmo do Jogo da Velha – Parte 2**

4. Mostrar tabuleiro  
5. Jogador escolhe posição (1–9)  
6. Se posição estiver ocupada → pedir novamente  
7. Marcar X ou O  
8. jogadas++

---

# **Algoritmo do Jogo da Velha – Parte 3**

9. Verificar vitória  
10. Verificar empate  
11. Trocar jogador  
12. Repetir até o fim  

---

# **Fluxograma em Modo Texto (ASCII)**

```

+----------------------------------+
|             INÍCIO               |
+----------------------------------+
|
v
+----------------------------------+
|   Criar 9 posições vazias        |
+----------------------------------+
|
v
+----------------------------------+
|  jogador = 'X'   jogadas = 0     |
+----------------------------------+
|
v
+==================================+
|         INÍCIO DO LOOP           |
+==================================+
|
v
+----------------------------------+
|       Mostrar tabuleiro          |
+----------------------------------+
|
v
+----------------------------------+
|  Jogador escolhe posição 1–9     |
+----------------------------------+
|
v
+--------------[ posição livre? ]--------------+
|                                              |
|                 NÃO           SIM            |
|                  |             |             |
|                  v             v             |
|       "Jogada inválida"       Marcar         |
|                  |             |             |
|                  +------voltar ao início-----+
+-----------------------------------------------+
|
v
+----------------------------------+
|    jogadas := jogadas + 1       |
+----------------------------------+
|
v
+--------------[ vitória? ]--------------------+
|        |                         |           |
|       SIM                       NÃO          |
|        |                         |           |
|        v                         v           |
|    Mostrar tabu.          +-----------+      |
|   "Jogador venceu!"       | empate?   |      |
|        |                  +-----------+      |
|        v                     |     |         |
|      FIM                   SIM    NÃO        |
|                               |     |        |
|                               v     v        |
|                         "Empate!"  trocar    |
|                             FIM     jogador  |
+-----------------------------------------------+

````

---

# **Criando as Variáveis do Tabuleiro**

```pascal
var
  pos1, pos2, pos3: char;
  pos4, pos5, pos6: char;
  pos7, pos8, pos9: char;

  jogador: char;
  jogadas: integer;
````

---

# **Inicializando Variáveis (sem procedimentos)**

```pascal
pos1 := ' '; pos2 := ' '; pos3 := ' ';
pos4 := ' '; pos5 := ' '; pos6 := ' ';
pos7 := ' '; pos8 := ' '; pos9 := ' ';

jogador := 'X';
jogadas := 0;
```

---

# **Mostrando o Tabuleiro**

```pascal
writeln(' ', pos1, ' | ', pos2, ' | ', pos3);
writeln('---+---+---');
writeln(' ', pos4, ' | ', pos5, ' | ', pos6);
writeln('---+---+---');
writeln(' ', pos7, ' | ', pos8, ' | ', pos9);
```

---

# **Lendo a Jogada**

```pascal
write('Jogador ', jogador, ', escolha (1-9): ');
readln(escolha);
```

---

# **Validando Jogada — Parte 1**

```pascal
if escolha = 1 then
begin
  if pos1 = ' ' then pos1 := jogador
  else writeln('Posição ocupada!');
end;
```

---

# **Validando Jogada — Parte 2**

```pascal
if escolha = 2 then
begin
  if pos2 = ' ' then pos2 := jogador
  else writeln('Posição ocupada!');
end;
```

*(continua até 9)*

---

# **Verificando Vitória (sem funções)**

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

# **Alternando Jogador**

```pascal
if jogador = 'X' then
  jogador := 'O'
else
  jogador := 'X';
```

---

# **Estrutura do Laço Principal**

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

# **Conclusão da Unidade 1**

Você aprendeu:

✔ Algoritmos
✔ Fluxogramas
✔ Variáveis
✔ Entrada e saída
✔ Condicionais
✔ Laços
✔ Como montar a primeira versão do Jogo da Velha

---

# **Fim da Apresentação**

Obrigado!

```

---

## ✅ Arquivo MARP entregue!  
Se quiser, posso agora:

📌 gerar arquivo **PDF** pronto  
📌 gerar arquivo **`.md` para download**  
📌 criar **tema personalizado (cores/identidade visual da UECE)**  
📌 gerar uma **versão para AVA/Moodle**

É só pedir!
```

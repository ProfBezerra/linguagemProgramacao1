---
marp: true
theme: tema-uece
title: Strings em Pascal – Operações e Aplicações (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Material auxiliar. Referência oficial: `README.md`.

# **Strings em Pascal**
## Manipulação para tornar o Jogo da Velha mais amigável

Autor: (preencha)  
Disciplina: Linguagem de Programação I

---

## Objetivos

- Compreender representação de strings em Pascal
- Operações básicas: concatenação, tamanho, extração, busca
- Funções úteis: `length`, `copy`, `pos`, `upcase`
- Remoção de espaços (`trim` equivalente)
- Sanitização de entrada do usuário
- Aplicar melhorias no Jogo da Velha (mensagens + validação)

---

## Representação

- Em Pascal clássico: `string` (geral) ou `shortstring` (tamanho até 255)
- Caracter individual: `char`
- Índice inicial = 1

```pascal
var s: string;
    c: char;
begin
  s := 'Pascal';
  c := s[1];   // 'P'
end;
```

---

## Concatenando

```pascal
greeting := 'Olá, ' + nome + '!';
log := 'Jogada ' + IntToStr(numero) + ': posição ' + IntToStr(posicao);
```

> Usar `+` entre strings ou `string + char`.

---

## Tamanho: `length`

```pascal
if length(nome) = 0 then
  writeln('Nome vazio');

writeln('Total de caracteres: ', length(greeting));
```

---

## Extraindo Parte: `copy`

```pascal
sub := copy(s, 1, 3);  // primeiros 3 chars
ultimos := copy(s, length(s)-2, 3); // últimos 3 se length >= 3
```

> Sintaxe: `copy(string, inicio, quantidade)`.

---

## Buscando: `pos`

```pascal
p := pos('Velha', 'Jogo da Velha em Pascal'); // retorna índice inicial
if p > 0 then writeln('Encontrou na posição ', p);
```

> Retorna 0 se não encontrar.

---

## Maiúsculas: `upcase`

```pascal
c := upcase('x');  // 'X'
if upcase(resposta) = 'S' then writeln('Continuar');
```

Para string inteira (opção simples):

```pascal
for i := 1 to length(s) do
  s[i] := upcase(s[i]);
```

---

## Remover Espaços (Trim Simples)

Pascal puro não tem `trim` em todas variantes clássicas. Implementação simples:

```pascal
function TrimSimples(st: string): string;
var i, inicio, fim: integer;
begin
  inicio := 1;
  while (inicio <= length(st)) and (st[inicio] = ' ') do inicio := inicio + 1;
  fim := length(st);
  while (fim >= inicio) and (st[fim] = ' ') do fim := fim - 1;
  if fim < inicio then TrimSimples := ''
  else TrimSimples := copy(st, inicio, fim - inicio + 1);
end;
```

---

## Conversões Numéricas ↔ String

Sem funções embutidas antigas, podemos usar:

- `Str(valor, s)` para converter número → string
- `Val(s, num, codErro)` para string → número

```pascal
var s: string; n, erro: integer;
Str(123, s); // s = '123'
Val('45', n, erro); // n = 45 se erro = 0
```

---

## Sanitizar Entrada (Jogo da Velha)

Objetivo: aceitar entrada com espaços ou letras:

```pascal
readln(entrada);        // usuário digita
entrada := TrimSimples(entrada);
if length(entrada) = 1 then
begin
  if (entrada[1] >= '1') and (entrada[1] <= '9') then
    escolha := Ord(entrada[1]) - Ord('0')  // convert char num → inteiro
  else
    writeln('Entrada inválida. Digite 1..9');
end
else
  writeln('Entrada muito longa.');
```

---

## Construindo Mensagens Dinâmicas

```pascal
writeln('Jogador ' + jogadorAtual + ' escolheu posição ' + IntToStr(escolha));
status := 'Tabuleiro após ' + IntToStr(jogadas) + ' jogadas';
writeln(status);
```

Melhora legibilidade e feedback ao usuário.

---

## Log de Jogadas (String Acumulada)

```pascal
log := log + 'J' + IntToStr(jogadorIndex) + '→' + IntToStr(escolha) + '; ';
```

Exibir ao fim:

```pascal
writeln('Sequência de jogadas: ', log);
```

---

## Exemplo Modular – Função de Entrada

```pascal
function LerPosicao: integer;
var entrada: string;
begin
  write('Escolha (1-9): ');
  readln(entrada);
  entrada := TrimSimples(entrada);
  if (length(entrada)=1) and (entrada[1]>='1') and (entrada[1]<='9') then
    LerPosicao := Ord(entrada[1]) - Ord('0')
  else
  begin
    writeln('Inválido. Tente novamente.');
    LerPosicao := -1;
  end;
end;
```

> Integração futura quando introduzirmos procedimentos/funções oficialmente.

---

## Erros Comuns

- Acessar índice 0 (começa em 1)
- Esquecer verificação de comprimento antes de acessar `s[i]`
- Dependência de encoding (para acentos — simplificar inicialmente)

---

## Aplicações no Jogo da Velha

| Objetivo | Uso de String |
|----------|---------------|
| Limpar entrada | `TrimSimples` |
| Validar único caractere | `length(entrada)=1` |
| Mensagem de estado | Concatenação dinâmica |
| Log de jogadas | Acúmulo em uma string |
| Normalizar símbolo | `upcase` em entrada futura |

---

## Exercícios

1. Criar função que valida símbolo inicial 'X' ou 'O'.
2. Registrar todas jogadas e exibir estatística final.
3. Implementar função `SoDigitos(s: string): boolean`.
4. Adaptar entrada para aceitar "Posição 5" (extrair número com `pos`).

---

## Encerramento

Strings aumentam interação e robustez — preparando terreno para refatoração do jogo.

---

## Gerar PDF

```bash
marp strings_pascal.md --pdf
```

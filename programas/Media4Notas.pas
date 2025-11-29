{ Algoritmo em alto nível (pseudocódigo):
  Objetivo: Calcular a média de 4 notas e informar aprovação.

  1) Ler quatro notas: n1, n2, n3, n4
  2) Calcular a média: media <- (n1 + n2 + n3 + n4) / 4
  3) Mostrar a média formatada
  4) Se media >= 7 então
       escrever "Aprovado"
     senão
       escrever "Reprovado"

  Observações didáticas:
  - Separar claramente Entrada, Processamento, Saída e Decisão.
  - Validar, futuramente, entradas (ex.: notas entre 0 e 10).
  - Formatação: usar duas casas decimais na exibição.
}

program Media4Notas;

{$apptype console}

var
  n1, n2, n3, n4, media: real;
begin
  { Entrada: ler as quatro notas }
  write('Digite a 1a nota: '); readln(n1);
  write('Digite a 2a nota: '); readln(n2);
  write('Digite a 3a nota: '); readln(n3);
  write('Digite a 4a nota: '); readln(n4);

  { Processamento: calcular a média aritmética }
  media := (n1 + n2 + n3 + n4) / 4.0;

  { Saída: exibir a média com duas casas decimais }
  writeln('Média = ', media:0:2);

  { Decisão: aprovado se média >= 7.0 }
  if media >= 7.0 then
    writeln('Aprovado')
  else
    writeln('Reprovado');
end.

{ Algoritmo em alto nível (pseudocódigo):
  Objetivo: Mostrar a tabuada de um número de 1 a 10.

  1) Ler número: n
  2) Para i de 1 até 10
       escrever: n x i = n*i
  3) Finalizar

  Observações didáticas:
  - Usar laço (for) para repetição definida.
  - Opcionalmente validar que n é inteiro válido.
  - Permitir variação do intervalo futuramente (ex.: 1..12).
}

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

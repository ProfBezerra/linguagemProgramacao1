program Tabuada;

{$apptype console}

var
  n, i: integer;
begin
  write('Digite um número para a tabuada: '); readln(n);
  writeln('Tabuada de ', n, ':');
  for i := 1 to 10 do
    writeln(n, ' x ', i, ' = ', n * i);
end.

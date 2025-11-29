program Media4Notas;

{$apptype console}

var
  n1, n2, n3, n4, media: real;
begin
  write('Digite a 1a nota: '); readln(n1);
  write('Digite a 1a nota: '); readln(n1);
  write('Digite a 2a nota: '); readln(n2);
  write('Digite a 3a nota: '); readln(n3);
  write('Digite a 4a nota: '); readln(n4);

  media := (n1 + n2 + n3 + n4) / 4.0;

  writeln('Média = ', media:0:2);
  if media >= 7.0 then
    writeln('Aprovado')
  else
    writeln('Reprovado');
end.

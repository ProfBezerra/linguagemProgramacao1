program mediasimples;
var n1, n2, media: real;
begin
  readln(n1); readln(n2);
  media := (n1 + n2)/2;
  if media >= 7 then writeln('Aprovado') else writeln('Reprovado');
end.


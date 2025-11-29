program ConversorKmH_MS;

{$apptype console}

var
  kmh, ms: real;
begin
  write('Velocidade em km/h: ');
  readln(kmh);
  writeln('Velocidade em m/s: ', ms:0:4);
end.

{ Algoritmo em alto nível (pseudocódigo):
  Objetivo: Converter uma velocidade de km/h para m/s.

  1) Ler valor em km/h: kmh
  2) Calcular m/s: ms <- kmh / 3.6    // pois 1 km/h = 1000/3600 m/s
  3) Exibir resultado com formatação

  Observações didáticas:
  - Separar Entrada, Processamento e Saída.
  - Opcionalmente validar que kmh >= 0.
  - Escolher número de casas decimais conforme necessidade.
}

program ConversorKmH_MS;

{$apptype console}

var
  kmh, ms: real;
begin
  { Entrada }
  write('Velocidade em km/h: '); readln(kmh);

  { Processamento }
  ms := kmh / 3.6;  { 1 km/h = 1000/3600 m/s }

  { Saída }
  writeln('Velocidade em m/s: ', ms:0:4);
end.

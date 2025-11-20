program jogodavelhatexto;

var
  pos1, pos2, pos3: char;
  pos4, pos5, pos6: char;
  pos7, pos8, pos9: char;
  jogador: char;
  jogadas, escolha: integer;
  vitoria, fim: boolean;

begin
  { Inicialização }
  pos1 := ' '; pos2 := ' '; pos3 := ' ';
  pos4 := ' '; pos5 := ' '; pos6 := ' ';
  pos7 := ' '; pos8 := ' '; pos9 := ' ';
  jogador := 'X'; jogadas := 0; vitoria := false; fim := false;

  while not fim do
  begin
    { Mostrar tabuleiro }
    writeln(' ' ,pos1,' | ',pos2,' | ',pos3);
    writeln('---+---+---');
    writeln(' ' ,pos4,' | ',pos5,' | ',pos6);
    writeln('---+---+---');
    writeln(' ' ,pos7,' | ',pos8,' | ',pos9);

    { Ler jogada }
    write('Jogador ', jogador, ' escolha (1-9): ');
    readln(escolha);

    { Validar e marcar }
    if escolha = 1 then begin if pos1=' ' then pos1:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 2 then begin if pos2=' ' then pos2:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 3 then begin if pos3=' ' then pos3:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 4 then begin if pos4=' ' then pos4:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 5 then begin if pos5=' ' then pos5:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 6 then begin if pos6=' ' then pos6:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 7 then begin if pos7=' ' then pos7:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 8 then begin if pos8=' ' then pos8:=jogador else writeln('Posição ocupada!'); end;
    if escolha = 9 then begin if pos9=' ' then pos9:=jogador else writeln('Posição ocupada!'); end;

    { Atualiza jogadas }
    jogadas := jogadas + 1;

    { Verificar vitória }
    vitoria := false;
    if (pos1=jogador) and (pos2=jogador) and (pos3=jogador) then vitoria := true;
    if (pos4=jogador) and (pos5=jogador) and (pos6=jogador) then vitoria := true;
    if (pos7=jogador) and (pos8=jogador) and (pos9=jogador) then vitoria := true;
    if (pos1=jogador) and (pos4=jogador) and (pos7=jogador) then vitoria := true;
    if (pos2=jogador) and (pos5=jogador) and (pos8=jogador) then vitoria := true;
    if (pos3=jogador) and (pos6=jogador) and (pos9=jogador) then vitoria := true;
    if (pos1=jogador) and (pos5=jogador) and (pos9=jogador) then vitoria := true;
    if (pos3=jogador) and (pos5=jogador) and (pos7=jogador) then vitoria := true;

    if vitoria then
    begin
      writeln('Jogador ', jogador,' venceu!');
      fim := true;
    end
    else if (jogadas = 9) then
    begin
      writeln('Empate!');
      fim := true;
    end
    else
    begin
      { Alternar jogador }
      if jogador = 'X' then jogador := 'O' else jogador := 'X';
    end;
  end;

  { Mostrar tabuleiro final }
  writeln(' ' ,pos1,' | ',pos2,' | ',pos3);
  writeln('---+---+---');
  writeln(' ' ,pos4,' | ',pos5,' | ',pos6);
  writeln('---+---+---');
  writeln(' ' ,pos7,' | ',pos8,' | ',pos9);

  writeln('Fim do jogo.');
end.


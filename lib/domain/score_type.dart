enum ScoreType {
  //entradaManual("Entrada Manual", 0),
  batida("Batida", 100),
  todasAsCartas("Cada Carta", 10),
  tresVermelhoComCanastra("3 Baixado, com canastra", 100),
  tresVermelhoSemCanastra("3 Baixado, sem canastra", -100),
  canastraSuja("Canastra Suja", 100),
  canastraLimpa("Canastra Limpa", 200);

  final String name;
  final int value;

  const ScoreType(this.name, this.value);
}
import 'package:tranca_cool/domain/score_type.dart';

class ScoreData {
  ScoreType type;
  int quantity;

  ScoreData(this.type, this.quantity);
}

class Round {
  int roundNumber;
  List<ScoreType> scores = List.empty(growable: true);

  Round(this.roundNumber);

  List<ScoreData> getScores() {
    return ScoreType.values.toList()
        .map(
            (score) => ScoreData(score, scores.where((s) => s == score).length))
        .toList();
  }

  int getTotalScore() {
    var total = 0;
    for(var score in getScores()) {
      total += score.quantity * score.type.value;
    }
    return total;
  }
}

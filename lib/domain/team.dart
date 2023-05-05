import 'package:tranca_cool/domain/round.dart';

class Team {
  String name;

  List<Round> rounds = List.empty(growable: true);

  Team(this.name) {
    rounds.add(Round(0));
  }

  retrieveScore() {
    var totalScore = 0;
    for (var round in rounds) {
      for (var score in round.scores) {
        totalScore += score.value;
      }
    }

    return totalScore;
  }

  retrieveScoreBy({required int round}) {
    try {
      return rounds[round].getTotalScore();
    } catch (error) {
      return 0;
    }
  }

  resetProgress() {
    rounds.clear();
    rounds.add(Round(0));
  }
}

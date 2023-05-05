import 'package:flutter/cupertino.dart';
import 'package:tranca_cool/domain/round.dart';
import 'package:tranca_cool/domain/score_type.dart';
import 'package:tranca_cool/domain/team.dart';

class Game extends ChangeNotifier {
  List<Team> teams = List.empty(growable: true);

  int round = 1;

  addTeam(Team team) {
    teams.add(team);
    _sortRank();
    notifyListeners();
  }

  removeTeam(Team team) {
    teams.remove(team);
    notifyListeners();
  }

  nextRound() {
    round++;

    for (var team in teams) {
      team.rounds.add(Round(round));
    }

    notifyListeners();
  }

  addScore(Team team, ScoreType scoreType) {
    teams.firstWhere((t) => t.name == team.name).rounds.last.scores.add(scoreType);
    _sortRank();
    notifyListeners();
  }

  removeScore(Team team, ScoreType scoreType) {
    teams.firstWhere((t) => t.name == team.name).rounds.last.scores.remove(scoreType);
    _sortRank();
    notifyListeners();
  }

  resetGame() {
    for (var team in teams) {
      team.resetProgress();
    }

    round = 1;
    notifyListeners();
  }

  _sortRank() {
    teams.sort((team1, team2) => team1.retrieveScore().compareTo(team2.retrieveScore()));
  }
}
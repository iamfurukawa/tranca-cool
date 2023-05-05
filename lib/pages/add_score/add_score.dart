import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tranca_cool/domain/game.dart';
import 'package:tranca_cool/domain/score_type.dart';
import 'package:tranca_cool/domain/team.dart';

class AddScoreArgs {
  Team team;
  Game game;

  AddScoreArgs(this.team, this.game);
}

class AddScore extends StatefulWidget {
  const AddScore({Key? key}) : super(key: key);

  @override
  State<AddScore> createState() => _AddScoreState();
}

class _AddScoreState extends State<AddScore> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AddScoreArgs;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Tranca Cool"),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            teamInfo(args.team),
            for (var score in ScoreType.values)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: CupertinoButton(
                        color: CupertinoColors.activeGreen,
                        child: Text(score.name),
                        onPressed: () => args.game.addScore(args.team, score),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: CupertinoButton(
                        color: CupertinoColors.destructiveRed,
                        child: Text(score.name),
                        onPressed: () =>
                            args.game.removeScore(args.team, score),
                      ),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: CupertinoButton(
                color: CupertinoColors.destructiveRed,
                child: const Text("Remover time"),
                onPressed: () {
                  args.game.removeTeam(args.team);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget teamInfo(Team team) {
    return Consumer<Game>(builder: (context, game, child) {
      return Column(
        children: [
          Text(
            'Time ${team.name}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          for (var score in team.rounds.last.getScores())
            Text(
                '(${score.quantity}x) ${score.type.name} - ${score.type.value * score.quantity}'),
        ],
      );
    });
  }
}

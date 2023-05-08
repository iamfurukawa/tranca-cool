import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tranca_cool/domain/game.dart';
import 'package:tranca_cool/domain/score_type.dart';
import 'package:tranca_cool/domain/team.dart';
import 'package:tranca_cool/pages/add_score/score_input.dart';

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
            for (var score in ScoreType.values)
              ScoreInput(score, args.team, args.game),
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
}

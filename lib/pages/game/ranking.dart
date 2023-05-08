import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tranca_cool/domain/game.dart';

import 'package:tranca_cool/pages/add_score/add_score.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Game>(
      builder: (context, game, child) {
        return CupertinoListSection.insetGrouped(
          header: Text('Rodada ${game.round}'),
          children: [
            if (game.teams.isEmpty)
              const CupertinoListTile(
                title: Center(
                  child: Text('Sem times!'),
                ),
              ),
            for (var team in game.teams.reversed)
              CupertinoListTile(
                title: Text(team.name),
                leading: const Icon(CupertinoIcons.add_circled_solid),
                subtitle: Text('${team.retrieveScore().toString()} pontos'),
                onTap: () => {
                  Navigator.pushNamed(context, 'addScore',
                      arguments: AddScoreArgs(team, game))
                },
              ),
          ],
        );
      },
    );
  }
}

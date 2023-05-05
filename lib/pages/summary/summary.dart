import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tranca_cool/domain/game.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Game>(
      builder: (context, game, child) {
        return ListView(
          children: [
            for (var round = 1; round <= game.round; round++)
              CupertinoListSection.insetGrouped(
                header: Text('Rodada $round'),
                children: [
                  if (game.teams.isEmpty)
                    const CupertinoListTile(
                      title: Text("Sem times!"),
                    ),
                  for (var team in game.teams)
                    CupertinoListTile(
                      title: Text(team.name),
                      subtitle: Text(
                          '${team.retrieveScoreBy(round: round - 1).toString()} pontos'),
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}

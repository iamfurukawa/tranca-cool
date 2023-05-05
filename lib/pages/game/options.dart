import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tranca_cool/domain/game.dart';
import 'package:tranca_cool/domain/team.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const Text('Opções'),
      children: [
        CupertinoListTile(
          leading: const Icon(CupertinoIcons.add_circled_solid),
          title: const Text('Novo Jogo'),
          onTap: () => _newGame(context),
        ),
        CupertinoListTile(
          leading: const Icon(CupertinoIcons.add_circled_solid),
          title: const Text('Novo Time'),
          onTap: () => _openDialog(context),
        ),
        CupertinoListTile(
          leading: const Icon(CupertinoIcons.add_circled_solid),
          title: const Text('Nova Rodada'),
          onTap: () => _nextRound(context),
        ),
      ],
    );
  }

  void _nextRound(context) {
    Provider.of<Game>(context, listen: false).nextRound();
  }

  void _newGame(context) {
    _dialog(
        context: context,
        title: 'Você deseja criar um novo jogo?',
        message: 'Essa ação irá apagar o ultimo jogo!',
        buttonAction: () =>
            {Provider.of<Game>(context, listen: false).resetGame()});
  }

  void _openDialog(ctx) {
    final TextEditingController teamName = TextEditingController();

    showCupertinoDialog(
      context: ctx,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("Nome do novo time"),
        content: Column(
          children: [
            CupertinoTextField(
              controller: teamName,
              placeholder: 'Time Teu',
            ),
          ],
        ),
        actions: [
          CupertinoButton(
            child: const Text('Voltar'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          CupertinoButton(
            child: const Text('Adicionar'),
            onPressed: () {
              Provider.of<Game>(ctx, listen: false).addTeam(Team(teamName.text));
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void _dialog(
      {String title = 'Ops',
      required String message,
      String buttonText = "Ok",
      required Function() buttonAction,
      required BuildContext context}) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoButton(
            child: Text(buttonText),
            onPressed: () {
              buttonAction();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}

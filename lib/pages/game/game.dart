import 'package:flutter/cupertino.dart';
import 'package:tranca_cool/pages/game/options.dart';
import 'package:tranca_cool/pages/game/ranking.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Options(),
        Ranking(),
      ],
    );
  }
}



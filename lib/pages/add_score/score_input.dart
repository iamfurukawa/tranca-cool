import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tranca_cool/domain/game.dart';
import 'package:tranca_cool/domain/round.dart';
import 'package:tranca_cool/domain/score_type.dart';
import 'package:tranca_cool/domain/team.dart';

class ScoreInput extends StatefulWidget {
  final ScoreType score;

  final Team team;

  final Game game;

  const ScoreInput(this.score, this.team, this.game, {Key? key})
      : super(key: key);

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _updateTextField();
  }

  void _updateTextField() {
    List<ScoreData> scores = widget.team.rounds.last.getScores();
    var scoreActual = scores.firstWhere((score) => score.type == widget.score);
    _textController =
        TextEditingController(text: scoreActual.quantity.toString());
    _textController.selection = TextSelection.fromPosition(TextPosition(offset: _textController.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        children: [
          Text(widget.score.name),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: CupertinoButton(
                  color: CupertinoColors.activeGreen,
                  child: const Icon(
                    CupertinoIcons.add_circled_solid,
                    size: 30,
                  ),
                  onPressed: () => widget.game.addScore(widget.team, widget.score),
                ),
              ),
              Expanded(
                child: Consumer<Game>(
                  builder: (context, game, child) {
                    _updateTextField();
                    return SizedBox(
                      height: 55,
                      child: CupertinoTextField(
                        controller: _textController,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 30),
                        keyboardType: TextInputType.number,
                        onChanged: (newText) {
                          widget.game.updateScore(widget.team, widget.score, int.tryParse(newText));
                          _updateTextField();
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: CupertinoButton(
                  color: CupertinoColors.destructiveRed,
                  child: const Icon(
                    CupertinoIcons.minus_circle_fill,
                    size: 30,
                  ),
                  onPressed: () => widget.game.removeScore(widget.team, widget.score),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

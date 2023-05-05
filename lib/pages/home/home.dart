import 'package:flutter/cupertino.dart';
import 'package:tranca_cool/pages/game/game.dart';
import 'package:tranca_cool/pages/summary/summary.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _tabs = [const Game(), const Summary()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Tranca Cool"),
      ),
      child: SafeArea(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_number),
                label: 'Rank',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_bullet),
                label: 'Summary',
              )
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          },
        ),
      ),
    );
  }
}

//List selection e List title -> https://davidserrano.io/cupertino-lists-the-missing-widgets-from-the-flutter-cupertino-collection
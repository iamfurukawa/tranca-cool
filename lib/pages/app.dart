import 'package:flutter/cupertino.dart';
import 'package:tranca_cool/pages/add_score/add_score.dart';
import 'package:tranca_cool/pages/home/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: const Home(),
      routes: {
        'addScore': (_) => const AddScore(),
      },
    );
  }
}

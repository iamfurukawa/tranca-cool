import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranca_cool/domain/game.dart';
import 'package:tranca_cool/pages/app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Game(),
      child: const App(),
    ),
  );
}

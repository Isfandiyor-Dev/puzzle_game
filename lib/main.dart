import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';
import 'package:puzzle_game/view/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (context) => TilesController(),
        ),
          ChangeNotifierProvider(
          create: (context) => StopWatchController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

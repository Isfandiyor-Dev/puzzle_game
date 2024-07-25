import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';

class NewGameBtn extends StatelessWidget {
  const NewGameBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<TilesController>(context, listen: false).initialTiles();
        Provider.of<StopWatchController>(context, listen: false).reset();
      },
      child: Ink(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.cyanAccent[700],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        child: Text(
          "NEW GAME",
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 17,
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

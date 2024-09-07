import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';

class MyWinDialog extends StatelessWidget {
  const MyWinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TilesController>(context, listen: false);
    final stopWatchController =
        Provider.of<StopWatchController>(context, listen: false);
    return AlertDialog(
      title: const Text(
        "Excellent!",
        style: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      content: Text(
        "It took you ${controller.movesNumber} moves",
        style: const TextStyle(
          fontFamily: 'Rubik',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green[900]!.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            controller.initialTiles();
            stopWatchController.reset();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Play Again",
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 17,
                color: Colors.grey[200],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}

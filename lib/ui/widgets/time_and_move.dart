import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';

class TimeAndMove extends StatelessWidget {
  const TimeAndMove({super.key});

  @override
  Widget build(BuildContext context) {
    final stopWatchController = Provider.of<StopWatchController>(context);
    final controller = Provider.of<TilesController>(context);

    return Container(
      width: 200,
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "TIME",
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15,
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  stopWatchController.formattedTime,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: Colors.grey[200],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "MOVE",
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15,
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  controller.movesNumber.toString(),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: Colors.grey[200],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

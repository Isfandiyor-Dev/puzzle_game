import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';

class TimeAndMove extends StatelessWidget {
  final double width;
  const TimeAndMove({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final stopWatchController = Provider.of<StopWatchController>(context);
    final controller = Provider.of<TilesController>(context);

    return Container(
      width: width * 0.5,
      height: width * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3,
            blurRadius: 15,
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
                    fontSize: width * 0.045,
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  stopWatchController.formattedTime,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: width * 0.05,
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
                    fontSize: width * 0.045,
                    color: Colors.grey[200],
                  ),
                ),
                Text(
                  controller.movesNumber.toString(),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: width * 0.05,
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

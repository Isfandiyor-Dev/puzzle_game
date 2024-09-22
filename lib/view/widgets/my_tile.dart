import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';
import 'package:puzzle_game/models/tile.dart';
import 'package:puzzle_game/view/widgets/my_win_dialog.dart';

// ignore: must_be_immutable
class MyTile extends StatelessWidget {
  Tile tile;
  int index;
  final double width;
  MyTile({
    super.key,
    required this.tile,
    required this.index,
    required this.width,
  });

  Decoration emptyTile() {
    return BoxDecoration(
      color: const Color(0xFF1B5E20).withOpacity(0.2),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  Decoration fillTile() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: tile.number == index + 1
            ? [Colors.green.shade200, Colors.green.shade800]
            : [const Color(0xFF80CBC4), Colors.teal.shade800],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TilesController>(context, listen: false);
    return GestureDetector(
      onTap: () {
        controller.moveTile(index);
        if (controller.checkWon()) {
          Provider.of<StopWatchController>(context, listen: false).stop();
          showDialog(
            context: context,
            builder: (ctx) => MyWinDialog(width: width),
          );
        } else if (!Provider.of<StopWatchController>(context, listen: false)
            .isRunning) {
          Provider.of<StopWatchController>(context, listen: false).start();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        curve: Curves.bounceInOut,
        decoration: tile.isEmptyTile ? emptyTile() : fillTile(),
        margin: const EdgeInsets.all(4.0),
        child: Center(
          child: tile.isEmptyTile
              ? null
              : Text(
                  tile.number.toString(),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}

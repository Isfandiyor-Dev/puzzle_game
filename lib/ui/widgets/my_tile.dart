import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';
import 'package:puzzle_game/data/models/tile.dart';
import 'package:puzzle_game/ui/widgets/my_win_dialog.dart';

// ignore: must_be_immutable
class MyTile extends StatelessWidget {
  Tile tile;
  int index;
  MyTile({
    super.key,
    required this.tile,
    required this.index,
  });

  Decoration emptyTile() {
    return BoxDecoration(
      color: Colors.green[900]!.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  Decoration fillTile() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: tile.number == index + 1
            ? [Colors.green.shade200, Colors.green.shade800]
            : [Colors.teal.shade200, Colors.teal.shade800],
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
      onTap: tile.canMove
          ? null
          : () {
              controller.moveTile(index);
              if (controller.checkWon()) {
                Provider.of<StopWatchController>(context, listen: false).stop();
                showDialog(
                  context: context,
                  builder: (ctx) => const MyWinDialog(),
                );
              } else if (!Provider.of<StopWatchController>(context,
                      listen: false)
                  .isRunning) {
                Provider.of<StopWatchController>(context, listen: false)
                    .start();
              }
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        decoration: tile.isEmptyTile ? emptyTile() : fillTile(),
        margin: const EdgeInsets.all(4.0),
        child: Center(
          child: tile.isEmptyTile
              ? null
              : Text(
                  tile.number.toString(),
                  style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}

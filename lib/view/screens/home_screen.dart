import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_game/controllers/stopwatch_controller.dart';
import 'package:puzzle_game/controllers/tiles_controller.dart';
import 'package:puzzle_game/models/tile.dart';
import 'package:puzzle_game/view/widgets/my_tile.dart';
import 'package:puzzle_game/view/widgets/new_game_btn.dart';
import 'package:puzzle_game/view/widgets/time_and_move.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double widthScreen;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TilesController>(context, listen: false).initialTiles();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widthScreen = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        toolbarHeight: height * 0.09,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text(
          "15 Puzzle",
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewGameBtn(width: width),
                TimeAndMove(width: width),
              ],
            ),
            SizedBox(height: height * 0.06),
            SizedBox(
              width: double.infinity,
              height: widthScreen,
              child: Consumer<TilesController>(
                builder: (context, controllerTiles, child) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controllerTiles.tiles.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Tile tile = controllerTiles.tiles[index];
                      return MyTile(
                        index: index,
                        tile: tile,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.020),
            Consumer<StopWatchController>(
              builder: (context, watchController, child) {
                return InkWell(
                  onTap: () {
                    if (watchController.isRunning) {
                      watchController.stop();
                    } else {
                      watchController.start();
                    }
                  },
                  child: Ink(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.cyan[700],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        watchController.isRunning ? 'Pause' : 'Play',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 25,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

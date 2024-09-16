
import 'package:flutter/material.dart';
import 'package:puzzle_game/models/tile.dart';

class TilesController extends ChangeNotifier {
  List<Tile> tiles = [];

  int movesNumber = 0;

  bool _isCanMoveTile(int index, int nullTileIndex) {
    List<int> koorTiles = [
      nullTileIndex - 1,
      nullTileIndex + 1,
      nullTileIndex - 4,
      nullTileIndex + 4,
    ];
    return koorTiles.contains(index);
  }

  void initialTiles() {
    movesNumber = 0;

    tiles = List.generate(15, (index) {
      return Tile(
        number: index + 1,
      );
    });

    tiles.add(Tile(
      number: null,
      isEmptyTile: true,
    ));

    tiles.shuffle();

    notifyListeners();
  }

  void moveTile(int index) {
    int nullTileIndex = tiles.indexWhere((tile) => tile.isEmptyTile);
    if (_isCanMoveTile(index, nullTileIndex)) {
      tiles[nullTileIndex] = tiles[index];
      tiles[index] = Tile(number: null, isEmptyTile: true);

      movesNumber++;

      notifyListeners();
    }
  }

  bool checkWon() {
    bool isWin = false;
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i].isEmptyTile) continue;
      if (tiles[i].number != i + 1) {
        isWin = false;
        return isWin;
      } else {
        isWin = true;
      }
    }
    return isWin;
  }
}

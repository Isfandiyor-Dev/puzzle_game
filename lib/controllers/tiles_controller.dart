import 'dart:math';

import 'package:flutter/material.dart';
import 'package:puzzle_game/data/models/tile.dart';

class TilesController extends ChangeNotifier {
  List<Tile> tiles = [];

  int movesNumber = 0;

  bool _isCanMoveTile(int index, int nullTileIndex) {
    int row = index ~/ 4;
    int col = index % 4;
    int nullRow = nullTileIndex ~/ 4;
    int nullCol = nullTileIndex % 4;
    return (row == nullRow && (col - nullCol).abs() == 1) ||
        (col == nullCol && (row - nullRow).abs() == 1);
  }

  void initialTiles() {
    movesNumber = 0;
    int nullTileIndex = Random().nextInt(16);
    tiles = List.generate(15, (index) {
      return Tile(
        number: index + 1,
        canMove: false,
      );
    });

    tiles.add(Tile(
      number: null,
      isEmptyTile: true,
    ));

    tiles.shuffle();

    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i].isEmptyTile) continue;
      tiles[i].canMove = _isCanMoveTile(i, nullTileIndex);
    }

    notifyListeners();
  }

  void moveTile(int index) {
    int nullTileIndex = tiles.indexWhere((tile) => tile.isEmptyTile);
    if (_isCanMoveTile(index, nullTileIndex)) {
      tiles[nullTileIndex] = tiles[index];
      tiles[index] = Tile(number: null, isEmptyTile: true);

      for (int i = 0; i < tiles.length; i++) {
        if (tiles[i].isEmptyTile) continue;
        tiles[i].canMove = _isCanMoveTile(i, nullTileIndex);
      }

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

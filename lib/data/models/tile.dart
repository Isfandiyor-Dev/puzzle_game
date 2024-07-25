class Tile {
  int? number;
  bool canMove;
  final bool isEmptyTile;

  Tile({
    required this.number,
    this.canMove = false,
    this.isEmptyTile = false,
  });
}

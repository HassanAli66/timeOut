class ChessModes {
  String type, img;
  List<String> duruations;
  ChessModes(this.type, this.duruations, this.img);
}

List<ChessModes> li = [
  ChessModes("Classical", ["30 + 0", "30 + 20"], "images/classical.jpg"),
  ChessModes("Rapid", ["10 + 0", "10 + 5", "15 + 10"], "images/rapid.jpg"),
  ChessModes("Blitz", ["3 + 0", "3 + 2", "5 + 0", "5 + 3"], "images/blitz.png"),
  ChessModes("Bullet", ["1 + 0", "2 + 1"], "images/bullet.jpg"),
];

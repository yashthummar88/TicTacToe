import 'game.dart';

class Calculation {
  List<double> fill;
  List<double> p1;
  List<double> p2;
  Calculation({this.fill, this.p1, this.p2});
  int checkWinner() {
    var winner = -1;
    if (p1.contains(1) && p1.contains(2) && p1.contains(3)) {
      winner = 1;

      Game.point1++;
    }
    if (p2.contains(1) && p2.contains(2) && p2.contains(3)) {
      winner = 2;
      Game.point2++;
    }

    // row 2
    if (p1.contains(4) && p1.contains(5) && p1.contains(6)) {
      winner = 1;
      Game.point1++;
    }
    if (p2.contains(4) && p2.contains(5) && p2.contains(6)) {
      winner = 2;
      Game.point2++;
    }

    // row 3
    if (p1.contains(7) && p1.contains(8) && p1.contains(9)) {
      winner = 1;
      Game.point1++;
    }
    if (p2.contains(7) && p2.contains(8) && p2.contains(9)) {
      winner = 2;
      Game.point2++;
    }

    // col 1
    if (p1.contains(1) && p1.contains(4) && p1.contains(7)) {
      winner = 1;
      Game.point1++;
    }
    if (p2.contains(1) && p2.contains(4) && p2.contains(7)) {
      winner = 2;
      Game.point2++;
    }

    // col 2
    if (p1.contains(2) && p1.contains(5) && p1.contains(8)) {
      winner = 1;
      Game.point1++;
    }
    if (p2.contains(2) && p2.contains(5) && p2.contains(8)) {
      winner = 2;
      Game.point2++;
    }

    // col 3
    if (p1.contains(3) && p1.contains(6) && p1.contains(9)) {
      winner = 1;
      Game.point1++;
    }
    if (p2.contains(3) && p2.contains(6) && p2.contains(9)) {
      winner = 2;
      Game.point2++;
    }

    //diagonal
    if (p1.contains(1) && p1.contains(5) && p1.contains(9)) {
      winner = 1;
      Game.point1++;
    }
    if (p2.contains(1) && p2.contains(5) && p2.contains(9)) {
      winner = 2;
      Game.point2++;
    }

    if (p1.contains(3) && p1.contains(5) && p1.contains(7)) {
      winner = 1;
      Game.point1++;
    }
    if (p2.contains(3) && p2.contains(5) && p2.contains(7)) {
      winner = 2;
      Game.point2++;
    }

    if (fill[0] == 1 &&
        fill[1] == 1 &&
        fill[2] == 1 &&
        fill[3] == 1 &&
        fill[4] == 1 &&
        fill[5] == 1 &&
        fill[6] == 1 &&
        fill[7] == 1 &&
        fill[8] == 1) {
      if (p1.contains(1) && p1.contains(2) && p1.contains(3)) {
        winner = 1;
      } else if (p1.contains(4) && p1.contains(5) && p1.contains(6)) {
        winner = 1;
      } else if (p1.contains(7) && p1.contains(8) && p1.contains(9)) {
        winner = 1;
      } else if (p1.contains(1) && p1.contains(4) && p1.contains(7)) {
        winner = 1;
      } else if (p1.contains(2) && p1.contains(5) && p1.contains(8)) {
        winner = 1;
      } else if (p1.contains(3) && p1.contains(6) && p1.contains(9)) {
        winner = 1;
      } else if (p1.contains(1) && p1.contains(5) && p1.contains(9)) {
        winner = 1;
      } else if (p1.contains(3) && p1.contains(5) && p1.contains(7)) {
        winner = 1;
      } else {
        winner = 3;
      }
    }

    return winner;
  }
}

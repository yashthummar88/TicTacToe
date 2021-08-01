import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/screens/calculation.dart';

class Game extends StatefulWidget {
  double set = 1;
  static int point1 = 0;
  static int point2 = 0;
  //double op = 0;
  int winner = 0;
  List<double> op = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> fill = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> p1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> p2 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<String> img = [
    "assets/images/circle.png",
    "assets/images/circle.png",
    "assets/images/circle.png",
    "assets/images/circle.png",
    "assets/images/circle.png",
    "assets/images/circle.png",
    "assets/images/circle.png",
    "assets/images/circle.png",
    "assets/images/circle.png"
  ];
  Random ran = new Random();

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    List l = ModalRoute.of(context).settings.arguments;
    Widget _friend({int i, double j}) {
      return Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              if (widget.fill[i] == 0) {
                widget.fill[i] = 1;
                widget.op[i] = 1;
                if (widget.set == 1) {
                  widget.img[i] = l[0];
                  widget.p1[i] = j;
                  widget.set = 2;
                } else {
                  widget.img[i] = l[1];
                  widget.p2[i] = j;
                  widget.set = 1;
                }
                Calculation c1 = Calculation(
                  fill: widget.fill,
                  p1: widget.p1,
                  p2: widget.p2,
                );
                widget.winner = c1.checkWinner();
                //print(widget.winner);

              }
              if (widget.winner == 1) {
                Navigator.of(context)
                    .pushNamed('/result', arguments: ["Player - 1", l]);
              }
              if (widget.winner == 2) {
                Navigator.of(context)
                    .pushNamed('/result', arguments: ["Player - 2", l]);
              }
              if (widget.winner == 3) {
                Navigator.of(context)
                    .pushNamed('/result', arguments: ["Draw", l]);
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                right: (i == 2 || i == 5 || i == 8)
                    ? BorderSide.none
                    : BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                bottom: (i == 6 || i == 7 || i == 8)
                    ? BorderSide.none
                    : BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
              ),
            ),
            alignment: Alignment.center,
            child: Opacity(
              opacity: widget.op[i],
              child: Image(
                image: AssetImage(widget.img[i]),
              ),
            ),
          ),
        ),
        flex: 1,
      );
    }

    Widget _comp({int i, double j}) {
      return Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              if (widget.fill[i] == 0) {
                widget.fill[i] = 1;
                widget.op[i] = 1;
                if (widget.set == 1) {
                  widget.img[i] = l[0];
                  widget.p1[i] = j;
                  widget.set = 2;
                }
                if (widget.set == 2) {
                  //bool flag = false;
                  if (widget.fill[0] == 0 ||
                      widget.fill[1] == 0 ||
                      widget.fill[2] == 0 ||
                      widget.fill[3] == 0 ||
                      widget.fill[4] == 0 ||
                      widget.fill[5] == 0 ||
                      widget.fill[6] == 0 ||
                      widget.fill[7] == 0 ||
                      widget.fill[8] == 0) {
                    do {
                      int r = widget.ran.nextInt(8);
                      if (widget.fill[r] == 0) {
                        widget.fill[r] = 1;
                        widget.img[r] = l[1];
                        widget.p2[r] = r + 1.0;
                        widget.op[r] = 1;
                        widget.set = 1;
                        //flag = true;
                        break;
                      }
                    } while (true);
                  }
                }
                print(widget.fill);
                Calculation c1 = Calculation(
                  fill: widget.fill,
                  p1: widget.p1,
                  p2: widget.p2,
                );
                widget.winner = c1.checkWinner();

                //print(widget.winner);

              }

              if (widget.winner == 1) {
                Navigator.of(context)
                    .pushNamed('/result', arguments: ["Player - 1", l]);
              }
              if (widget.winner == 2) {
                Navigator.of(context)
                    .pushNamed('/result', arguments: ["Computer", l]);
              }
              if (widget.winner == 3) {
                Navigator.of(context)
                    .pushNamed('/result', arguments: ["Draw", l]);
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                right: (i == 2 || i == 5 || i == 8)
                    ? BorderSide.none
                    : BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                bottom: (i == 6 || i == 7 || i == 8)
                    ? BorderSide.none
                    : BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
              ),
            ),
            alignment: Alignment.center,
            child: Opacity(
              opacity: widget.op[i],
              child: Image(
                image: AssetImage(widget.img[i]),
              ),
            ),
          ),
        ),
        flex: 1,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    l[2],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        print(widget.op);
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${Game.point1}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${Game.point2}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    l[3],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: (l[3] == "player2")
                            ? [
                                _friend(i: 0, j: 1),
                                _friend(i: 1, j: 2),
                                _friend(i: 2, j: 3),
                              ]
                            : [
                                _comp(i: 0, j: 1),
                                _comp(i: 1, j: 2),
                                _comp(i: 2, j: 3),
                              ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: (l[3] == "player2")
                            ? [
                                _friend(i: 3, j: 4),
                                _friend(i: 4, j: 5),
                                _friend(i: 5, j: 6),
                              ]
                            : [
                                _comp(i: 3, j: 4),
                                _comp(i: 4, j: 5),
                                _comp(i: 5, j: 6),
                              ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: (l[3] == "player2")
                            ? [
                                _friend(i: 6, j: 7),
                                _friend(i: 7, j: 8),
                                _friend(i: 8, j: 9),
                              ]
                            : [
                                _comp(i: 6, j: 7),
                                _comp(i: 7, j: 8),
                                _comp(i: 8, j: 9),
                              ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

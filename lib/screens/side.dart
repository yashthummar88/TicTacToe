import 'package:flutter/material.dart';

class Side extends StatefulWidget {
  double _opcircle = 0.6;
  double _opcross = 0.6;
  double _opcrossmid = 0;
  double _opcirclemid = 0;
  String p1sign = "assets/images/circle.png";
  String p2sign = "assets/images/close.png";

  //Side({});
  @override
  _SideState createState() => _SideState();
}

class _SideState extends State<Side> {
  @override
  Widget build(BuildContext context) {
    final String p1 = "player1";
    final String p2 = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pick Your side Player 1',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: widget._opcircle,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget._opcircle = 1;
                          widget._opcirclemid = 1;
                          widget._opcrossmid = 0;
                          widget._opcross = 0.6;
                          widget.p2sign = "assets/images/close.png";
                          widget.p1sign = "assets/images/circle.png";
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              child: Image(
                                image: AssetImage('assets/images/circle.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color:
                                      Colors.blue.withOpacity(widget._opcircle),
                                  width: 4,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.blue
                                      .withOpacity(widget._opcirclemid),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Opacity(
                    opacity: widget._opcross,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget._opcircle = 0.6;
                          widget._opcross = 1;
                          widget._opcrossmid = 1;
                          widget._opcirclemid = 0;
                          widget.p2sign = "assets/images/circle.png";
                          widget.p1sign = "assets/images/close.png";
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              child: Image(
                                image: AssetImage('assets/images/close.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color:
                                      Colors.blue.withOpacity(widget._opcross),
                                  width: 4,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.blue
                                      .withOpacity(widget._opcrossmid),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                                "Do you want to continue? press continue."),
                            content: Container(
                              height: 120,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(p1),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                          image: AssetImage(widget.p1sign),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(p2),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Image(
                                          image: AssetImage(widget.p2sign),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              InkWell(
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {});
                                  Navigator.of(context)
                                      .pushNamed('/game', arguments: [
                                    widget.p1sign,
                                    widget.p2sign,
                                    p1,
                                    p2,
                                  ]);
                                },
                              ),
                            ],
                            actionsPadding: EdgeInsets.only(
                              bottom: 10,
                              right: 10,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        // /offset: Offset(5, 5),
                        blurRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'timer.dart';

class Options extends StatelessWidget {
  void checkAction(String str) {
    if (str == "30 + 0") {
      mins = 30;
      bonus = 0;
    } else if (str == "30 + 20") {
      mins = 30;
      bonus = 20;
    } else if (str == "10 + 0") {
      mins = 10;
      bonus = 0;
    } else if (str == "10 + 5") {
      mins = 30;
      bonus = 5;
    } else if (str == "15 + 10") {
      mins = 15;
      bonus = 10;
    } else if (str == "3 + 0") {
      mins = 3;
      bonus = 0;
    } else if (str == "3 + 2") {
      mins = 3;
      bonus = 2;
    } else if (str == "5 + 0") {
      mins = 5;
      bonus = 0;
    } else if (str == "5 + 3") {
      mins = 5;
      bonus = 3;
    } else if (str == "1 + 0") {
      mins = 1;
      bonus = 0;
    } else if (str == "2 + 1") {
      mins = 2;
      bonus = 1;
    }
  }

  final e;
  Options(this.e);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(e.type,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                          )),
                    ),
                    ...e.duruations.map((i) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          color: Colors.white,
                          onPressed: () {
                            checkAction(i);
                            Navigator.of(context).pushNamed("/timer");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            i,
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: CircleAvatar(
                    radius: 75.0,
                    child: ClipRRect(
                      child: Image.asset(
                        e.img,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}

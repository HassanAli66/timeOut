import 'dart:async';

import 'package:flutter/material.dart';

int mins, secs = 0, bonus;

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer t1sec, t2sec;
  int _min1 = mins,
      _min2 = mins,
      _sec1 = secs,
      _sec2 = secs,
      _lastSec1 = secs,
      _lastMin1 = mins,
      _lastSec2 = secs,
      _lastMin2 = mins;

  bool isPaused = true,
      isBlocked1 = true,
      isBlocked2 = true,
      turn = false,
      gameStarted1 = false,
      gameStarted2 = false,
      gameEnded = false,
      p1winner = false,
      p2winner = false;

  void startTimer1(Timer tsec) {
    tsec = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!gameEnded) {
        setState(() {
          if (_sec1 == 0) {
            _min1--;
            _sec1 = 59;
            if (_min1 < 0 && !isPaused) {
              gameEnded = true;
              isPaused = true;
              p2winner = true;
            }
          } else
            _sec1--;
        });
      }
    });
  }

  void startTimer2(Timer tsec) {
    tsec = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!gameEnded) {
        setState(() {
          if (_sec2 == 0) {
            _min2--;
            _sec2 = 59;
            if (_min2 < 0 && !isPaused) {
              gameEnded = true;
              isPaused = true;
              p1winner = true;
            }
          } else
            _sec2--;
        });
      }
    });
  }

  void onClick1() {
    setState(() {
      _lastSec1 = _sec1;
      _lastMin1 = _min1;
      _sec2 = _lastSec2;
      _min2 = _lastMin2;
    });
    addBonus(1);
  }

  void onClick2() {
    setState(() {
      _lastSec2 = _sec2;
      _lastMin2 = _min2;
      _sec1 = _lastSec1;
      _min1 = _lastMin1;
    });
    addBonus(2);
  }

  void addBonus(int p) {
    if (p == 1) {
      if (_sec1 + bonus < 60) {
        setState(() {
          _lastSec1 += bonus;
        });
      } else {
        setState(() {
          _lastMin1++;
          _lastSec1 = _lastSec1 + bonus - 60;
        });
      }
    } else if (p == 2) {
      if (_sec2 + bonus < 60) {
        setState(() {
          _lastSec2 += bonus;
        });
      } else {
        setState(() {
          _lastMin2++;
          _lastSec2 = _lastSec2 + bonus - 60;
        });
      }
    }
  }

  String toTwoDigitsForm(int m, int s) {
    String _mins, _secs;
    m < 10 ? _mins = "0" + m.toString() : _mins = m.toString();
    s < 10 ? _secs = "0" + s.toString() : _secs = s.toString();
    return _mins + ":" + _secs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isPaused
          ? AppBar(
              backgroundColor: Colors.black,
              title: Text("Timer is Freezed!"),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SizedBox(
                  child: RaisedButton(
            child: RotatedBox(
                quarterTurns: 2,
                child: Text(
                    _min2 < 0 || _min1 < 0
                        ? p2winner
                            ? "You won"
                            : "You lost"
                        : isPaused || isBlocked2
                            ? "${toTwoDigitsForm(_lastMin2, _lastSec2)}"
                            : "${toTwoDigitsForm(_min2, _sec2)}",
                    style: TextStyle(fontSize: 45))),
            onPressed: isPaused || isBlocked2
                ? null
                : () {
                    onClick2();
                    setState(() {
                      isBlocked1 = !isBlocked1;
                      isBlocked2 = !isBlocked2;
                      turn = !turn;
                    });
                  },
          ))),
          gameEnded
              ? SizedBox(
                  height: 0,
                )
              : RaisedButton(
                  color: isPaused ? Colors.green : Colors.red[900],
                  child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
                  onPressed: () {
                    setState(() {
                      if (!gameEnded) {
                        if (isPaused) {
                          _min1 = _lastMin1;
                          _sec1 = _lastSec1;
                          _min2 = _lastMin2;
                          _sec2 = _lastSec2;
                        } else {
                          if (turn) {
                            _lastMin2 = _min2;
                            _lastSec2 = _sec2;
                          } else {
                            _lastMin1 = _min1;
                            _lastSec1 = _sec1;
                          }
                        }
                      }
                      isPaused = !isPaused;
                      !turn ? isBlocked1 = false : isBlocked2 = false;
                      if (!gameStarted1) {
                        startTimer1(t1sec);
                        gameStarted1 = true;
                      }
                    });
                  }),
          Expanded(
              child: SizedBox(
                  child: RaisedButton(
            child: Text(
                _min2 < 0 || _min1 < 0
                    ? p1winner
                        ? "You won"
                        : "You lost"
                    : isPaused || isBlocked1
                        ? "${toTwoDigitsForm(_lastMin1, _lastSec1)}"
                        : "${toTwoDigitsForm(_min1, _sec1)}",
                style: TextStyle(fontSize: 45)),
            onPressed: isPaused || isBlocked1
                ? null
                : () {
                    if (!gameStarted2) {
                      startTimer2(t2sec);
                      gameStarted2 = true;
                    }
                    onClick1();
                    setState(() {
                      isBlocked1 = !isBlocked1;
                      isBlocked2 = !isBlocked2;
                      turn = !turn;
                    });
                  },
          ))),
        ],
      ),
    );
  }
}

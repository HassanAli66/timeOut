import 'package:flutter/material.dart';
import 'timer.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Custom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
          child: Column(
            children: [
              Text("Custom",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                  )),
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.timelapse_rounded,
                            color: Colors.black,
                          ),
                          hintText: "Set your main time in minutes",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (String val) {
                          int timeInMins = int.tryParse(val);
                          if (timeInMins == null || timeInMins <= 0) {
                            return "The time you set must be greater than 0 minutes";
                          }
                          if (timeInMins > 59) {
                            return "Minutes you set must be from 1 to 59 minutes";
                          }
                          return "";
                        },
                        onSaved: (String val) {
                          mins = int.parse(val);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.more_time_rounded,
                            color: Colors.black,
                          ),
                          hintText: "Set your bonus time in seconds",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (String val) {
                          int timeInSecs = int.tryParse(val);
                          if (timeInSecs == null) {
                            return "You must set a bonus time";
                          }
                          if (timeInSecs < 0) {
                            return "The bonus time must be positive";
                          }
                          if (timeInSecs > 59) {
                            return "Seconds you set must be from 0 to 59 seconds";
                          }
                          return "";
                        },
                        onSaved: (String val) {
                          bonus = int.parse(val);
                        },
                      ),
                      RaisedButton(
                          child: Text(
                            'Start',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            Navigator.of(context).pushNamed("/timer");
                          })
                    ],
                  ),
                ),
              )
            ],
          ))
    ]);
  }
}

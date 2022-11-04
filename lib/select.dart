import 'package:flutter/material.dart';

import 'mode.dart';
import 'custom.dart';
import 'options.dart';

class SelectMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Mode selection"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...li.map((e) {
                return Column(
                  children: <Widget>[
                    Options(e),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              }).toList(),
              Custom()
            ],
          ),
        ),
      ),
    );
  }
}

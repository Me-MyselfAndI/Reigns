import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Indicator {

  IconData icon;
  String name;
  int level;
  Text outputName;

  Indicator (this.name, this.icon) {
    outputName = Text (this.name,
      style: TextStyle (
        fontSize: 11.0,
      ),
    );
    level = 50;
  }

  void changeWellness (int changeAmount) {
    level += changeAmount;
  }

  bool check () {
    return this.level > 0 && this.level < 100;
  }

  Widget getWidget () {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Icon (icon,
            size: 40,
            color: Color.fromARGB(200, (100-level)*4, level*4, 20),
          ),
          outputName,
        ],
      ),
    );
  }
}
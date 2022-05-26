import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyBottom extends StatelessWidget {
  var colors;
  String Name;
  dynamic asmaa;
  //var shape;
  //var c;

  MyBottom({
    required this.colors,
    required this.asmaa,
    required this.Name,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      //shape: shape,
      color: colors,
      borderRadius: BorderRadius.circular(250),
      child: MaterialButton(
        onPressed: asmaa,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              Name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

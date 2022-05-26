import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Text_Filed_Test.dart';
class Rowtype extends StatelessWidget {
  String bloodtype;
  dynamic asmaa;
  //var inputvalue;
  //TextEditingController inputvalue= TextEditingController();
  Rowtype(
      {required this.bloodtype, required this.asmaa});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red[700],
            child: Text(
              bloodtype,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 10,
          ),

        TextFiledTest(Icons.quiz, "value", false,TextInputType.number , asmaa)
        ],
      ),
    );
  }
}
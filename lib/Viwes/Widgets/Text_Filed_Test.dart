import 'package:flutter/material.dart';

class TextFiledTest extends StatelessWidget {
  IconData icon;
  String hintText;
  bool hide;
  var typekeyboard;
  dynamic asmaa;
 //TextEditingController Controller= new TextEditingController();
  TextFiledTest(
      this.icon, this.hintText, this.hide, this.typekeyboard, this.asmaa,//this.Controller
      );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Center(
        child: TextField(//controller: Controller,
          onChanged: asmaa,
          obscureText: hide,
          keyboardType: typekeyboard,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(15)),
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

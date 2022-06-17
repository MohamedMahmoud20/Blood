import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserButtom extends StatefulWidget {
  dynamic asmaa;
  var namebutton;
  var colorbutton;
  UserButtom({required this.asmaa,required this.namebutton,required this.colorbutton});

  @override
  State<UserButtom> createState() => _UserButtomState();
}

class _UserButtomState extends State<UserButtom> {
  @override
  Widget build(BuildContext context) {
    return    Material(
        color: widget.colorbutton,
        borderRadius: BorderRadius.circular(15),
        child: MaterialButton(
            onPressed: widget.asmaa,
            child:widget.namebutton));
  }
}

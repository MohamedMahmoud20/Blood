import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserButtom extends StatelessWidget {
  dynamic asmaa;
  var namebutton;
  var colorbutton;
  UserButtom({required this.asmaa,required this.namebutton,required this.colorbutton});
  @override
  Widget build(BuildContext context) {
    return    Material(
        color: colorbutton,
        borderRadius: BorderRadius.circular(15),
        child: MaterialButton(
            onPressed: asmaa,
            child:namebutton));
  }
}

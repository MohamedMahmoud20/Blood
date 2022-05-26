import 'package:flutter/material.dart';
class ForgetPassword extends StatefulWidget {
  static const String route = "ForgetPassword";



  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(color: Colors.white,child:  Text("Forget password",style: TextStyle(color: Colors.black),),));
  }
}

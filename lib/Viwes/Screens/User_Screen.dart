import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'User_Sign_In_Screen.dart';
import 'User_Sign_Up.dart';
//import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class UserScreen extends StatefulWidget {
  static const String route = "UserScreen";

  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _CurrentIndex = 0;
  List<Widget> WidgetOption = <Widget>[UserSignInScreen(), UserSignUpScreen()];
  bool Selectbox = true;

  void _changeitems(int value) {
    setState(() {
      _CurrentIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[100],
        body: WidgetOption.elementAt(_CurrentIndex),
        bottomNavigationBar: BottomNavigationBar(

          backgroundColor: Colors.white,
          selectedItemColor: Colors.red[900],
          unselectedItemColor: Colors.grey,
          onTap: _changeitems,
          currentIndex: _CurrentIndex,
          items: [
            BottomNavigationBarItem(
                label: "SignIn",
                icon: Icon(
                  Icons.login,
                  //color: Colors.amber,
                )),
            BottomNavigationBarItem(
                label: "SignUp",
                icon: Icon(
                  Icons.app_registration_rounded,
                  // color: Colors.amber,
                )),
          ],
        ),);
  }
}


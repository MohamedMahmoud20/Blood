import 'package:bloodbankasmaa/Viwes/Screens/Donor_Data_Screen.dart';
import 'package:flutter/material.dart';

import 'Drawer_Body.dart';
import 'Patient_Data_Screen.dart';

class DOrPScreentap extends StatefulWidget {
  const DOrPScreentap({Key? key}) : super(key: key);
  static const String route = "DOrPScreentap";

  @override
  _DOrPScreentapState createState() => _DOrPScreentapState();
}

class _DOrPScreentapState extends State<DOrPScreentap> {
  int _CurrentIndex = 0;
  List<Widget> WidgetOption = <Widget>[DonorDataScreen(), PatientDataScreen()];
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
              label: "Donor",
              icon: Icon(
                Icons.person_outline,
                //color: Colors.amber,
              )),
          BottomNavigationBarItem(
              label: "Patient",
              icon: Icon(
                Icons.person_outline,
                // color: Colors.amber,
              )),
        ],
      ),
    );
  }
}


import 'package:bloodbankasmaa/Viwes/Widgets/My_Buttom.dart';
import 'package:flutter/material.dart';
import 'Hospital_Screen.dart';
import 'User_Screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white
      ,body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                "Assent/Image/blood-3.png",
                height: 200,width: double.infinity,),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Blood Life",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
            SizedBox(
              height: 50,
            ),
            MyBottom(
                colors: Colors.red[400],
                asmaa: () {
                  Navigator.pushNamed(context, UserScreen.route);
                },
                Name: "User"),
            SizedBox(
              height: 20,
            ),
            MyBottom(
                colors: Colors.red[800],
                asmaa: () {
                  Navigator.pushNamed(context,HospitalScreen.route);
                },
                Name: "Admin")
          ],
        ),
      ),
    );
  }
}

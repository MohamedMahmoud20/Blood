import 'package:bloodbankasmaa/Controller/ApiLogin.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/My_Buttom.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';
import 'Request.dart';
class BodyDrawerHospital extends StatefulWidget {
  const BodyDrawerHospital({Key? key}) : super(key: key);

  @override
  State<BodyDrawerHospital> createState() => _BodyDrawerHospitalState();
}

class _BodyDrawerHospitalState extends State<BodyDrawerHospital> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.red[100],
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return RequestBloodScreen();
                }));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.red[700],
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Requests",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Logout(context);
              },
              child: Row(children: [
                Icon(
                  Icons.logout_rounded,
                  color: Colors.red[700],
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text("LogOut" ,  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800]),)
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            MyBottom(
                colors: Colors.red[900],
                asmaa: () {
                  getProfile();
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {

                    return profile();
                  }

                  ));

                },
                Name: "Profile"),],
        ),
      ),
    );
  }
}

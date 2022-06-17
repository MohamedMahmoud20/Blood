import 'package:bloodbankasmaa/Viwes/Screens/User_Sign_Up.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/Text_Filed_Test.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/User_Buttomm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drawer_Body.dart';
import 'Hospital_details_Screen.dart';

class PatientDataScreen extends StatefulWidget {
  static const String route = "PatientDataScreen";

  const PatientDataScreen({Key? key}) : super(key: key);

  @override
  _PatientDataScreenState createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  var age;
  var BB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerBody(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            //SizedBox(width: 10,)
                            Text(
                           "",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Phone : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            //SizedBox(width: 10,)
                            Text(""
                              , style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ), ],
                  ),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red))),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Age : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red[600]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextFiledTest(
                                Icons.add, "Age", false, TextInputType.number,
                                (value) {
                              setState(() {
                                age = value;
                                print("Age : $age years");
                              });
                            })
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            (age == null || age=="") ? "" : "Age : $age years",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.black,
                          thickness: 3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your BloodType : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red[600]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextFiledTest(
                                Icons.add, "Blood", false, TextInputType.visiblePassword,
                                (value) {
                              setState(() {
                                BB = value;
                                print("YourBlood : $BB");
                              });
                            })
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            (BB == null ||  BB=="")  ? "" : "Your Blood : $BB",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.black,
                          thickness: 3,
                        ),
                      ),
                    ],
                  ),
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red))),
              SizedBox(
                height: 25,
              ),
              UserButtom(
                  asmaa: () {
                    Navigator.pushNamed(context, HospitalDetailsScreen.route);

                  },
                  namebutton: Text("Find Hospital",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  colorbutton: Colors.red[600])
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))
        ],
        title: Text("Patient"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
    );
  }
}

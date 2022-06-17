import 'package:bloodbankasmaa/Viwes/Screens/Drawer_Body.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/My_Buttom.dart';
import 'package:flutter/material.dart';
import 'Donor_Data_Screen.dart';
import 'Patient_Data_Screen.dart';

class DOrPScreen extends StatefulWidget {
  static const String route = "DOrPScreen";

  @override
  _DOrPScreenState createState() => _DOrPScreenState();
}

class _DOrPScreenState extends State<DOrPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.red,),
      backgroundColor: Colors.red[40],
      drawer: DrawerBody(),
      body:
      Stack(
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(150)),
                  child: Image.asset(
                    "Assent/Image/55.jpg",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: 400,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(150)),
                    color: Colors.red.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 25, right: 25),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 200,
                      color: Colors.red.withOpacity(.1))
                ],
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Status : ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                    SizedBox(
                      height: 39,
                    ),
                    MyBottom(
                        colors: Colors.red[500],
                        asmaa: () {
                          Navigator.pushNamed(context, PatientDataScreen.route);
                        },
                        Name: "Patient"),
                    SizedBox(
                      height: 50,
                    ),
                    MyBottom(
                        colors: Colors.red[900],
                        asmaa: () {
                          Navigator.pushNamed(context,DonorDataScreen.route);
                        },
                        Name: "Donor")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

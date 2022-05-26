// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors

import 'package:bloodbankasmaa/Viwes/Widgets/Text_Filed.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/Text_Filed_Test.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/User_Buttomm.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BloodTest extends StatefulWidget {
  static const String route = "BloodTest";

  @override
  _BloodTestState createState() => _BloodTestState();
}

class _BloodTestState extends State<BloodTest> {
  late String result;
  var D;
  var P;

  dynamic BloodType() {

    if(D==null||P==null || D=="" ||P==""){
      print("Please Enter Value In Both Fields");
      Alert(
        context: context,
        type: AlertType.info,
        title: "Please Enter Value",
        desc: "من فضلك ادخل فصيله الدم فى الخانتين",
        buttons: [
          DialogButton(
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
   else if (D == "A+" && (P == "A+" || P == "AB+")) {
      print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    }
   else if (D == "B+" && (P == "B+" || P == "AB+")) {
      print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    } else if (D == "O+" &&
        (P == "B+" || P == "AB+" || P == "O+" || P == "A+")) {
      print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    }
   else if (D == "AB+" && P == "AB+") {
      print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    } else if (D == "B-" &&
        (P == "B-" || P == "B+" || P == "AB+" || P == "AB-")) {
      print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    } else if (D == "O-") {
      print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    } else if (D == "A-" &&
        (P == "A-" || P == "A+" || P == "AB+" || P == "AB-")) {
      print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    } else if (D == "AB-" && (P == "AB+" || P == "AB-")) {
     print("Valid");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Valid",
        desc: "صالحة للتبرع",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

    } else {
      print("Not Valid");
     Alert(
      context: context,
      type: AlertType.error,
      title: "Not Valid",
      desc: "غير صالحة للتبرع",
      buttons: [
        DialogButton(
          child: Text(
            "Finish",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    }
  }

  TextEditingController inputvalue =new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(150)),
                  child: Image.asset(
                    "Assent/Image/55.jpg",
                    height: 400,
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
                    color: Colors.red.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 25, right: 25),
            child: Container(
              height: 500,
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
                padding: const EdgeInsets.only(top: 150),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Blood Type Of Donor",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red[400]),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          TextFiledTest(
                              Icons.person_outline, "Enter : D", false, TextInputType.name,
                                  (value) {
                                    setState(() {
                                      D=value;
                                      print("Value $value");
                                    });
                              },),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Blood Type Of Patient ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red[400]),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          TextFiledTest(
                              Icons.person_outline, "Enter : P", false, TextInputType.name,
                                  (value) {
                                    setState(() {
                                      P=value;
                                      print("vVALUE $value");
                                    });
                              },),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      UserButtom(
                          asmaa: () {
                           setState(() {
                             BloodType();
                             //D=null;P=null;
                           });

                          },
                          namebutton: Text("Test",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          colorbutton: Colors.red[700])
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

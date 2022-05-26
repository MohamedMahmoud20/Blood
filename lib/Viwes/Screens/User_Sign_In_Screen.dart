import 'dart:developer';

import 'package:bloodbankasmaa/Controller/ApiLogin.dart';
import 'package:bloodbankasmaa/Controller/controllerlogin.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/Text_Filed.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/User_Buttomm.dart';
import 'package:flutter/material.dart';

import '../../Conests.dart';
import 'D_Or_P_Screen_Tap.dart';
import 'Forget_Password.dart';

class UserSignInScreen extends StatefulWidget {
  const UserSignInScreen({Key? key}) : super(key: key);
  static const String route = "UserSignInScreen";

  @override
  _UserSignInScreenState createState() => _UserSignInScreenState();
}

class _UserSignInScreenState extends State<UserSignInScreen> {
  bool Selectbox = true;
  String email = "";
  String password = "";

  @override
  void initState() {
    ReadP(context);
    super.initState();
  }


  //final _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.red[100],
        body: Container(
          child: Stack(
            children: [
              Container(
                height: 400,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "Assent/Image/ff.jfif",
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 400,
                      padding: EdgeInsets.all(10),
                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.red.withOpacity(0.4),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Welcome to",
                                style: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 2,
                                  color: Colors.yellow[700],
                                ),
                                children: [
                                  TextSpan(
                                    text: " Blood Life,",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow[700],
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Signin to Continue",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250, left: 25, right: 25),
                child: Container(
                  height: 380,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 25,
                          color: Colors.red)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SignIn",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.activeColor),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 3,
                              width: 70,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            buildTextField(Icons.email_outlined, "email", false,
                                TextInputType.emailAddress, (value) {
                              if (value.isEmpty) {
                                return " the Email is required..!";
                              } else {
                                return null;
                              }
                            }, (value) {
                              email = value;
                            }),
                            buildTextField(Icons.lock_outline, "password", true,
                                TextInputType.visiblePassword, (value) {
                              if (value.isEmpty) {
                                return " the password is required..!";
                              } else if (value.length < 6) {
                                return "the password must be =< 6 value..!";
                              } else {
                                return null;
                              }
                            }, (value) {
                              password = value;
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: !Selectbox,
                                      activeColor: Palette.textColor2,
                                      onChanged: (value) {
                                        setState(() {
                                          Selectbox = !Selectbox;
                                        });
                                      },
                                    ),
                                    Text("Remember me",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Palette.textColor1))
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, ForgetPassword.route);

                                  },
                                  child: Text("Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Palette.textColor1)),
                                )
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "SignIn As?", //textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Palette.activeColor),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (formkey.currentState!.validate()) {
                                        Login(email, password, context);
                                        //     scaffoldkey.currentState?.showSnackBar(
                                        //         SnackBar(
                                        //             content: Text(
                                        //                 "wait sing in now..! ")));
                                      }
                                      //
                                      print(email);
                                      print(password);
                                    });
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage(
                                          "Assent/Image/hossssss.png"),
                                      radius: 30),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (formkey.currentState!.validate()) {
                                        scaffoldkey.currentState?.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    " waite store data..")));
                                        Navigator.pushNamed(
                                            context, DOrPScreentap.route);

                                        print("email:$email");

                                        print("password:$password");


                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                      AssetImage("Assent/Image/person.png"),
                                      radius: 30),
                                )
                              ],
                            ) ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

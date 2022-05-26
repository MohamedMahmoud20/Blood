
import 'package:bloodbankasmaa/Controller/ApiLogin.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/Text_Filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Conests.dart';

class UserSignUpScreen extends StatefulWidget {
  static const String route = "UserSignUpScreen";
  static var nameU;
  static var phoneU;
  static var adressU;


  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  //final _auth = FirebaseAuth.instance;
  bool isMale = true;
  String email = "";
  String password = "";
  String name = "";
  String phone = "";
  String link = "";
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

@override
  void initState() {
  ReadP(context);
super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
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
                      alignment: Alignment.center,
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
                            "SignUp to Continue",
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
                padding: const EdgeInsets.only(top: 150, left: 25, right: 25),
                child: Container(
                  height: 500,
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
                              "SignUp",
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

                            buildTextField(Icons.person_outline, "User Name",
                                false, TextInputType.name, (value) {
                              if (value.isEmpty) {
                                return "the User Name is required..!";
                              } //else if (value.length < 16) {
                              //return "User Name must be < 16 letter..!"; }
                              else {
                                return null;
                              }
                            }, (value) {
                              name = value;
                            }),
//Text(name),
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
                            buildTextField(Icons.location_city, "Link GPS Address",
                                false, TextInputType.streetAddress, (value) {
                              if (value.isEmpty) {
                                return "the Link GPS Adress is required..!";
                              } else {
                                return null;
                              }
                            }, (value) {
                                  link = value;
                            }),
                            buildTextField(Icons.phone, "phone", false,
                                TextInputType.phone, (value) {
                              if (value.isEmpty) {
                                return "the Phone  is required..!";
                              } else {
                                return null;
                              }
                            }, (value) {
                              phone = value;
                            }),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "SignUp As?", //textAlign: TextAlign.left,
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
                                        // scaffoldkey.currentState?.showSnackBar(
                                        //     SnackBar(
                                        //         content: Text(
                                        //             " waite store data..")));

                                        Register(name, email, phone, password, link, context);

                                        print("name:$name");
                                        print("email:$email");
                                        print("link adress:$link");
                                        print("password:$password");
                                        print("phone:$phone");

                                      }
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
                                  onTap: () async{
                                    UserCredential google = await  signInWithGoogle();
                                    print(google.user?.displayName);
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          AssetImage("Assent/Image/person.png"),
                                      radius: 30),
                                )
                              ],
                            )
                          ],
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

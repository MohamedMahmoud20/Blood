// // ignore_for_file: non_constant_identifier_names
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import 'D_Or_P_Screen_Tap.dart';
//
// class Google extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Future<UserCredential> signInWithGoogle() async {
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       // Once signed in, return the UserCredential
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     }
//
//     return Scaffold(
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(19.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(
//                     Icons.add_business_rounded,
//                     size: 100,
//                     color: Colors.red[300],
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     "Google",
//                     style: TextStyle(fontSize: 30),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     height: 70,
//                   ),
//                   MaterialButton(
//                       height: 50,
//                       onPressed: () async {
//                         UserCredential Gogle = await  signInWithGoogle();
//                         print(Gogle.user?.displayName);
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
//                           return DOrPScreentap();
//                         }));
//                       },
//                       child: Text("Login"),
//                       splashColor: Colors.blue,
//                       color: Colors.red[300],
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15))),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         child: Text(
//                           "Sign in ?",
//                           style: TextStyle(color: Colors.blue[600], fontSize: 15),
//                         ),
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
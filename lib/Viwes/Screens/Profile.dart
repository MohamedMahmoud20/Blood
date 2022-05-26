import 'package:bloodbankasmaa/Controller/ApiLogin.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
  Scaffold(body:

  FutureBuilder( future: getProfile(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    return
      (snapshot.hasData)?
      ListView.builder( itemCount:  1,itemBuilder: (BuildContext context, int index) {
      return   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Name = =${snapshot.data["name"]}"),
          Text("Email = =${snapshot.data["email"]}"),
          Text("Phone = =${snapshot.data["phone"]}"),

        ],
      );
    },): Center(child: Text(""));
  },)

    ,);
  }
}

import 'package:flutter/material.dart';

import '../../Controller/Sqflite.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  SQFLITE SQL = SQFLITE();
  List data = [];

  readdata() async {
    var rsponse = await SQL.Select("SELECT * FROM 'blood'");
    if (mounted) {
      setState(() {});
    }
    data.addAll(rsponse);
    return rsponse;
  }

  @override
  void initState() {
    readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: data.isEmpty?Center(child: Text("No Blood" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500),),):
        Center(
      child: Container(
        height: 380,
        width: 500,
        child: Stack(
            alignment: Alignment.bottomRight,
            children:[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      text("A+", 'a+'),
                      text("B+", 'b+'),
                      text("AB+", 'ab+'),
                      text("O+", 'o+'),
                      text("A-", 'a-'),
                      text("B-", 'a-'),
                      text("O-", 'o-'),
                      text("AB-", 'ab-'),
                    ],
                  ),
                ),
              ),
            ]
        ),
      )
    ));
  }

  Widget text(name, view) {
    return Text("$name= ${data.last[view]}", style: TextStyle(fontSize: 30));
  }
}

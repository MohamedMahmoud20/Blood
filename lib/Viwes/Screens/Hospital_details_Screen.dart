import 'package:bloodbankasmaa/Controller/Sqflite.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/User_Buttomm.dart';

import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';

class HospitalDetailsScreen extends StatefulWidget {
  const HospitalDetailsScreen({Key? key}) : super(key: key);
  static const String route = "HospitalDetailsScreen";

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  SQFLITE SQL = SQFLITE();
  List fav = [];

  readdata() async {
    var rsponse = await SQL.Select("SELECT * FROM 'Todo'");
    if (mounted) {
      setState(() {});
    }
    fav.addAll(rsponse);
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
      body: ListView.builder(itemCount: fav.length,itemBuilder: (BuildContext context, int index) {
        return  Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0 ,bottom: 12.0),
          child: Container(
            height: 350,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Containerb(
                  asmaa: () {},
                  partA1: "${fav[index]['name']}",
                  partB1: "${fav[index]['phone']}",
                  partC1: "${fav[index]['address']}",
                  partD1: "${fav[index]['link']}",
                  onpress:() async {
                int res = await SQL.Delete(
                "DELETE FROM 'Todo' WHERE id = ${fav[index]['id']}");
                if (res > 0) {
                fav.removeWhere(
                (element) => element["id"] == fav[index]["id"]);
                setState(() {});
                }
                },
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}

class Containerb extends StatelessWidget {
  final partA1;
  final partB1;
  final partC1;
  final partD1;
  final asmaa;
  final onpress;

  Containerb(
      {required this.partA1,
      required this.partB1,
      required this.partC1,
      required this.partD1,
      required this.asmaa,
      required this.onpress,});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Name: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  //SizedBox(width: 10,)
                  Text(
                    partA1,
                    style: TextStyle(
                        fontSize: 25,
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
                    "Phone: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  //SizedBox(width: 10,)
                  Text(
                    partB1,
                    style: TextStyle(
                        fontSize: 25,
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
                    "Address: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  //SizedBox(width: 10,)
                  Text(
                    partC1,
                    style: TextStyle(
                        fontSize: 25,
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
                    "Link GPS: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  //SizedBox(width: 10,)
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 200,
                      child: LinkText(
                        partD1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              IconButton(onPressed: onpress,icon: Icon(Icons.delete)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: UserButtom(
                    asmaa: asmaa,
                    namebutton: Text(
                      "Request",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    colorbutton: Colors.red[700]),
              ),
            ],)
          ],
        ),
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.red)));
  }
}

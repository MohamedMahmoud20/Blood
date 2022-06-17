import 'package:bloodbankasmaa/Conests.dart';
import 'package:bloodbankasmaa/Controller/Sqflite.dart';

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

  List userData = [];

  readddata() async {
    var rsponse = await SQL.Select("SELECT * FROM 'UserData'");
    if (mounted) {
      setState(() {});
    }
    userData.addAll(rsponse);
    return rsponse;
  }

  @override
  void initState() {
    readdata();
    readddata();
    super.initState();
  }

  bool reQ = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fav.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
              child: BodyListOfHospital(
                index: index,
                name: "${fav[index]['name']}",
                link: "${fav[index]['link']}",
                asmaa: "${fav[index]['name']}",
                address: "${fav[index]['address']}",
                onpress: () {},
                phone: "${fav[index]['phone']}",
              ));
        },
      ),
    );
  }
}

class BodyListOfHospital extends StatefulWidget {
  final name;
  final phone;
  final address;
  final link;
  final asmaa;
  final onpress;
  int index;

  BodyListOfHospital({
    required this.index,
    required this.name,
    required this.phone,
    required this.address,
    required this.link,
    required this.asmaa,
    required this.onpress,
  });

  @override
  State<BodyListOfHospital> createState() => _BodyListOfHospitalState();
}

class _BodyListOfHospitalState extends State<BodyListOfHospital> {
  SQFLITE SQL = SQFLITE();
  List fav = [];
  late List Userdata = [];
  late List data = [];

  readData() async {
    var rsponse = await SQL.Select("SELECT * FROM 'UserData'");
    if (mounted) {
      setState(() {});
    }
    Userdata.addAll(rsponse);
    return rsponse;
  }

  readDData() async {
    var rsponse = await SQL.Select("SELECT * FROM 'User'");
    if (mounted) {
      setState(() {});
    }
    data.addAll(rsponse);
    return rsponse;
  }

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
    readData();
    readDData();
    super.initState();
  }

  bool reQ = false;

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
                    widget.name,
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
                    "phone: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  //SizedBox(width: 10,)
                  Text(
                    widget.phone,
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
                    widget.address,
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
                        widget.link,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: widget.onpress, icon: Icon(Icons.delete)),
                (reQ == false)
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: MaterialButton(
                          color: Palette.googleColor,
                          onPressed: () async {
                            setState(() {
                              reQ = true;
                            });
                            await SQL.Insert(
                                '''INSERT INTO Request ('name' , 'phone' , 'email' , 'age' , 'bt', 'd-p' , 'Hospital')
                                        VALUES("${Userdata.last['name']}" , "${Userdata.last['phone']}" , "${Userdata.last['email']}" ,"${data.last['age']}" , "${data.last['PType']}" ,"${data.last['D%P']}" , "${fav[widget.index]['name']}" )  ''');

                            print(
                                "Hospital Name = = = ${fav[widget.index]['name']}");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text("Request",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ))
                    : Text(
                        "Done",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
              ],
            )
          ],
        ),
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.red)));
  }
}

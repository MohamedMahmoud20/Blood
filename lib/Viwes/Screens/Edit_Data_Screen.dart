import 'package:bloodbankasmaa/Controller/ApiLogin.dart';
import 'package:bloodbankasmaa/Controller/Sqflite.dart';
import 'package:bloodbankasmaa/Viwes/Screens/Test_______Blood.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/Row_Type.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/User_Buttomm.dart';
import 'package:flutter/material.dart';

class EditDataScreen extends StatefulWidget {
  static const String route = "EditDataScreen";

  //static const  A=0;
  @override
  _EditDataScreenState createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  static var A;
  static var B;

  static var AB;

  static var O;

  static var AN;

  static var BN;

  static var ABN;

  static var ON;
  SQFLITE SQL = SQFLITE();
  late List data;

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
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 170,
              width: 50,
              child: FutureBuilder(
                future: getProfile(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 100,
                                width: 50,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            "${snapshot.data["name"]}",
                                            //UserSignUpScreen.nameH,
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
                                            "Phone : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Colors.black),
                                          ),
                                          //SizedBox(width: 10,)
                                          Text(
                                            "${snapshot.data["phone"]}"
                                            //UserSignUpScreen.phoneH  ,
                                            ,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.red[700],
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.red)));
                          },
                        )
                      : Center(
                          child: Text(
                          "Loading.......",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red)),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(decoration: InputDecoration(label: Text("Patient Name"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
                  // ),
                  Rowtype(
                      bloodtype: "A+",
                      asmaa: (value) {
                        setState(() {
                          A = value;
                          print("Value A+ : ${A}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        A == null ? "" : "$A",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "B+",
                      asmaa: (value) {
                        setState(() {
                          B = value;
                          print("Value B+ : $B");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        B == null ? "" : "$B",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "AB+",
                      asmaa: (value) {
                        setState(() {
                          AB = value;
                          print("Value AB+ : $AB");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        AB == null ? "" : "$AB",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "O+",
                      asmaa: (value) {
                        setState(() {
                          O = value;
                          print("Value O+ : $O");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        O == null ? "" : "$O",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "A-",
                      asmaa: (value) {
                        setState(() {
                          AN = value;
                          print("Value A- : $AN");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        AN == null ? "" : "$AN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                    bloodtype: "B-",
                    asmaa: (value) {
                      setState(() {
                        BN = value;
                        print("Value B+ : $BN");
                      });
                    },
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        BN == null ? "" : "$BN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "O-",
                      asmaa: (value) {
                        setState(() {
                          ON = value;
                          print("Value O- : $ON");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        ON == null ? "" : "$ON",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "AB-",
                      asmaa: (value) {
                        setState(() {
                          ABN = value;
                          print("Value AB- : $ABN");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        ABN == null ? "" : "$ABN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserButtom(
                    asmaa: () {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.black,
                          content: Text("Saved Data..."));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    namebutton: Text("Edit Data",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    colorbutton: Colors.red[700]),
                MaterialButton(
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    await SQL.Insert(
                        '''INSERT INTO blood ('a+' , 'b+' , 'ab+' , 'o+' , 'o-' , 'ab-' , 'a-' , 'b-')
            VALUES("$A" , "$B" , "$AB" , "$O","$ON","$ABN","$AN" ,"$BN")  ''');
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Result();
                    }));
                  },
                  child: Text("Data"),
                  color: Colors.redAccent,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
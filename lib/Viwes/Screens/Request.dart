import 'package:flutter/material.dart';
import '../../Conests.dart';
import '../../Controller/ApiLogin.dart';
import '../../Controller/Sqflite.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({Key? key}) : super(key: key);
  static const String route = "RequestBloodScreen";

  @override
  State<RequestBloodScreen> createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  SQFLITE SQL = SQFLITE();
  late List Final =[];
  late List fav =[];
  var name ;
  readDData() async {
    var rsponse = await SQL.Select("SELECT * FROM 'Request'");
    if (mounted) {
      setState(() {});
    }
    Final.addAll(rsponse);
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
    readDData();
    super.initState();
    Readn().then((value){
      return name= value;
    });
  }
  @override
  Widget build(BuildContext context) {
    //
    // test(){
    //   var result;
    //   for(int i=0 ;i<=fav.length; i++){
    //     result=  fav[i]['name']=Final[i]['Hospital'];
    //   }
    //   print("Result = = $result");
    //   return result;
    // };
    // var namefiltr= fav.where((element) => element['name']=="${test()}");
    var Filter =
    Final.where((element) => element['Hospital'] == "$name").toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Requests"),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
          itemCount: Filter.length,
          itemBuilder: (BuildContext context, int index) {
            return (Filter.isNotEmpty)?
            Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 12.0),
                child:
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BodyListOfRequest(
                            index: index,
                            name: "${Filter[index]['name']}",
                            filter: "${Filter[index]['Hospital']}",
                            phone: "${Filter[index]['phone']}",
                            email: "${Filter[index]['email']}",
                            age: "${Filter[index]['age']}",
                            bloodType: "${Filter[index]['bt']}",
                            DOrP: "${Filter[index]['d-p']}",
                          )
                        ]))):
            Center(child:
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text("No Requests" , style:
              TextStyle( fontSize: 20 , fontWeight: FontWeight.w400),),
            ),)
            ;
          }),
    );
  }
}

class BodyListOfRequest extends StatefulWidget {
  final name;
  final phone;
  final email;
  final bloodType;
  final age;
  final DOrP;
  final index;
  final filter;

  BodyListOfRequest(
      {
        required this.index,
        required this.name,
        required this.filter,
        required this.phone,
        required this.email,
        required this.bloodType,
        required this.age,
        required this.DOrP});

  @override
  State<BodyListOfRequest> createState() => _BodyListOfRequestState();
}

class _BodyListOfRequestState extends State<BodyListOfRequest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.center,
                        child:
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: Colors.white.withOpacity(.2),
                                  child:
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "${widget.filter}",
                                      style: TextStyle(
                                          color: Palette.activeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ))
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text(
                              "Name: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.orange),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 250,
                                child: Text(
                                    widget.name,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.teal[900]
                                    ))),
                          ])
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text(
                              "email: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.orange),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 250,
                                child: Text(
                                    widget.email,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.teal[900]
                                    ))),
                          ])
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
                                  color: Colors.orange),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 250,
                                child: Text(
                                    widget.phone,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.teal[900]
                                    ))),
                          ])
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text(
                              "bloodType: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.orange),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 150,
                                child: Text(
                                    widget.bloodType,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.teal[900]
                                    ))),
                          ])
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text(
                              "DOrP: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.orange),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 250,
                                child: Text(
                                    widget.DOrP,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.teal[900]
                                    ))),
                          ])
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text(
                              "Age: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.orange),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 250,
                                child: Text(
                                    widget.age,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.teal[900]
                                    ))),
                          ])
                  ),
                  IconButton(onPressed: () async{
                    setState(() async{
                      await SQL.deleteAll();
                    });
                  }, icon: const Icon(Icons.delete)),
                ])));
  }
}
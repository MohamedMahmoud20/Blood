// ignore_for_file: non_constant_identifier_names, file_names, avoid_print, prefer_const_constructors

import 'package:bloodbankasmaa/Controller/Sqflite.dart';
import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
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
    var Size = MediaQuery.of(context);

    return Scaffold(

      body: ListView.builder(
        itemCount: fav.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(margin: EdgeInsets.all(10),shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
            child:SizedBox(
                height: Size.size.height / 13,
                child: ListTile(
                  onTap: (){},
                  onLongPress: () async {
                    int res = await SQL.Delete(
                        "DELETE FROM 'Todo' WHERE id = ${fav[index]['id']}");
                    if (res > 0) {
                      fav.removeWhere(
                              (element) => element["id"] == fav[index]["id"]);
                      setState(() {});
                      print("Done");
                    }
                  },


                  title: Text(
                    "${fav[index]['name']}",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text("${fav[index]['phone']}"),
                  leading: Text("${fav[index]['address']}")
                  ,trailing:Text("${fav[index]['link']}") ,
                )),
          );
        },
      ),
    );
  }
}